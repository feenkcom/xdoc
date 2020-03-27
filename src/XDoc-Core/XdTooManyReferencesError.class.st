Class {
	#name : #XdTooManyReferencesError,
	#superclass : #XdReferenceError,
	#instVars : [
		'possibleReferences'
	],
	#category : #'XDoc-Core-Exceptions'
}

{ #category : #initialization }
XdTooManyReferencesError >> initialize [
	super initialize.
	possibleReferences := #().
]

{ #category : #accessing }
XdTooManyReferencesError >> possibleReferences [
	^ possibleReferences
]

{ #category : #accessing }
XdTooManyReferencesError >> possibleReferences: anObject [
	possibleReferences := anObject
]
