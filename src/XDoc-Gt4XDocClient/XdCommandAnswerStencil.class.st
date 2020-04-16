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
