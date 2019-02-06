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
		stencil: [ :eachXdFileInfo |	
			| aCard |
			aCard := BrCard new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ];
				look: BrShadowLook + BrIconLook + BrLabelLook +  BrDescriptionLook;
				margin: (BlInsets all: 10);
				padding: (BlInsets all: 10);
				background: Color white;
				title: (eachXdFileInfo title asRopedText bold);
				description: (eachXdFileInfo description asRopedText foreground: Color gray);
				picture: (Form extent: 0@0) asElement;
				action: [ :aBrCard | aBrCard
					 fireEvent: (GtPhlowObjectToSpawn new
						object: eachXdFileInfo;
						sourceElement: aBrCard) ].
				
				self updatePreviewOf: eachXdFileInfo in: aCard.
				
				aCard ];
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

{ #category : #private }
XdGlamorousDocumentsGridLook >> updatePreviewOf: aFileInfo in: aCard [

	self
		assert: [ aFileInfo isNotNil ]
		description: [ 'File info must not be nil' ].
	
	self client async 
		callback: [ :anImageForm | 
			self widgetDo: [ :aWidget | 
				aCard enqueueTask: (BlTaskAction new action: [
					| aPreviewElement aScaledForm |
					
					aScaledForm := anImageForm scaledToSize: 512 @ anImageForm height.
					
					aPreviewElement := aScaledForm asElement asScalableElement.
					aPreviewElement fitWidth.
					aPreviewElement constraintsDo: [ :c |
						c horizontal matchParent.
						c vertical fitContent ].
					
					aCard picture: aPreviewElement ]) ] ];
		downloadPreviewImageUsingFileInfo: aFileInfo
]
