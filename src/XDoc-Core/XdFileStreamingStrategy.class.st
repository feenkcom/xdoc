Class {
	#name : #XdFileStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#instVars : [
		'file',
		'fileSystem'
	],
	#category : #'XDoc-Core-Model'
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

{ #category : #streams }
XdFileStreamingStrategy >> readStream [
	"Return a binary read stream"
	^ self file binaryReadStream
]

{ #category : #writing }
XdFileStreamingStrategy >> writeStreamDo: aBlock [
	self assert: [ file notNil ] description: ['File must be defined before writing.'].
	file ensureDelete.
	^ file binaryWriteStreamDo: aBlock.
]
