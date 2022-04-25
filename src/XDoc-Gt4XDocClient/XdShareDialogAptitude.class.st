Class {
	#name : #XdShareDialogAptitude,
	#superclass : #BrAptitude,
	#traits : 'TXdShareInformationHolderAccess + TXdShareActionsAccess',
	#classTraits : 'TXdShareInformationHolderAccess classTrait + TXdShareActionsAccess classTrait',
	#instVars : [
		'pager',
		'document'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Look'
}

{ #category : #accessing }
XdShareDialogAptitude >> actions [
	^ actions
]

{ #category : #accessing }
XdShareDialogAptitude >> actions: aXdShareAction [
	self 
		assert: [ aXdShareAction isNotNil ]
		description: [ 'Share actions must be non-nil' ].
	actions := aXdShareAction
]

{ #category : #defaults }
XdShareDialogAptitude >> defaultActions [
	^ XdShareActions null
]

{ #category : #defaults }
XdShareDialogAptitude >> defaultInformationHolder [
	^ XdShareInformationHolder new
]

{ #category : #execution }
XdShareDialogAptitude >> executeAsTaskIt: aBlock [ 
	[ aBlock value ] asAsyncFuture await 
		then: #yourself
		otherwise: #debug
]

{ #category : #execution }
XdShareDialogAptitude >> executeDeleteAction [
	self pager addPage: (self 
		newProgressPageLabel: 'Deleting...').
	self pager smoothScrollToLast.
	self executeAsTaskIt: [ 
		| anAnswer |
		anAnswer := self actions delete.
		self pager addPage: anAnswer asElement.
		self pager smoothScrollToLast ].
]

{ #category : #execution }
XdShareDialogAptitude >> executePublishAction [
	self pager addPage: (self 
		newProgressPageLabel: 'Publishing...').
	self pager smoothScrollToLast.
	self executeAsTaskIt: [ 
		| anAnswer |
		anAnswer := self actions publish.
		self pager addPage: anAnswer asElement.
		self pager smoothScrollToLast ].
]

{ #category : #execution }
XdShareDialogAptitude >> executeUpdateAction [
	self pager addPage: (self 
		newProgressPageLabel: 'Updating...').
	self pager smoothScrollToLast.
	self executeAsTaskIt: [ 
		| anAnswer |
		anAnswer := self actions update.
		self pager addPage: anAnswer asElement.
		self pager smoothScrollToLast ]
]

{ #category : #accessing }
XdShareDialogAptitude >> information [
	^ informationHolder information
]

{ #category : #accessing }
XdShareDialogAptitude >> information: anObject [
	informationHolder information: anObject
]

{ #category : #accessing }
XdShareDialogAptitude >> informationHolder [
	^ informationHolder
]

{ #category : #initialization }
XdShareDialogAptitude >> initialize [ 
	super initialize.
	self initializeInformationHolder.
	self initializeActions.
	pager := BrPager new.
	pager matchParent.
	self addChangeAddChildAs: #(content pager) with: [ pager ].
	self initializeFirstPage.
]

{ #category : #initialization }
XdShareDialogAptitude >> initializeActions [
	actions := self defaultActions
]

{ #category : #initialization }
XdShareDialogAptitude >> initializeFirstPage [
	self pager addPage: self newInitialPage
]

{ #category : #initialization }
XdShareDialogAptitude >> initializeInformationHolder [
	informationHolder := self defaultInformationHolder.
]

{ #category : #initialization }
XdShareDialogAptitude >> initializeListeners [
	super initializeListeners.
	
	self 
		addEventHandlerOn: XdShareInformationChanged 
		do: [ :anEvent | self onInformationChange: anEvent information ].
	self 
		addEventHandlerOn: XdShareActionsChanged 
		do: [ :anEvent | self onActionsChange: anEvent actions ].
]

{ #category : #initialization }
XdShareDialogAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: XdShareInformationRequest new.
	self request: XdShareActionsRequest new.
]

{ #category : #'instance creation' }
XdShareDialogAptitude >> newDeletePage: aString action: aBlock [
	<return: #BlElement>
	^ XdShareDeleteDialogWithAuthenticationStencil new
		informationHolder: self informationHolder;
		nextAction: aBlock;
		nextActionLabel: aString;
		asElement 
]

{ #category : #'instance creation' }
XdShareDialogAptitude >> newInitialPage [
	<return: #BlElement>
	^ XdInitialDialogStencil new 
		informationHolder: self informationHolder;
		publishAction: [ self proceedPublishStep ];
		updateAction: [ self proceedUpdateStep ];
		deleteAction: [ self proceedDeleteStep ];
		asElement
]

{ #category : #'instance creation' }
XdShareDialogAptitude >> newProgressPage [
	<return: #BlElement>
	^ XdProgressDialogStencil new
		informationHolder: self informationHolder
		asElement
]

{ #category : #'instance creation' }
XdShareDialogAptitude >> newProgressPageLabel: aString [
	<return: #BlElement>
	^ XdProgressDialogStencil new
		informationHolder: self informationHolder;
		title: aString;
		asElement
]

{ #category : #'instance creation' }
XdShareDialogAptitude >> newPublishPage: aString action: aBlock [ 
	<return: #BlElement>
	^ XdSharePublishDialogWithAuthenticationStencil new
		informationHolder: self informationHolder;
		nextAction: aBlock;
		nextActionLabel: aString;
		asElement 
]

{ #category : #'instance creation' }
XdShareDialogAptitude >> newUpdatePage: aString action: aBlock [ 
	<return: #BlElement>
	^ XdShareUpdateDialogWithAuthenticationStencil new
		informationHolder: self informationHolder;
		nextAction: aBlock;
		nextActionLabel: aString;
		asElement 
]

{ #category : #hooks }
XdShareDialogAptitude >> onActionsChange: anInformation [
	self actions: anInformation.
]

{ #category : #hooks }
XdShareDialogAptitude >> onInformationChange: anInformation [
	self information: anInformation.
]

{ #category : #accessing }
XdShareDialogAptitude >> pager [
	<return: #BrPager>
	^ pager
]

{ #category : #accessing }
XdShareDialogAptitude >> pages [
	^ self pager pages
]

{ #category : #steps }
XdShareDialogAptitude >> proceedDeleteStep [
	self pager viewModel removePagesAfter: self pager viewModel pages first.
	self pager addPage: (self newDeletePage: 'Delete' action: [self executeDeleteAction]).
	self pager smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogAptitude >> proceedPublishStep [
	self pager viewModel removePagesAfter: self pager viewModel pages first.
	self pager addPage: (self newPublishPage: 'Publish' action: [self executePublishAction]).
	self pager smoothScrollToLast.
]

{ #category : #steps }
XdShareDialogAptitude >> proceedUpdateStep [
	self pager viewModel removePagesAfter: self pager viewModel pages first.
	self pager addPage: (self newUpdatePage: 'Update' action: [self executeUpdateAction]).
	self pager smoothScrollToLast.
]
