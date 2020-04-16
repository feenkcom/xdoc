Class {
	#name : #XdShareInputFieldsDialogStencil,
	#superclass : #XdShareDialogWithNextActionStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #testing }
XdShareInputFieldsDialogStencil class >> isAbstract [ 
	^ self name = #XdShareInputFieldsDialogStencil  
]

{ #category : #streams }
XdShareInputFieldsDialogStencil >> labelsAndInputFieldsOn: aStream [
	self subclassResponsibility
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newAuthorInputField [
	^ self newInputFieldWith: self constants authorOptionName
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newAuthorLabel [
	^ self newLabel
		text: 'Author:'
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newFields [
	^ BlElement new 
		layout: (BlGridLayout new columnCount: 2);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChildren: self newLabelsAndInputFields.
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newLabelsAndInputFields [
	^ Array
		streamContents:
			[ :aStream | 
				self labelsAndInputFieldsOn: aStream.
			]
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newPasswordInputField [
	^ self newSecretInputFieldWith: self constants passwordOptionName.
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newPasswordLabel [
	^ self newLabel
		text: 'Password:'
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newUserInputField [
	^ self newInputFieldWith: self constants usernameOptionName
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newUserLabel [
	^ self newLabel
		text: 'Username:'
]
