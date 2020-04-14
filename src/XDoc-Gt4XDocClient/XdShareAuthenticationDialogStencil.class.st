Class {
	#name : #XdShareAuthenticationDialogStencil,
	#superclass : #XdShareInputFieldsDialogStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - UI'
}

{ #category : #'api - instantiation' }
XdShareAuthenticationDialogStencil >> create [
	^ self newPage
		addChild: self newFields;
		addChild: self newNextButton
]

{ #category : #'instance creation' }
XdShareAuthenticationDialogStencil >> labelsAndInputFieldsOn: aStream [
		aStream 
			nextPut: self newUserLabel;
			nextPut: self newUserInputField;
			nextPut: self newPasswordLabel;
			nextPut: self newPasswordInputField
]

{ #category : #'instance creation' }
XdShareAuthenticationDialogStencil >> newPasswordInputField [
	^ self newSecretInputField
]

{ #category : #'instance creation' }
XdShareAuthenticationDialogStencil >> newPasswordLabel [
	^ self newLabel
		text: 'Password:'
]

{ #category : #'instance creation' }
XdShareAuthenticationDialogStencil >> newUserInputField [
	^ self newInputFieldWith: #username
]

{ #category : #'instance creation' }
XdShareAuthenticationDialogStencil >> newUserLabel [
	^ self newLabel
		text: 'Username:'
]
