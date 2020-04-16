Class {
	#name : #XdSuccessfullyPublishedAnswerStencil,
	#superclass : #XdCommandAnswerStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdSuccessfullyPublishedAnswerStencil >> create [
	<return: #BlElement>
	^ self newPage 
		addChild: self newPublishedTitle;
		addChild: self newFields
]

{ #category : #streams }
XdSuccessfullyPublishedAnswerStencil >> labelsAndInputFieldsOn: aStream [
	aStream 
		nextPut: self newUrlLabel;
		nextPut: self newUrlInputField
]

{ #category : #'instance creation' }
XdSuccessfullyPublishedAnswerStencil >> newPublishedTitle [
	^ self newTitleLabel
		text: 'Successfully Published'
]

{ #category : #'instance creation' }
XdSuccessfullyPublishedAnswerStencil >> newUrlInputField [
	^ self newInputField
		text: self answer publicUrl asString
]

{ #category : #'instance creation' }
XdSuccessfullyPublishedAnswerStencil >> newUrlLabel [
	^ self newLabel
		text: 'Published at:'
]
