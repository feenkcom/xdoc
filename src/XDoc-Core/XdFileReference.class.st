Class {
	#name : #XdFileReference,
	#superclass : #XdReference,
	#instVars : [
		'file'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #testing }
XdFileReference >> exists [
	<return: #Boolean>
	^ self file notNil and: [ self file exists ]
]

{ #category : #accessing }
XdFileReference >> file [
	<return: #FileReference or: nil>
	^ file
]

{ #category : #accessing }
XdFileReference >> file: aFileReference [
	self 
		assert: [ aFileReference notNil ] 
		description: [ 'File reference must be non-nil' ].
	file := aFileReference
]

{ #category : #streams }
XdFileReference >> readStream [
	"Return a binary read stream"
	^ self file binaryReadStream
]

{ #category : #'as yet unclassified' }
XdFileReference >> writeStreamDo: aBlock [
	self assert: [ file notNil ] description: ['File must be defined before writing.'].
	^ file binaryWriteStreamDo: aBlock.
]
