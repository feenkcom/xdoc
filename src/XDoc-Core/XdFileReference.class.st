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
