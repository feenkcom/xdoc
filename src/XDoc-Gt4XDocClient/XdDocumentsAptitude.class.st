Class {
	#name : #XdDocumentsAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'client'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdDocumentsAptitude >> client [
	^ client
]

{ #category : #accessing }
XdDocumentsAptitude >> client: anXdClient [
	self
		assert: [ anXdClient notNil ] 
		description: [ 'XDoc client must be non-nil' ].
	client := anXdClient.
	self onClientChange.
]

{ #category : #initialization }
XdDocumentsAptitude >> initialize [
	super initialize.
	client := XdClient null.
	
]

{ #category : #initialization }
XdDocumentsAptitude >> initializeListeners [
	super initializeListeners.
	self when: XdClientChanged do: [ :anEvent | self client: anEvent client ].
]

{ #category : #initialization }
XdDocumentsAptitude >> initializeRequests [
	super initializeRequests.
	self request: XdClientRequest new.
]

{ #category : #hooks }
XdDocumentsAptitude >> onClientChange [
]
