Class {
	#name : #XdAuthenticationCommand,
	#superclass : #XdDelegateCommand,
	#category : #'XDoc-Client-Commands'
}

{ #category : #authentication }
XdAuthenticationCommand >> authenticate [
	self subclassResponsibility
]

{ #category : #execution }
XdAuthenticationCommand >> execute [
	self authenticate.
	self executeSubCommand
]
