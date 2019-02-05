Class {
	#name : #XdGlamorousDocumentsGridLook,
	#superclass : #XdDocumentsLook,
	#instVars : [
		'list',
		'listHandler'
	],
	#category : #'XDoc-Client-Documents - Brick'
}

{ #category : #initialization }
XdGlamorousDocumentsGridLook >> initializeList [
	listHandler := XdDocumentsHandler new.
	list := BrGridList new
		stencil: [ :eachResource |
			BrCard new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical exact: 100 ];
				look: BrShadowLook + BrLabelLook + BrDescriptionLook;
				margin: (BlInsets all: 10);
				padding: (BlInsets all: 10);
				background: Color white;
				title: (eachResource title asRopedText bold);
				description: ((eachResource description asString first: (100 min: eachResource description size)) asRopedText foreground: Color gray);
				action: [ :aBrCard | aBrCard
					 fireEvent: (GtPhlowObjectToSpawn new
						object: eachResource;
						sourceElement: aBrCard) ] ];
		yourself.
	self widget addChild: list as: #list.
]

{ #category : #initialization }
XdGlamorousDocumentsGridLook >> initializeLook [
	super initializeLook.
	self widget
		padding: (BlInsets top: 8 left: 5 bottom: 5 right: 5);
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	
	
	self initializeToolbar.
	self initializeList
]

{ #category : #initialization }
XdGlamorousDocumentsGridLook >> initializeToolbar [
	| aToolbar aToolbarWrapper aRefreshButton |

	aToolbar := BrToolbar new.
	aToolbar look: BrGlamorousToolbarLook horizontal.
	aToolbar constraintsDo: [ :c |
		c linear horizontal alignRight.
		c horizontal fitContent ].
	aRefreshButton := BrButton new
		look: BrGlamorousButtonWithIconLook;
		label: 'Refresh';
		icon: BrGlamorousIcons refresh asElement;
		action: [ self refreshList ].
	aToolbar addItem: aRefreshButton.
	
	aToolbarWrapper := BlElement new.
	aToolbarWrapper layout: BlLinearLayout horizontal.
	aToolbarWrapper padding: (BlInsets left: 10).
	aToolbarWrapper constraintsDo: [ : c |
		c horizontal matchParent.
		c vertical fitContent ].
	aToolbarWrapper addChildren: {
		BrLabel new
			text: 'blog.feenk.com';
			look: (BrGlamorousLabelLook new fontSize: 15);
			hMatchParent;
			constraintsDo: [ :c | c linear vertical alignCenter ].
		
		aToolbar.
	}.
	
	self widget addChild: aToolbarWrapper as: #toolbar.
]

{ #category : #hooks }
XdGlamorousDocumentsGridLook >> onClientChange [
	self widgetDo: [ :aWidget | 
		listHandler client: self client.
		self updateList ]
]

{ #category : #actions }
XdGlamorousDocumentsGridLook >> refreshList [
	self widgetDo: [ :aWidget | 
		self updateList.
	 ]
]

{ #category : #private }
XdGlamorousDocumentsGridLook >> updateList [
	self client async 
		callback: [ :aList | 
			self widgetDo: [ :aWidget | 
				list enqueueTask: (BlTaskAction new action: [ 
					list display: aList ]) ] ];
		documents
]
