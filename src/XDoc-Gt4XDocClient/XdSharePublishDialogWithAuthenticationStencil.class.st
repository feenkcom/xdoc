Class {
	#name : #XdSharePublishDialogWithAuthenticationStencil,
	#superclass : #XdSharePublishDialogStencil,
	#traits : 'TXdShareAuthenticationInputFields',
	#classTraits : 'TXdShareAuthenticationInputFields classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #streams }
XdSharePublishDialogWithAuthenticationStencil >> labelsAndInputFieldsOn: aStream [
	super labelsAndInputFieldsOn: aStream.
	aStream nextPut: self newHorizontalSeparatorElement.
	self authenticationLabelsAndInputFieldsOn: aStream.
]
