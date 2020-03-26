Class {
	#name : #XdGlamorousDocumentsListLook,
	#superclass : #XdDocumentsLook,
	#instVars : [
		'list',
		'toolbar',
		'listHandler'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdGlamorousDocumentsListLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout vertical ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self initializeToolbar.
					self initializeList ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
XdGlamorousDocumentsListLook >> initializeList [
	listHandler := XdDocumentsHandler new.
	list := BrColumnedList new.
	list addEventHandler: listHandler.
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
XdGlamorousDocumentsListLook >> initializeToolbar [
	| aButton |
	toolbar := BrToolbar new.
	toolbar look: BrGlamorousToolbarLook new.
	toolbar constraintsDo: [ :c | 
		c linear horizontal alignRight ].
	aButton := BrButton new
		look: BrGlamorousButtonWithIconAndLabelLook;
		label: 'Refresh published documents';
		icon: BrGlamorousIcons refresh asElement;
		action: [ self refreshList ].
	toolbar addItem: aButton.
	self widget addChild: toolbar as: #toolbar.
]

{ #category : #hooks }
XdGlamorousDocumentsListLook >> onClientChange [
	self widgetDo: [ :aWidget | 
		listHandler client: self client.
		self updateList ]
]

{ #category : #actions }
XdGlamorousDocumentsListLook >> refreshList [
	self widgetDo: [ :aWidget | 
		self updateList.
	 ]
]

{ #category : #private }
XdGlamorousDocumentsListLook >> updateList [
	self client async 
		callback: [ :aList | 
			self widgetDo: [ :aWidget | 
				list enqueueTask: (BlTaskAction new action: [ 
					list display: aList ]) ] ];
		documents
]
