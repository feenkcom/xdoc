Class {
	#name : #XdPublishInfoAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'info',
		'titleElement',
		'authorElement',
		'descriptionElement',
		'publishButton',
		'passwordElement',
		'usernameElement'
	],
	#category : #'XDoc-Gt4XDocClient-Publish'
}

{ #category : #accessing }
XdPublishInfoAptitude >> info [
	<return: #XdPublishInfo>
	^ info
]

{ #category : #accessing }
XdPublishInfoAptitude >> info: aXdPublishInfo [
	self 
		assert: [ aXdPublishInfo notNil ] 
		description: [ 'Publish information must be non-nil' ].
	info := aXdPublishInfo.
	self onInfoChanged
]

{ #category : #initialization }
XdPublishInfoAptitude >> initialize [
	super initialize.
	info := XdEmptyPublishInfo uniqueInstance.
	titleElement := self newTitleElement.
	authorElement := self newAuthorElement.
	descriptionElement := self newDescriptionElement.
	usernameElement := self newUsernameElement.
	passwordElement := self newPasswordElement.
	publishButton := self newPublishButtonElement.
	self addChangeAddChildAs: #(content title) with: [ titleElement ].
	self addChangeAddChildAs: #(content author) with: [ authorElement ].
	self
		addChangeAddChildAs: #(content description)
		with: [ descriptionElement ].
	self
		addChangeAddChildAs: #(content username)
		with: [ usernameElement ].
	self
		addChangeAddChildAs: #(content password)
		with: [ passwordElement ].
	self addChangeAddChildAs: #(content button) with: [ publishButton ].
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ]
]

{ #category : #initialization }
XdPublishInfoAptitude >> initializeListeners [
	super initializeListeners.
	
	self 
		addEventHandlerOn: XdPublishInfoChangedEvent 
		do: [ :anEvent | self info: anEvent info ].
]

{ #category : #initialization }
XdPublishInfoAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: XdPublishInfoRequest new
]

{ #category : #'instance creation' }
XdPublishInfoAptitude >> newAuthorElement [
	^ BrEditorElement new
			aptitude: BrGlamorousInputFieldSpacingAptitude + XdPublishInfoInnerWidgetAptitude;
			editor: (BrTextEditorModel new text: self info author);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent ]
]

{ #category : #'instance creation' }
XdPublishInfoAptitude >> newDescriptionElement [
	^ BrEditorElement new
			aptitude: BrGlamorousTextAreaSpacingAptitude + XdPublishInfoInnerWidgetAptitude;
			editor: (BrTextEditorModel new text: self info description);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ]
]

{ #category : #'instance creation' }
XdPublishInfoAptitude >> newPasswordElement [
	"| inputElement |
	inputElement := BrEditorElement new.
	inputElement look:  BrGlamorousInputFieldSpacingLook + XdPublishInfoInnerWidgetLook.
	inputElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical fitContent ].
	inputElement editor: (BrTextEditor new text: self info password).
	inputElement editor text replacingText: $*.
	^ inputElement."
	
	^ BrEditor new
		aptitude: (BrGlamorousRegularEditorAptitude new replacingText: $*);
		text: self info password asString. 
]

{ #category : #'instance creation' }
XdPublishInfoAptitude >> newPublishButtonElement [
	^ BrButton new
			aptitude: BrGlamorousButtonWithIconAptitude
				+ BrGlamorousButtonWithLabelAptitude
				+ XdPublishInfoInnerWidgetAptitude;
			label: 'Publish';
			icon: BrGlamorousIcons tocloud asElement;
			action: (MessageSend receiver: self info selector: #publish);
			constraintsDo: [ :c | 
				c linear horizontal alignCenter.
				c horizontal fitContent.
				c vertical fitContent.
				c padding: (BlInsets top: 5 left: 15 bottom: 5 right: 15) ]
]

{ #category : #'instance creation' }
XdPublishInfoAptitude >> newTitleElement [
	^ BrEditorElement new
			aptitude: BrGlamorousInputFieldSpacingAptitude + XdPublishInfoInnerWidgetAptitude;
			editor: (BrTextEditorModel new text: self info title);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent ]
]

{ #category : #'instance creation' }
XdPublishInfoAptitude >> newUsernameElement [
	^ BrEditorElement new
			aptitude: BrGlamorousInputFieldSpacingAptitude + XdPublishInfoInnerWidgetAptitude;
			editor: (BrTextEditorModel new text: self info username);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent ]
]

{ #category : #hooks }
XdPublishInfoAptitude >> onInfoChanged [
	self widgetDo: [ 
		| anInfo | 
		anInfo := self info.
		titleElement editor text: self info title asRopedText.
		titleElement editor 
			addEventHandlerOn: BrTextEditorDeletedEvent 
			do: [ :anEvent | anInfo title: titleElement editor text ];
			addEventHandlerOn: BrTextEditorInsertedEvent 
			do: [ :anEvent | anInfo title: titleElement editor text ].
		authorElement editor text: self info author asRopedText.
		authorElement editor 
			addEventHandlerOn: BrTextEditorDeletedEvent 
			do: [ :anEvent | anInfo author: authorElement editor text ];
			addEventHandlerOn: BrTextEditorInsertedEvent 
			do: [ :anEvent | anInfo author: authorElement editor text ].
		descriptionElement editor text: self info description asRopedText.
		descriptionElement editor 
			addEventHandlerOn: BrTextEditorDeletedEvent 
			do: [ :anEvent | anInfo description: descriptionElement editor text ];
			addEventHandlerOn: BrTextEditorInsertedEvent 
			do: [ :anEvent | anInfo description: descriptionElement editor text ].
		usernameElement editor text: self info username asRopedText.
		usernameElement editor 
			addEventHandlerOn: BrTextEditorDeletedEvent 
			do: [ :anEvent | anInfo username: usernameElement editor text ];
			addEventHandlerOn: BrTextEditorInsertedEvent 
			do: [ :anEvent | anInfo username: usernameElement editor text ].
		passwordElement editor text: self info password asRopedText.
		passwordElement editor 
			addEventHandlerOn: BrTextEditorDeletedEvent 
			do: [ :anEvent | anInfo password: passwordElement editor text ];
			addEventHandlerOn: BrTextEditorInsertedEvent 
			do: [ :anEvent | anInfo password: passwordElement editor text ].
		publishButton action: (MessageSend receiver: self info selector: #publish)
	]
]
