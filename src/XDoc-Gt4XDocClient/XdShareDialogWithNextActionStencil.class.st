Class {
	#name : #XdShareDialogWithNextActionStencil,
	#superclass : #XdShareDialogStencil,
	#traits : 'TXdShareNextActionAccessors',
	#classTraits : 'TXdShareNextActionAccessors classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - UI'
}

{ #category : #testing }
XdShareDialogWithNextActionStencil class >> isAbstract [ 
	^ self name = #XdShareDialogWithNextActionStencil 
]

{ #category : #'instance creation' }
XdShareDialogWithNextActionStencil >> newNextButton [
	| aButton |
	aButton := self newButton 
		label: self nextActionLabel;
		margin: self newLineMarginInsets;
		constraintsDo: [ :c |
			c linear horizontal alignRight ].
	aButton action: [ self nextAction cull: aButton ].
	^ aButton
]
