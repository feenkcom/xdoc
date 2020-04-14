Class {
	#name : #XdShareDialogStencil,
	#superclass : #BrStencil,
	#traits : 'TXdShareInformationHolderAccess',
	#classTraits : 'TXdShareInformationHolderAccess classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #testing }
XdShareDialogStencil class >> isAbstract [
	^ self name = #XdShareDialogStencil 
]

{ #category : #accessing }
XdShareDialogStencil >> constants [
	^ XdShareInformation
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

{ #category : #initialization }
XdShareDialogStencil >> initialize [
	super initialize.
	self initializeInformationHolder.
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
XdShareDialogStencil >> newCodeInputFieldWith: aSymbol [
	| anEditor |
	anEditor := self newCodeInputField.
	self onEditor: anEditor register: aSymbol.
	^ anEditor
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
XdShareDialogStencil >> newInputEditorWith: aSymbol [
	| anEditor |
	anEditor := self newInputEditor.
	self onEditor: anEditor register: aSymbol.
	^ anEditor
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
XdShareDialogStencil >> newSecretInputFieldWith: aSymbol [
	| anEditor |
	anEditor := self newSecretInputField.
	self onEditor: anEditor register: aSymbol.
	^ anEditor
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newVerticalContainer [
	^ BrVerticalPane new 
		matchParent
]

{ #category : #registration }
XdShareDialogStencil >> notifyAboutChangesInEditor: anEditor withType: aSymbol [
	self informationHolder partAt: aSymbol put: anEditor text
]

{ #category : #registration }
XdShareDialogStencil >> onEditor: anEditor register: aSymbol [
	anEditor text: (self informationHolder partAt: aSymbol).
	self informationHolder whenAllChangedDo: [ :newInformation | 
		anEditor text: (newInformation partAt: aSymbol) ].
	anEditor editor
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
