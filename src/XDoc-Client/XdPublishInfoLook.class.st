Class {
	#name : #XdPublishInfoLook,
	#superclass : #BrLook,
	#instVars : [
		'info',
		'titleElement',
		'authorElement',
		'descriptionElement',
		'publishButton'
	],
	#category : #'XDoc-Client-Publish - Brick'
}

{ #category : #accessing }
XdPublishInfoLook >> info [
	<return: #OldXdPublishInfo>
	^ info
]

{ #category : #accessing }
XdPublishInfoLook >> info: aXdPublishInfo [
	self 
		assert: [ aXdPublishInfo notNil ] 
		description: [ 'Publish information must be non-nil' ].
	info := aXdPublishInfo.
	self onInfoChanged
]

{ #category : #initialization }
XdPublishInfoLook >> initialize [
	super initialize.
	info := XdEmptyPublishInfo uniqueInstance.
	titleElement := self newTitleElement.
	authorElement := self newAuthorElement.
	descriptionElement := self newDescriptionElement.
	publishButton := self newPublishButtonElement.

]

{ #category : #initialization }
XdPublishInfoLook >> initializeListeners [
	super initializeListeners.
	
	self 
		addEventHandlerOn: XdPublishInfoChangedEvent 
		do: [ :anEvent | self info: anEvent info ].
]

{ #category : #initialization }
XdPublishInfoLook >> initializeLook [
	super initializeLook.
	self widgetContent layout: BlLinearLayout vertical.
	"Ensure an author element"
	self widgetContent addChild: titleElement as: #title.
	self widgetContent addChild: authorElement as: #author.
	self widgetContent addChild: descriptionElement as: #description.
	self widgetContent addChild: publishButton as: #button.
	
]

{ #category : #initialization }
XdPublishInfoLook >> initializeRequests [
	super initializeRequests.
	
	self request: XdPublishInfoRequest new
]

{ #category : #'instance creation' }
XdPublishInfoLook >> newAuthorElement [
	^ BrEditorElement new
			look: BrGlamorousInputFieldLook + XdPublishInfoInnerWidgetLook;
			editor: (BrTextEditor new text: self info author);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent ]
]

{ #category : #'instance creation' }
XdPublishInfoLook >> newDescriptionElement [
	^ BrEditorElement new
			look: BrGlamorousTextAreaLook + XdPublishInfoInnerWidgetLook;
			editor: (BrTextEditor new text: self info description);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ]
]

{ #category : #'instance creation' }
XdPublishInfoLook >> newPublishButtonElement [
	^ BrButton new
			look: BrGlamorousButtonWithIconLook
				+ BrGlamorousButtonWithLabelLook
				+ XdPublishInfoInnerWidgetLook;
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
XdPublishInfoLook >> newTitleElement [
	^ BrEditorElement new
			look: BrGlamorousInputFieldLook + XdPublishInfoInnerWidgetLook;
			editor: (BrTextEditor new text: self info title);
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent ]
]

{ #category : #hooks }
XdPublishInfoLook >> onInfoChanged [
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
		publishButton action: (MessageSend receiver: self info selector: #publish)
	]
]
