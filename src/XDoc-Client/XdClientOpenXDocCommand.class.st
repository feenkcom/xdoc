Class {
	#name : #XdClientOpenXDocCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'fileReference',
		'xdFile'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdClientOpenXDocCommand >> execute [
	"Document type should decide how to open (be displayed) in Pharo"
	self xdFile: (XdFile fromFileReference: self fileReference).
	^ self xdFile openInPharo.
]

{ #category : #accessing }
XdClientOpenXDocCommand >> fileReference [
	<return: #FileReference>
	^ fileReference
]

{ #category : #accessing }
XdClientOpenXDocCommand >> fileReference: aFileReference [
	self
		assert: [ aFileReference notNil ]
		description: [ 'XDoc file reference must be non-nil' ].
	self
		assert: [ aFileReference exists ]
		description: [ 'XDoc file reference must exist' ].
	fileReference := aFileReference
]

{ #category : #accessing }
XdClientOpenXDocCommand >> xdFile [
	^ xdFile
]

{ #category : #accessing }
XdClientOpenXDocCommand >> xdFile: anObject [
	xdFile := anObject
]
