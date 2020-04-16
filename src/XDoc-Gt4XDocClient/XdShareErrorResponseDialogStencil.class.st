Class {
	#name : #XdShareErrorResponseDialogStencil,
	#superclass : #XdShareResponseDialogStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdShareErrorResponseDialogStencil >> create [
	<return: #BlElement>
	^ self newPage addChild: self newFields
]

{ #category : #streams }
XdShareErrorResponseDialogStencil >> labelsAndInputFieldsOn: aStream [
	aStream 
		nextPut: self newStatusLabel;
		nextPut: self newStatusInputField
]
