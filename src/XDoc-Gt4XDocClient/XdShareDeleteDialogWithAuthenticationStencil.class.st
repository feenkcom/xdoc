Class {
	#name : #XdShareDeleteDialogWithAuthenticationStencil,
	#superclass : #XdShareDeleteDialogStencil,
	#traits : 'TXdShareAuthenticationInputFields',
	#classTraits : 'TXdShareAuthenticationInputFields classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #streams }
XdShareDeleteDialogWithAuthenticationStencil >> labelsAndInputFieldsOn: aStream [
	super labelsAndInputFieldsOn: aStream.
	aStream nextPut: self newHorizontalSeparatorElement.
	self authenticationLabelsAndInputFieldsOn: aStream.
]
