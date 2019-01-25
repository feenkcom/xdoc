Class {
	#name : #XdDocumentsLook,
	#superclass : #BrLook,
	#instVars : [
		'client',
		'list'
	],
	#category : #'XDoc-Client-Documents - Brick'
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
XdDocumentsLook >> initializeList [
	list := BrColumnedList new.
	list column 
		title: 'Author';
		stencil: [ :aFileInfo :anIndex | 
			(BrListLabelStencil matchParent: aFileInfo author) ].
	list column 
		title: 'Title';
		stencil: [ :aFileInfo :anIndex | 
			(BrListLabelStencil matchParent: aFileInfo title) ].
	self widget addChild: list as: #list.
]

{ #category : #initialization }
XdDocumentsLook >> initializeListeners [
	super initializeListeners.
	self when: XdClientChanged do: [ :anEvent | self client: anEvent client ].
]

{ #category : #initialization }
XdDocumentsLook >> initializeLook [
	super initializeLook.
	self widget 
		layout: BlLinearLayout vertical.
	self initializeList
]

{ #category : #initialization }
XdDocumentsLook >> initializeRequests [
	super initializeRequests.
	self request: XdClientRequest new.
]

{ #category : #hooks }
XdDocumentsLook >> onClientChange [
	list display: self client documents
]
