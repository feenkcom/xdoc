Class {
	#name : #XdExceptionAnswerStencil,
	#superclass : #XdCommandAnswerStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdExceptionAnswerStencil >> create [
	<return: #BlElement>
	^ self newPage 
		addChild: self newTitle;
		addChild: self newFields
]

{ #category : #accessing }
XdExceptionAnswerStencil >> errorMessage [
	^ self answer message
]

{ #category : #streams }
XdExceptionAnswerStencil >> labelsAndInputFieldsOn: aStream [
	aStream 
		nextPut: self newContentLabel;
		nextPut: self newContentEditor
]

{ #category : #'instance creation' }
XdExceptionAnswerStencil >> newContentEditor [
	^ self newReadOnlyInputField
		text: self errorMessage
]

{ #category : #'instance creation' }
XdExceptionAnswerStencil >> newContentLabel [
	^ self newLabel
		text: 'Message:'
]

{ #category : #'instance creation' }
XdExceptionAnswerStencil >> newTitle [
	^ self newTitleLabel
		text: 'Exception'
]
