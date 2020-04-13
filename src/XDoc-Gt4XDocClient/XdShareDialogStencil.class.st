Class {
	#name : #XdShareDialogStencil,
	#superclass : #BrStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog'
}

{ #category : #testing }
XdShareDialogStencil class >> isAbstract [
	^ self name = #XdShareDialogStencil 
]

{ #category : #defaults }
XdShareDialogStencil >> defaultButtonAction [
	^ [ :aButton | "do nothing" ]
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newButton [
	^ BrButton new 
		look: BrGlamorousButtonWithLabelLook
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newPage [
	^ BlElement new
		viewModel: BrPagerPageModel new;
		layout: BlLinearLayout vertical;
		look: BrVerticalPaneLook new.
]

{ #category : #'instance creation' }
XdShareDialogStencil >> newVerticalContainer [
	^ BrVerticalPane new 
		matchParent
]
