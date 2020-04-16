Class {
	#name : #XdShareUpdateDialogWithAuthenticationStencil,
	#superclass : #XdShareUpdateDialogStencil,
	#traits : 'TXdShareAuthenticationInputFields',
	#classTraits : 'TXdShareAuthenticationInputFields classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #streams }
XdShareUpdateDialogWithAuthenticationStencil >> labelsAndInputFieldsOn: aStream [
	super labelsAndInputFieldsOn: aStream.
	aStream nextPut: self newHorizontalSeparatorElement.
	self authenticationLabelsAndInputFieldsOn: aStream.
]
