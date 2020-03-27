Class {
	#name : #XdDocumentsElement,
	#superclass : #BlElement,
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdDocumentsElement >> client [
	<return: #XdClient>
	^ self viewModel client
]

{ #category : #accessing }
XdDocumentsElement >> client: anXdClient [
	self viewModel client: anXdClient
]

{ #category : #initialization }
XdDocumentsElement >> initialize [
	super initialize.
	self viewModel: XdDocumentsModel new.
	self constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
]
