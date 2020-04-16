Class {
	#name : #XdShareAuthenticationRequieredAnswerStencil,
	#superclass : #XdCommandAnswerStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdShareAuthenticationRequieredAnswerStencil >> create [
	<return: #BlElement>
	^ self newPage 
		addChild: self newTitle
]

{ #category : #streams }
XdShareAuthenticationRequieredAnswerStencil >> labelsAndInputFieldsOn: aStream [
	self shouldNotImplement 
]

{ #category : #'instance creation' }
XdShareAuthenticationRequieredAnswerStencil >> newTitle [
	^ self newTitleLabel
		text: 'Authentication Failed'
]
