Class {
	#name : #XdGlamorousDocumentsGridAptitude,
	#superclass : #XdDocumentsAptitude,
	#instVars : [
		'list',
		'listHandler'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdGlamorousDocumentsGridAptitude >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget padding)
		with: [ BlInsets
				top: 8
				left: 5
				bottom: 5
				right: 5 ].
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout vertical ].
	self
		addChangeProperty: #(widget constraints horizontal resizer)
		with: BlLayoutResizer matchParent.
	self
		addChangeProperty: #(widget constraints vertical resizer)
		with: BlLayoutResizer matchParent.
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
XdGlamorousDocumentsGridAptitude >> initializeList [
	listHandler := XdDocumentsHandler new.
	list := BrGridList new
		stencil: [ :eachXdFileInfo |	
			| aCard |
			aCard := BrCard new
				layout: BlLinearLayout vertical;
				aptitude: BrShadowAptitude
					+ BrIconAptitude
					+ (BrTextLabelAptitude new labelDo: [ :aLabel | aLabel margin: (BlInsets all: 12) ])
					+ (BrDescriptionAptitude new descriptionDo: [ :aDescription | 
							aDescription padding: (BlInsets top: 0 left: 12 bottom: 12 right: 12) ]);
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ];
				margin: (BlInsets all: 12);
				background: Color white;
				title: (eachXdFileInfo title asRopedText glamorousRegularFont);
				description: (eachXdFileInfo description asRopedText foreground: Color gray; glamorousRegularFont; glamorousRegularSmallSize);
				picture: (Form extent: 0@0) asElement;
				action: [ :aBrCard | 
					self client async 
						onSuccessDo: [ :anXdFileOrNil | 
							anXdFileOrNil ifNotNil: [ 
								aBrCard enqueueTask: (BlTaskAction new action: [ 
									aBrCard phlow spawnObject: anXdFileOrNil ]) ] ];
						downloadXDocUsingFileInfo: eachXdFileInfo ].
				
				self updatePreviewOf: eachXdFileInfo in: aCard.
				
				aCard ];
		yourself.
	self widget addChild: list as: #list.
]

{ #category : #initialization }
XdGlamorousDocumentsGridAptitude >> initializeToolbar [
	| aToolbar aToolbarWrapper aRefreshButton |

	aToolbar := BrToolbar new.
	aToolbar aptitude: BrGlamorousToolbarAptitude new.
	aToolbar constraintsDo: [ :c | c linear horizontal alignRight ].
	aRefreshButton := BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
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
			aptitude: (BrGlamorousLabelAptitude new fontSize: 15);
			hMatchParent;
			constraintsDo: [ :c | c linear vertical alignCenter ].
		
		aToolbar.
	}.
	
	self widget addChild: aToolbarWrapper as: #toolbar.
]

{ #category : #hooks }
XdGlamorousDocumentsGridAptitude >> onClientChange [
	self widgetDo: [ :aWidget | 
		listHandler client: self client.
		self updateList ]
]

{ #category : #actions }
XdGlamorousDocumentsGridAptitude >> refreshList [
	self widgetDo: [ :aWidget | 
		self updateList.
	 ]
]

{ #category : #private }
XdGlamorousDocumentsGridAptitude >> updateList [
	self client async 
		onSuccessDo: [ :aList | 
			self widgetDo: [ :aWidget | 
				list enqueueTask: (BlTaskAction new action: [ 
					list items: aList ]) ] ];
		documents
]

{ #category : #private }
XdGlamorousDocumentsGridAptitude >> updatePreviewOf: aFileInfo in: aCard [

	self
		assert: [ aFileInfo isNotNil ]
		description: [ 'File info must not be nil' ].
	
	self client async 
		onSuccessDo: [ :anImageForm | 
			anImageForm bits isEmpty ifFalse: [
				self widgetDo: [ :aWidget | 
					aCard enqueueTask: (BlTaskAction new action: [
						| aPreviewElement aScaledForm |
					
						aScaledForm := anImageForm scaledToSize: 512 @ anImageForm height.
					
						aPreviewElement := aScaledForm asElement asScalableElement.
						aPreviewElement fitWidth.
						aPreviewElement constraintsDo: [ :c |
							c horizontal matchParent.
							c vertical fitContent ].
						aCard picture: aPreviewElement ]) ] ] ];
		downloadPreviewImageUsingFileInfo: aFileInfo
]
