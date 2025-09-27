Class {
	#name : #XdSuccessfullyCreatedAnswer,
	#superclass : #XdSuccessfulAnswer,
	#category : #'XDoc-Client-Answers'
}

{ #category : #testing }
XdSuccessfullyCreatedAnswer class >> isAbstract [
	^ self name = #XdSuccessfullyCreatedAnswer 
]
