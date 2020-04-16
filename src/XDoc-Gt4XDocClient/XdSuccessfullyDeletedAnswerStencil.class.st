Class {
	#name : #XdSuccessfullyDeletedAnswerStencil,
	#superclass : #XdCommandAnswerStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdSuccessfullyDeletedAnswerStencil >> create [
	<return: #BlElement>
	^ self newPage 
		addChild: self newPublishedTitle
]

{ #category : #streams }
XdSuccessfullyDeletedAnswerStencil >> labelsAndInputFieldsOn: aStream [
	self shouldNotImplement
]

{ #category : #'instance creation' }
XdSuccessfullyDeletedAnswerStencil >> newPublishedTitle [
	^ self newTitleLabel
		text: 'Successfully Deleted'
]
