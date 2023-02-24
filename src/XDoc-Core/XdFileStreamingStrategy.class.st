Class {
	#name : #XdFileStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#traits : 'TXdReadStream',
	#classTraits : 'TXdReadStream classTrait',
	#instVars : [
		'file',
		'fileSystem',
		'extracted'
	],
	#category : #'XDoc-Core-Streaming'
}

{ #category : #'file system' }
XdFileStreamingStrategy >> detectFileReference: aDetectBlock ifFound: aFoundBlock ifNone: aNotFoundBlock [
	<return: #FileReference>
	^ self fileSystem root children
		detect: aDetectBlock
		ifFound: aFoundBlock
		ifNone: aNotFoundBlock
]

{ #category : #testing }
XdFileStreamingStrategy >> exists [
	<return: #Boolean>
	^ self file notNil and: [ self file exists ]
]

{ #category : #'private - accessing' }
XdFileStreamingStrategy >> extracted [
	"Return a directory in which XDoc ZIP content is extracted"
	<return: #FileReference>
	^ extracted
]

{ #category : #'private - accessing' }
XdFileStreamingStrategy >> extracted: aDirectory [
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
XdFileStreamingStrategy >> file [
	<return: #FileReference or: nil>
	^ file
]

{ #category : #accessing }
XdFileStreamingStrategy >> file: aFileReference [
	self 
		assert: [ aFileReference notNil ] 
		description: [ 'File reference must be non-nil' ].
	self 
		assert: [ aFileReference exists 
			ifTrue: [ aFileReference isFile and: [ aFileReference isWritable ] ]
			ifFalse: [ true ] ] 
		description: [ 'File reference must be a writtable file' ].
	file := aFileReference
]

{ #category : #accessing }
XdFileStreamingStrategy >> fileSystem [
	<return: #FileSystem>
	fileSystem ifNil: [ fileSystem := FileSystem zip: self. fileSystem open ].
	^ fileSystem	
]

{ #category : #accessing }
XdFileStreamingStrategy >> memberNamed: aFileName [ 
	<return: #ArchiveMember>
	^ self zip memberNamed: aFileName
]

{ #category : #'api - streams' }
XdFileStreamingStrategy >> open [
	"Prepare the document for reading and editing"

	| aDirectory |
	self extracted ifNotNil: [ ^ self ].
	aDirectory := self
			binaryReadStreamDo: [ :aStream | 
				XdUtility
					extract: aStream
					inTempDirectoryWithBasename: self file basenameWithoutExtension ].
	self extracted: aDirectory.
]

{ #category : #streams }
XdFileStreamingStrategy >> readStream [
	"Return a binary read stream"
	^ self file binaryReadStream
]

{ #category : #'api - streams' }
XdFileStreamingStrategy >> writeStreamDo: aBlock [
	self assert: [ file notNil ] description: ['File must be defined before writing.'].
	file ensureDelete.
	^ file binaryWriteStreamDo: aBlock.
]
