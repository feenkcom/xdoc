Class {
	#name : #XdDocumentsLook,
	#superclass : #BrLook,
	#instVars : [
		'client',
		'list',
		'toolbar'
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
			BrLabel new
				look: BrGlamorousListLabelLook;
				text: aFileInfo author;
				hMatchParent. ].
	list column 
		title: 'Title';
		stencil: [ :aFileInfo :anIndex | 
			BrLabel new
				look: BrGlamorousListLabelLook;
				text: aFileInfo title;
				hMatchParent. ].
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
	self widget layout: BlLinearLayout vertical.
	self initializeToolbar.
	self initializeList
]

{ #category : #initialization }
XdDocumentsLook >> initializeRequests [
	super initializeRequests.
	self request: XdClientRequest new.
]

{ #category : #initialization }
XdDocumentsLook >> initializeToolbar [
	| aButton |
	toolbar := BrToolbar new.
	toolbar look: BrGlamorousToolbarLook horizontal.
	toolbar constraintsDo: [ :c | 
		c linear horizontal alignRight ].
	aButton := BrButton new
		look: BrGlamorousButtonWithIconLook;
		icon: BrGlamorousIcons refresh asElement;
		action: [ self refreshList ].
	toolbar addItem: aButton.
	self widget addChild: toolbar as: #toolbar.
]

{ #category : #hooks }
XdDocumentsLook >> onClientChange [
	self updateList
]

{ #category : #actions }
XdDocumentsLook >> refreshList [
	self widgetDo: [ :aWidget | 
		self updateList.
	 ]
]

{ #category : #private }
XdDocumentsLook >> updateList [
	list display: self client documents
]
