Class {
	#name : #XdShareDialogLook,
	#superclass : #BrLook,
	#traits : 'TXdShareInformationHolderAccess',
	#classTraits : 'TXdShareInformationHolderAccess classTrait',
	#instVars : [
		'pager',
		'document'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Look'
}

{ #category : #execution }
XdShareDialogLook >> executePublishAction [
	self pager addPage: (self 
		newProgressPageLabel: 'Publishing...').
	self pager smoothScrollToLast.
]

{ #category : #initialization }
XdShareDialogLook >> initialize [ 
	super initialize.
	self initializeInformationHolder.
	pager := BrPager new.
	self addChangeAddChildAs: #(content pager) with: [ pager ].
	self initializeFirstPage.
]

{ #category : #initialization }
XdShareDialogLook >> initializeFirstPage [
	self pager addPage: self newInitialPage
]

{ #category : #initialization }
XdShareDialogLook >> initializeListeners [
	super initializeListeners.
	
	self 
		addEventHandlerOn: XdShareInformationChanged 
		do: [ :anEvent | self onInformationChange: anEvent information ].
]

{ #category : #initialization }
XdShareDialogLook >> initializeRequests [
	super initializeRequests.
	
	self request: XdShareInformationRequest new
]

{ #category : #'instance creation' }
XdShareDialogLook >> newAuthenticationPageLabel: aString action: aBlock [
	<return: #BlElement>
	^ XdShareAuthenticationDialogStencil new
		informationHolder: self informationHolder;
		nextAction: aBlock;
		nextActionLabel: aString;
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newDeletePage [
	<return: #BlElement>
	^ XdShareDeleteDialogStencil new
		informationHolder: self informationHolder;
		nextAction: [ self proceedDeleteNextStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newInitialPage [
	<return: #BlElement>
	^ XdInitialDialogStencil new 
		informationHolder: self informationHolder;
		publishAction: [ self proceedPublishStep ];
		updateAction: [ self proceedUpdateStep ];
		deleteAction: [ self proceedDeleteStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newProgressPage [
	<return: #BlElement>
	^ XdProgressDialogStencil new
		informationHolder: self informationHolder
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newProgressPageLabel: aString [
	<return: #BlElement>
	^ XdProgressDialogStencil new
		informationHolder: self informationHolder;
		title: aString;
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newPublishPage [
	<return: #BlElement>
	^ XdSharePublishDialogStencil new
		informationHolder: self informationHolder;
		nextAction: [ self proceedPublishNextStep ];
		asElement 
]

{ #category : #'instance creation' }
XdShareDialogLook >> newUpdatePage [
	<return: #BlElement>
	^ XdShareUpdateDialogStencil new
		informationHolder: self informationHolder;
		nextAction: [ self proceedUpdateNextStep ];
		asElement
]

{ #category : #hooks }
XdShareDialogLook >> onInformationChange: anInformation [
	self information: anInformation.
]

{ #category : #accessing }
XdShareDialogLook >> pager [
	<return: #BrPager>
	^ pager
]

{ #category : #accessing }
XdShareDialogLook >> pages [
	^ self pager pages
]

{ #category : #steps }
XdShareDialogLook >> proceedAuthenticationNextStep [
	
]

{ #category : #steps }
XdShareDialogLook >> proceedDeleteNextStep [
	self pager viewModel removePagesAfter: self pager viewModel pages second.
	self pager addPage: (self 
		newAuthenticationPageLabel: 'Delete'
		action: [ self executeDeleteAction ]).
	self pager smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogLook >> proceedDeleteStep [
	self pager viewModel removePagesAfter: self pager viewModel pages first.
	self pager addPage: self newDeletePage.
	self pager smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogLook >> proceedPublishNextStep [
	self pager viewModel removePagesAfter: self pager viewModel pages second.
	self pager addPage: (self 
		newAuthenticationPageLabel: 'Publish'
		action: [ self executePublishAction ]).
	self pager smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogLook >> proceedPublishStep [
	self pager viewModel removePagesAfter: self pager viewModel pages first.
	self pager addPage: self newPublishPage.
	self pager smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogLook >> proceedUpdateNextStep [
	self pager viewModel removePagesAfter: self pager viewModel pages second.
	self pager addPage: (self 
		newAuthenticationPageLabel: 'Update'
		action: [ self executeUpdateAction ]).
	self pager smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogLook >> proceedUpdateStep [
	self pager viewModel removePagesAfter: self pager viewModel pages first.
	self pager addPage: self newUpdatePage.
	self pager smoothScrollToLast.
]
