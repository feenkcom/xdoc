Class {
	#name : #XdFileStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#instVars : [
		'file'
	],
	#category : #'XDoc-Core-Model'
}

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
	file := aFileReference
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
	^ file binaryWriteStreamDo: aBlock.
]
