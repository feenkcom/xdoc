Class {
	#name : #XdCommandAnswerStencil,
	#superclass : #XdShareInputFieldsDialogStencil,
	#instVars : [
		'answer'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #testing }
XdCommandAnswerStencil class >> isAbstract [
	^ self name = #XdCommandAnswerStencil 
]

{ #category : #accessing }
XdCommandAnswerStencil >> answer [
	^ answer
]

{ #category : #accessing }
XdCommandAnswerStencil >> answer: anObject [
	answer := anObject
]

{ #category : #'instance creation' }
XdCommandAnswerStencil >> newStatusInputField [
	^ self newReadOnlyInputField 
		text: self responseStatusLineMessage
]

{ #category : #'instance creation' }
XdCommandAnswerStencil >> newStatusLabel [
	^ self newLabel
		text: 'Status:'
]

{ #category : #accessing }
XdCommandAnswerStencil >> responseStatusLineMessage [
	^ self answer statusLineMessage
]
