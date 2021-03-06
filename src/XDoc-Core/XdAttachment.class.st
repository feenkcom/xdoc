Class {
	#name : #XdAttachment,
	#superclass : #XdModel,
	#instVars : [
		'id',
		'fileName',
		'fileSize'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #requirements }
XdAttachment class >> empty [
	^ XdEmptyAttachment default
]

{ #category : #converting }
XdAttachment >> asXdStringReadStream [
	^ XdAttachmentStringReadStream new
		attachment: self
]

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

{ #category : #printing }
XdAttachment >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '(id: ';
		print: self id;
		nextPutAll: ', fileName: ';
		print: self fileName;
		nextPutAll: ', fileSize: ';
		print: self fileSize;
		nextPut: $
	
]
