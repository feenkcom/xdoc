Class {
	#name : #XdShareSuccessResponseDialogStencil,
	#superclass : #XdShareResponseDialogStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdShareSuccessResponseDialogStencil >> create [
	<return: #BlElement>
	^ self newPage addChild: self newFields
]

{ #category : #streams }
XdShareSuccessResponseDialogStencil >> labelsAndInputFieldsOn: aStream [
	aStream 
		nextPut: self newStatusLabel;
		nextPut: self newStatusInputField
]
