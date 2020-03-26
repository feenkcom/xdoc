Class {
	#name : #XdDocumentsModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'client'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdDocumentsModel >> client [
	<return: #XdClient>
	^ client
]

{ #category : #accessing }
XdDocumentsModel >> client: anXdClient [
	self
		assert: [ anXdClient notNil ] 
		description: [ 'XDoc client must be non-nil' ].
	client := anXdClient.
	self notifyClientChanged.
]

{ #category : #initialization }
XdDocumentsModel >> initialize [
	super initialize.
	client := XdClient null.
]

{ #category : #initialization }
XdDocumentsModel >> initializeListeners [
	super initializeListeners.
	self when: XdClientRequest reply: [ :aResponse | aResponse client: self client ].
]

{ #category : #notifying }
XdDocumentsModel >> notifyClientChanged [
	self dispatchEvent: (XdClientChanged new client: self client)
]
