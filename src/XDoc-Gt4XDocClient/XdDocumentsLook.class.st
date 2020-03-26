Class {
	#name : #XdDocumentsLook,
	#superclass : #BrLook,
	#instVars : [
		'client'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdDocumentsLook >> client [
	^ client
]

{ #category : #accessing }
XdDocumentsLook >> client: anXdClient [
	self
		assert: [ anXdClient notNil ] 
		description: [ 'XDoc client must be non-nil' ].
	client := anXdClient.
	self onClientChange.
]

{ #category : #initialization }
XdDocumentsLook >> initialize [
	super initialize.
	client := XdClient null.
	
]

{ #category : #initialization }
XdDocumentsLook >> initializeListeners [
	super initializeListeners.
	self when: XdClientChanged do: [ :anEvent | self client: anEvent client ].
]

{ #category : #initialization }
XdDocumentsLook >> initializeRequests [
	super initializeRequests.
	self request: XdClientRequest new.
]

{ #category : #hooks }
XdDocumentsLook >> onClientChange [
]
