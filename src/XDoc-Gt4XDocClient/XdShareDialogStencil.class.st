Class {
	#name : #XdShareDialogStencil,
	#superclass : #BrStencil,
	#instVars : [
		'informationHolder'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - UI'
}

{ #category : #testing }
XdShareDialogStencil class >> isAbstract [
	^ self name = #XdShareDialogStencil 
]

{ #category : #defaults }
XdShareDialogStencil >> defaultButtonAction [
	^ [ :aButton | "do nothing" ]
]

{ #category : #accessing }
XdShareDialogStencil >> informationHolder [
	^ informationHolder
]

{ #category : #accessing }
XdShareDialogStencil >> informationHolder: anObject [
	informationHolder := anObject
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newButton [
	^ BrButton new 
		look: BrGlamorousButtonWithLabelLook
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newCodeInputField [
	^ BrEditor new
		look: BrGlamorousInputFieldSpacingLook + 
			(BrGlamorousCodeEditorLook - BrLayoutResizerLook);
		margin: self newLineMarginInsets;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			c grid horizontal alignLeft.
			c grid vertical alignTop. ]
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newInputEditor [
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
XdShareDialogStencil >> newInputField [
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
XdShareDialogStencil >> newInputFieldWith: aSymbol [
	| anEditor |
	anEditor := self newInputField.
	self onEditor: anEditor register: aSymbol.
	^ anEditor
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newLabel [
	^ BrLabel new
		look: (BrGlamorousLabelLook new glamorousRegularFontAndSize foreground: Color gray; fontSize: 12);
		focusability: BlFocusability none;
		margin: (BlInsets top: 5 right: 2);
		constraintsDo: [ :c | 
			c grid horizontal alignLeft.
			c grid vertical alignTop. ]
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newLineMarginInsets [
	^ BlInsets top: 5 right: 2
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newPage [
	^ BlElement new
		viewModel: BrPagerPageModel new;
		layout: BlLinearLayout vertical;
		look: BrVerticalPaneLook new.
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newSecretInputField [
	^ BrEditor new
		look: BrGlamorousInputFieldSpacingLook + 
			(BrGlamorousRegularEditorLook new 
				- BrLayoutResizerLook;
				replacingText: $*);
		margin: self newLineMarginInsets;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent.
			c grid horizontal alignLeft.
			c grid vertical alignTop. ]
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newVerticalContainer [
	^ BrVerticalPane new 
		matchParent
]

{ #category : #registration }
XdShareDialogStencil >> notifyAboutChangesInEditor: anEditor withType: aSymbol [
	self informationHolder setPart: aSymbol value: anEditor text.
]

{ #category : #registration }
XdShareDialogStencil >> onEditor: anEditor register: aSymbol [
	anEditor
		addEventHandlerOn: XdShareInformationPartChanged
			do: [ :anEvent | 
			(anEvent type = aSymbol
				and: [ anEvent value ~= anEditor text asString ])
				ifTrue: [ anEditor text: anEvent value ] ];
		addEventHandlerOn: BrTextEditorDeletedEvent
			do:
				[ :anEvent | self notifyAboutChangesInEditor: anEditor withType: aSymbol ];
		addEventHandlerOn: BrTextEditorModifiedEvent
			do:
				[ :anEvent | self notifyAboutChangesInEditor: anEditor withType: aSymbol ];
		addEventHandlerOn: BrTextEditorInsertedEvent
			do: [ :anEvent | 
			self notifyAboutChangesInEditor: anEditor withType: aSymbol ]
]
