Class {
	#name : #XdShareUpdateDialogStencil,
	#superclass : #XdSharePublishDialogStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - UI'
}

{ #category : #streams }
XdShareUpdateDialogStencil >> labelsAndInputFieldsOn: aStream [
	aStream
		nextPut: self newUrlLabel;
		nextPut: self newUrlInputField.
	super labelsAndInputFieldsOn: aStream.
]

{ #category : #'instance creation' }
XdShareUpdateDialogStencil >> newUrlInputField [
	^ self newCodeInputField
]

{ #category : #'instance creation' }
XdShareUpdateDialogStencil >> newUrlLabel [
	^ self newLabel
		text: 'Existing URL:'
]
