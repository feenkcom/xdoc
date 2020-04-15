Class {
	#name : #XdShareActionsChanged,
	#superclass : #XdShareEvent,
	#traits : 'TXdShareActionsAccess',
	#classTraits : 'TXdShareActionsAccess classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Events'
}

{ #category : #initialization }
XdShareActionsChanged >> initialize [
	super initialize.
	self initializeActions.
]
