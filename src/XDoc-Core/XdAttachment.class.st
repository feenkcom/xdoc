Class {
	#name : #XdAttachment,
	#superclass : #Object,
	#instVars : [
		'id',
		'fileName',
		'fileSize'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdAttachment >> fileName [
	<return: #String>
	^ fileName
]

{ #category : #accessing }
XdAttachment >> fileName: aString [
	self
		assert: [ aString notNil ]
		description: [ 'Attachment filename must be non-nil' ].
	fileName := aString
]

{ #category : #accessing }
XdAttachment >> fileSize [
	<return: #Integer>
	^ fileSize
]

{ #category : #accessing }
XdAttachment >> fileSize: anInteger [
	self
		assert: [ anInteger notNil ]
		description: [ 'Attachment filename size must be non-nil' ].
	self
		assert: [ anInteger >= 0 ]
		description: [ 'Attachment filename size must be pozitive number' ].
	fileSize := anInteger
]

{ #category : #accessing }
XdAttachment >> id [
	<return: #String>
	^ id
]

{ #category : #accessing }
XdAttachment >> id: aString [
	self
		assert: [ aString notNil ]
		description: [ 'Attachment id must be non-nil' ].
	id := aString
]

{ #category : #initialization }
XdAttachment >> initialize [
	super initialize.
	fileName := nil.
	fileSize := 0.
	id := nil.
]
