Class {
	#name : #XdBytesStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#traits : 'TXdReadStream',
	#classTraits : 'TXdReadStream classTrait',
	#instVars : [
		'bytes',
		'fileSystem',
		'extracted'
	],
	#category : #'XDoc-Core-Streaming'
}

{ #category : #accessing }
XdBytesStreamingStrategy >> bytes [
	<return: #ByteArray or: nil>
	^ bytes
]

{ #category : #accessing }
XdBytesStreamingStrategy >> bytes: aByteArray [
	self 
		assert: [ aByteArray notNil ] 
		description: [ 'Bytes must be non-nil' ].
	bytes := aByteArray
]

{ #category : #'file system' }
XdBytesStreamingStrategy >> detectFileReference: aDetectBlock ifFound: aFoundBlock ifNone: aNotFoundBlock [
	<return: #FileReference>
	^ self fileSystem root children
		detect: aDetectBlock
		ifFound: aFoundBlock
		ifNone: aNotFoundBlock
]

{ #category : #'api - streams' }
XdBytesStreamingStrategy >> detectReferenceNamed: aFileName ifFound: aFoundBlock ifNone: aNotFoundBlock [
	<return: #XdReadStreamReference>
	| theFileReferences |
	theFileReferences := self fileSystem root allChildrenMatching: aFileName.
	theFileReferences size > 1 ifTrue: [ 
		^ XdTooManyReferencesError new 
			fileName: aFileName;
			possibleReferences: theFileReferences;
			signal: 'Too many ''', aFileName asString, ''' references' ].
	theFileReferences size isZero ifTrue: [ ^ aNotFoundBlock value ].
	^ XdReadStreamReference new
		fileName: aFileName;
		stream: theFileReferences first.
]

{ #category : #testing }
XdBytesStreamingStrategy >> exists [
	<return: #Boolean>
	^ self bytes notNil
]

{ #category : #'private - accessing' }
XdBytesStreamingStrategy >> extracted [
	"Return a directory in which XDoc ZIP content is extracted"
	<return: #FileReference>
	^ extracted
]

{ #category : #'private - accessing' }
XdBytesStreamingStrategy >> extracted: aDirectory [
	"Set a directory in which XDoc ZIP content is extracted"
	self 
		assert: [ aDirectory isNotNil ] 
		description: [ 'Directory must be non-nil' ].
	self 
		assert: [ aDirectory exists ] 
		description: [ 'Directory must exist' ].
	self 
		assert: [ aDirectory isDirectory ] 
		description: [ 'Directory must be a dirrectory' ].
	extracted := aDirectory
]

{ #category : #accessing }
XdBytesStreamingStrategy >> fileSystem [
	<return: #FileSystem>
	fileSystem ifNil: [ fileSystem := FileSystem zip: self. fileSystem open ].
	^ fileSystem	
]

{ #category : #'api - streams' }
XdBytesStreamingStrategy >> open [
	"Prepare the document for reading and editing"
	| aDirectory |
	self extracted ifNotNil: [ ^ self ].
	aDirectory := self binaryReadStreamDo: [ :aStream |
		XdUtility 
			extractInTempDirectory: aStream
			basename: 'xdoc-bytes' ].
	self extracted: aDirectory.
]

{ #category : #streams }
XdBytesStreamingStrategy >> readStream [
	self 
		assert: [ self exists ]
		description: [ 'Bytes must be defined before reading them' ].
	^ self bytes readStream
]

{ #category : #streams }
XdBytesStreamingStrategy >> writeStreamDo: aValuable [
	"Evaluates the argument with a write stream. Answers the result."	
	| inMemoryStream result |

	inMemoryStream := ByteArray new writeStream.
	result := aValuable value: inMemoryStream binary.
	bytes := inMemoryStream contents.
	^ result. 
]
