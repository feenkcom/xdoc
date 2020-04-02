Class {
	#name : #XdAuthenticationCommand,
	#superclass : #XdDelegateCommand,
	#category : #'XDoc-Client-Commands'
}

{ #category : #visitor }
XdAuthenticationCommand >> accept: aVisitor [
	^ aVisitor visitXdAuthenticationCommand: self
]

{ #category : #authentication }
XdAuthenticationCommand >> authenticate [
	self subclassResponsibility
]

{ #category : #execution }
XdAuthenticationCommand >> execute [
	self authenticate.
	self executeSubCommand
]
