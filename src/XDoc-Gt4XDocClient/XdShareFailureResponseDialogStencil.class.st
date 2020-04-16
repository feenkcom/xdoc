Class {
	#name : #XdShareFailureResponseDialogStencil,
	#superclass : #XdShareResponseDialogStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdShareFailureResponseDialogStencil >> create [
	<return: #BlElement>
	^ self newPage addChild: self newFields
]

{ #category : #streams }
XdShareFailureResponseDialogStencil >> labelsAndInputFieldsOn: aStream [
	aStream 
		nextPut: self newStatusLabel;
		nextPut: self newStatusInputField
]
