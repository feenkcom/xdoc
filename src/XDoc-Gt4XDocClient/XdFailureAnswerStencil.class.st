Class {
	#name : #XdFailureAnswerStencil,
	#superclass : #XdCommandAnswerStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdFailureAnswerStencil >> create [
	<return: #BlElement>
	^ self newPage 
		addChild: self newTitle;
		addChild: self newFields
]

{ #category : #accessing }
XdFailureAnswerStencil >> errorMessage [
	^ self answer message
]

{ #category : #streams }
XdFailureAnswerStencil >> labelsAndInputFieldsOn: aStream [
	aStream 
		nextPut: self newStatusLabel;
		nextPut: self newStatusInputField;
		nextPut: self newContentLabel;
		nextPut: self newContentEditor
]

{ #category : #'instance creation' }
XdFailureAnswerStencil >> newContentEditor [
	^ self newReadOnlyInputField
		text: self errorMessage
]

{ #category : #'instance creation' }
XdFailureAnswerStencil >> newContentLabel [
	^ self newLabel
		text: 'Message:'
]

{ #category : #'instance creation' }
XdFailureAnswerStencil >> newTitle [
	^ self newTitleLabel
		text: 'Failure'
]
