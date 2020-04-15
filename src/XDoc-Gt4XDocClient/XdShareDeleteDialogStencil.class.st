Class {
	#name : #XdShareDeleteDialogStencil,
	#superclass : #XdShareInputFieldsDialogStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdShareDeleteDialogStencil >> create [
	^ self newPage
		addChild: self newFields;
		addChild: self newNextButton
]

{ #category : #streams }
XdShareDeleteDialogStencil >> labelsAndInputFieldsOn: aStream [
	aStream 
		nextPut: self newUrlLabel;
		nextPut: self newUrlInputField
]

{ #category : #'instance creation' }
XdShareDeleteDialogStencil >> newUrlInputField [
	^ self newCodeInputFieldWith: self constants publicUrlOptionName
]

{ #category : #'instance creation' }
XdShareDeleteDialogStencil >> newUrlLabel [
	^ self newLabel
		text: 'Existing URL:'
]
