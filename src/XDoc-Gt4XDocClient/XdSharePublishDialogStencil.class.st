Class {
	#name : #XdSharePublishDialogStencil,
	#superclass : #XdShareInputFieldsDialogStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdSharePublishDialogStencil >> create [
	^ self newPage
		addChild: self newFields;
		addChild: self newNextButton.
]

{ #category : #streams }
XdSharePublishDialogStencil >> labelsAndInputFieldsOn: aStream [
	aStream
		nextPut: self newTitleLabel;
		nextPut: self newTitleInputField;
		nextPut: self newAuthorLabel;
		nextPut: self newAuthorInputField;
		nextPut: self newDescriptionLabel;
		nextPut: self newDescriptionInputField.
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newDescriptionInputField [
	^ self newInputEditorWith: self constants descriptionOptionName
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newDescriptionLabel [
	^ self newLabel
		text: 'Description:'
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newTitleInputField [
	^ self newInputFieldWith: self constants titleOptionName
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newTitleLabel [
	^ self newLabel
		text: 'Title:'
]
