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
XdShareDialogElement >> newAuthenticationPage [
	<return: #BlElement>
	^ XdShareAuthenticationDialogStencil new
		nextAction: [ self proceedAuthenticationNextStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogElement >> newAuthenticationPageLabel: aString [
	<return: #BlElement>
	^ XdShareAuthenticationDialogStencil new
		nextAction: [ self proceedAuthenticationNextStep ];
		nextActionLabel: aString;
		asElement
]

{ #category : #'instance creation' }
XdShareDialogElement >> newDeletePage [
	<return: #BlElement>
	^ XdShareDeleteDialogStencil new
		nextAction: [ self proceedDeleteNextStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogElement >> newInitialPage [
	<return: #BlElement>
	^ XdInitialDialogPageStencil new 
		publishAction: [ self proceedPublishStep ];
		updateAction: [ self proceedUpdateStep ];
		deleteAction: [ self proceedDeleteStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogElement >> newPublishPage [
	<return: #BlElement>
	^ XdSharePublishDialogStencil new
		nextAction: [ self proceedPublishNextStep ];
		asElement 
]

{ #category : #'instance creation' }
XdShareDialogElement >> newUpdatePage [
	<return: #BlElement>
	^ XdShareUpdateDialogStencil new
		nextAction: [ self proceedUpdateNextStep ];
		asElement
]

{ #category : #steps }
XdShareDialogElement >> proceedAuthenticationNextStep [
	
]

{ #category : #steps }
XdShareDialogElement >> proceedDeleteNextStep [

]

{ #category : #steps }
XdShareDialogElement >> proceedDeleteStep [
	self viewModel removePagesAfter: self viewModel pages first.
	self addPage: self newDeletePage.
	self smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogElement >> proceedPublishNextStep [
	self viewModel removePagesAfter: self viewModel pages second.
	self addPage: (self newAuthenticationPageLabel: 'Publish').
	self smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogElement >> proceedPublishStep [
	self viewModel removePagesAfter: self viewModel pages first.
	self addPage: self newPublishPage.
	self smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogElement >> proceedUpdateNextStep [
	
]

{ #category : #steps }
XdShareDialogElement >> proceedUpdateStep [
	self viewModel removePagesAfter: self viewModel pages first.
	self addPage: self newUpdatePage.
	self smoothScrollToLast.
]
