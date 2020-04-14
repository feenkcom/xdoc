Class {
	#name : #XdShareInformationChanged,
	#superclass : #XdShareEvent,
	#traits : 'TXdShareInformationAccess',
	#classTraits : 'TXdShareInformationAccess classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Events'
}

{ #category : #initialization }
XdShareInformationChanged >> initialize [
	super initialize.
	self initializeInformation.
]
