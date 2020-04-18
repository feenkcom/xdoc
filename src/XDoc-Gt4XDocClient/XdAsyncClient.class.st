Class {
	#name : #XdAsyncClient,
	#superclass : #XdProtoClient,
	#instVars : [
		'client',
		'pool',
		'successCallbacks',
		'failureCallbacks'
	],
	#category : #'XDoc-Gt4XDocClient-Client'
}

{ #category : #converting }
XdAsyncClient >> async [
	^ self
]

{ #category : #notifying }
XdAsyncClient >> client [
	<return: #XdClient>
	^ client
]

{ #category : #notifying }
XdAsyncClient >> client: aXdClient [
	client := aXdClient
]

{ #category : #defaults }
XdAsyncClient >> defaultCallbacks [
	^ OrderedCollection new: 1
]

{ #category : #defaults }
XdAsyncClient >> defaultClient [
	^ XdClient null
]

{ #category : #defaults }
XdAsyncClient >> defaultPool [
	^ BlTktWorkerProvider highUIExternalResourceBoundPool
]

{ #category : #accessing }
XdAsyncClient >> documents [
	^ self downloadList
]

{ #category : #actions }
XdAsyncClient >> downloadList [
	| aFuture |
	aFuture := self pool future: [ self client downloadList ] asBlTktCommand.
	aFuture onSuccessDo: [ :result | self resultNotification: result ].
	^ aFuture
]

{ #category : #actions }
XdAsyncClient >> downloadPreviewImageUsingFileInfo: aXdFileInfo [
	[ self client downloadPreviewImageUsingFileInfo: aXdFileInfo ] asBlTktCommand future
			onSuccessDo: [ :result | self resultNotification: result ]
]

{ #category : #actions }
XdAsyncClient >> downloadXDocUsingFileInfo: anXdInfo [
	[ self client downloadXDocUsingFileInfo: anXdInfo ] asBlTktCommand future
			onSuccessDo: [ :result | self resultNotification: result ]
]

{ #category : #initialization }
XdAsyncClient >> initialize [
	super initialize.
	client := self defaultClient.
	pool := self defaultPool.
	successCallbacks := self defaultCallbacks.
	failureCallbacks := self defaultCallbacks.
]

{ #category : #accessing }
XdAsyncClient >> onFailure [
	<return: #OrderedCollection of: #Valuable>
	^ failureCallbacks
]

{ #category : #accessing }
XdAsyncClient >> onFailureDo: aCallback [
	self 
		assert: [ aCallback notNil ] 
		description: [ 'Async failure callback must be non-nil' ].
	failureCallbacks add: aCallback.
]

{ #category : #accessing }
XdAsyncClient >> onSuccess [
	<return: #OrderedCollection of: #Valuable>
	^ successCallbacks
]

{ #category : #accessing }
XdAsyncClient >> onSuccessDo: aCallback [
	self 
		assert: [ aCallback notNil ] 
		description: [ 'Async success callback must be non-nil' ].
	successCallbacks add: aCallback.
]

{ #category : #accessing }
XdAsyncClient >> pool [
	^ pool
]

{ #category : #accessing }
XdAsyncClient >> pool: anObject [
	pool := anObject
]

{ #category : #notifying }
XdAsyncClient >> resultNotification: anObject [ 
	self onSuccess do: [ :eachCallback | eachCallback value: anObject ]
]
