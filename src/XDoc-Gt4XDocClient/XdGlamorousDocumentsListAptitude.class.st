Class {
	#name : #XdGlamorousDocumentsListAptitude,
	#superclass : #XdDocumentsAptitude,
	#instVars : [
		'list',
		'toolbar',
		'listHandler'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdGlamorousDocumentsListAptitude >> initialize [
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
XdGlamorousDocumentsListAptitude >> initializeList [
	listHandler := XdDocumentsHandler new.
	list := BrColumnedList new.
	list addEventHandler: listHandler.
	list column 
		title: 'Author';
		stencil: [ :aFileInfo :anIndex | 
			BrLabel new
				aptitude: BrGlamorousListLabelAptitude;
				text: aFileInfo author;
				hMatchParent. ].
	list column 
		title: 'Title';
		stencil: [ :aFileInfo :anIndex | 
			BrLabel new
				aptitude: BrGlamorousListLabelAptitude;
				text: aFileInfo title;
				hMatchParent. ].
	self widget addChild: list as: #list.
]

{ #category : #initialization }
XdGlamorousDocumentsListAptitude >> initializeToolbar [
	| aButton |
	toolbar := BrToolbar new.
	toolbar aptitude: BrGlamorousToolbarAptitude new.
	toolbar constraintsDo: [ :c | 
		c linear horizontal alignRight ].
	aButton := BrButton new
		aptitude: BrGlamorousButtonWithIconAndLabelAptitude;
		label: 'Refresh published documents';
		icon: BrGlamorousIcons refresh asElement;
		action: [ self refreshList ].
	toolbar addItem: aButton.
	self widget addChild: toolbar as: #toolbar.
]

{ #category : #hooks }
XdGlamorousDocumentsListAptitude >> onClientChange [
	self widgetDo: [ :aWidget | 
		listHandler client: self client.
		self updateList ]
]

{ #category : #actions }
XdGlamorousDocumentsListAptitude >> refreshList [
	self widgetDo: [ :aWidget | 
		self updateList.
	 ]
]

{ #category : #private }
XdGlamorousDocumentsListAptitude >> updateList [
	self client async 
		onSuccessDo: [ :aList | 
			self widgetDo: [ :aWidget | 
				list enqueueTask: (BlTaskAction new action: [ 
					list items: aList ]) ] ];
		documents
]
