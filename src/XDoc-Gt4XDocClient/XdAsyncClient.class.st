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

{ #category : #actions }
XdAsyncClient >> documents [
	^ self executeCommand: [ self client documents ] asBlTktCommand.
]

{ #category : #actions }
XdAsyncClient >> downloadPreviewImageUsingFileInfo: aXdFileInfo [
	^ self executeCommand: [ self client downloadPreviewImageUsingFileInfo: aXdFileInfo ] asBlTktCommand.
]

{ #category : #actions }
XdAsyncClient >> downloadXDocUsingFileInfo: anXdInfo [
	^ self executeCommand: [ self client downloadXDocUsingFileInfo: anXdInfo ] asBlTktCommand
]

{ #category : #'private - execution' }
XdAsyncClient >> executeCommand: aCommand [
	<return: #TKTFuture>
	| aFuture |
	aFuture := self pool future: aCommand asBlTktCommand.
	aFuture onSuccessDo: [ :result | self notifyResult: result ].
	aFuture onFailureDo: [ :anException | self notifyFailure: anException ].
	^ aFuture
]

{ #category : #initialization }
XdAsyncClient >> initialize [
	super initialize.
	client := self defaultClient.
	pool := self defaultPool.
	successCallbacks := self defaultCallbacks.
	failureCallbacks := self defaultCallbacks.
]

{ #category : #notifying }
XdAsyncClient >> notifyFailure: anException [ 
	self onFailure do: [ :eachCallback | eachCallback value: anException ]
]

{ #category : #notifying }
XdAsyncClient >> notifyResult: anObject [ 
	self onSuccess do: [ :eachCallback | eachCallback value: anObject ]
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
