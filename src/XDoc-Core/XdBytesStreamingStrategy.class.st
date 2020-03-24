Class {
	#name : #XdBytesStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#traits : 'TXdReadStream',
	#classTraits : 'TXdReadStream classTrait',
	#instVars : [
		'bytes',
		'fileSystem'
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
	<return: #XdStreamReference>
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

{ #category : #accessing }
XdBytesStreamingStrategy >> fileSystem [
	<return: #FileSystem>
	fileSystem ifNil: [ fileSystem := FileSystem zip: self. fileSystem open ].
	^ fileSystem	
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
