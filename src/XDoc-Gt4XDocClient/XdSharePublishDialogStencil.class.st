Class {
	#name : #XdSharePublishDialogStencil,
	#superclass : #XdShareDialogStencil,
	#instVars : [
		'nextAction'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog'
}

{ #category : #'api - instantiation' }
XdSharePublishDialogStencil >> create [
	^ self newPage
		addChild: self newPublishFields;
		addChild: self newPublishButton.
]

{ #category : #initialization }
XdSharePublishDialogStencil >> initialize [
	super initialize.
	nextAction := self defaultButtonAction.
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newAuthorInputField [
	^ self newInputField
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newAuthorLabel [
	^ self newLabel
		text: 'Author:'
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newDescriptionInputField [
	^ self newInputEditor
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newDescriptionLabel [
	^ self newLabel
		text: 'Description:'
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newInputEditor [
	^ BrEditor new
		look: BrGlamorousInputFieldSpacingLook + (BrGlamorousRegularEditorLook - BrLayoutResizerLook);
		margin: self newLineMarginInsets;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.
			c grid horizontal alignLeft.
			c grid vertical alignTop. ]
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newInputField [
	^ BrEditor new
		look: BrGlamorousInputFieldSpacingLook + (BrGlamorousRegularEditorLook - BrLayoutResizerLook);
		margin: self newLineMarginInsets;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			c grid horizontal alignLeft.
			c grid vertical alignTop. ]
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newLabel [
	^ BrLabel new
		look: (BrGlamorousLabelLook new glamorousRegularFontAndSize foreground: Color gray; fontSize: 12);
		focusability: BlFocusability none;
		margin: (BlInsets top: 5 right: 2);
		constraintsDo: [ :c | 
			c grid horizontal alignLeft.
			c grid vertical alignTop. ]
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newLabelsAndInputFields [
	^ Array new: 6 streamContents: [ :aStream | 
		aStream 
			nextPut: self newTitleLabel;
			nextPut: self newTitleInputField;
			nextPut: self newAuthorLabel;
			nextPut: self newAuthorInputField;
			nextPut: self newDescriptionLabel;
			nextPut: self newDescriptionInputField ]
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newLineMarginInsets [
	^ BlInsets top: 5 right: 2
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newPublishButton [
	| aButton |
	aButton := self newButton 
		label: 'Next';
		margin: self newLineMarginInsets;
		constraintsDo: [ :c |
			c linear horizontal alignRight ].
	aButton action: [ self nextAction cull: aButton ].
	^ aButton
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newPublishFields [
	^ BlElement new 
		layout: (BlGridLayout new columnCount: 2);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChildren: self newLabelsAndInputFields.
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newTitleInputField [
	^ self newInputField
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newTitleLabel [
	^ self newLabel
		text: 'Title:'
]

{ #category : #accessing }
XdSharePublishDialogStencil >> nextAction [
	^ nextAction
]

{ #category : #accessing }
XdSharePublishDialogStencil >> nextAction: anObject [
	nextAction := anObject
]
