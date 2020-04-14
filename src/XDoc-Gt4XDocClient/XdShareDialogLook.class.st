Class {
	#name : #XdShareDialogLook,
	#superclass : #BrLook,
	#traits : 'TXdShareInformationAccess',
	#classTraits : 'TXdShareInformationAccess classTrait',
	#instVars : [
		'pager'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Look'
}

{ #category : #accessing }
XdShareDialogLook >> information: anObject [
	information := anObject.
	self notifyInformationChanged.
]

{ #category : #initialization }
XdShareDialogLook >> initialize [ 
	super initialize.
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
	self 
		addEventHandlerOn: XdShareInformationPartChangedByUser 
		do: [ :anEvent | self onInformationPartChange: anEvent type value: anEvent value ].
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
		nextAction: aBlock;
		nextActionLabel: aString;
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newDeletePage [
	<return: #BlElement>
	^ XdShareDeleteDialogStencil new
		nextAction: [ self proceedDeleteNextStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newInitialPage [
	<return: #BlElement>
	^ XdInitialDialogPageStencil new 
		publishAction: [ self proceedPublishStep ];
		updateAction: [ self proceedUpdateStep ];
		deleteAction: [ self proceedDeleteStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogLook >> newPublishPage [
	<return: #BlElement>
	^ XdSharePublishDialogStencil new
		nextAction: [ self proceedPublishNextStep ];
		asElement 
]

{ #category : #'instance creation' }
XdShareDialogLook >> newUpdatePage [
	<return: #BlElement>
	^ XdShareUpdateDialogStencil new
		nextAction: [ self proceedUpdateNextStep ];
		asElement
]

{ #category : #notifying }
XdShareDialogLook >> notifyInformationChanged [
	self information partsDo: [ :aKey :aValue | 
		self dispatchEvent: (XdShareInformationPartChanged new 
			type: aKey;
			value: aValue) ]
]

{ #category : #hooks }
XdShareDialogLook >> onInformationChange: anInformation [
	self information: anInformation.
]

{ #category : #hooks }
XdShareDialogLook >> onInformationPartChange: aType value: aValue [
	self trace: aType; trace: ': '; trace: aValue; traceCr: ' (by user)'.
	self information setPart: aType value: aValue
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
