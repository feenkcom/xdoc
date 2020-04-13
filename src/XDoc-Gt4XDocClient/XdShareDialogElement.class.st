Class {
	#name : #XdShareDialogElement,
	#superclass : #BrPager,
	#category : #'XDoc-Gt4XDocClient-Dialog'
}

{ #category : #initialization }
XdShareDialogElement >> initialize [
	super initialize.
	self initializeFirstPage.
]

{ #category : #initialization }
XdShareDialogElement >> initializeFirstPage [
	self addPage: self newInitialPage
]

{ #category : #'instance creation' }
XdShareDialogElement >> newInitialPage [
	<return: #BlElement>
	^ XdInitialDialogPageStencil new 
		publishAction: [ self proceedPublishStep ];
		asElement 
]

{ #category : #'instance creation' }
XdShareDialogElement >> newPublishPage [
	<return: #BlElement>
	^ XdSharePublishDialogStencil new
		nextAction: [ self proceedPublishNextStep ];
		asElement 
]

{ #category : #steps }
XdShareDialogElement >> proceedPublishNextStep [
	self viewModel removePagesAfter: self viewModel pages second.
	self addPage: self newAuthenticationPage.
	self smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogElement >> proceedPublishStep [
	self viewModel removePagesAfter: self viewModel pages first.
	self addPage: self newPublishPage.
	self smoothScrollToLast.
]
