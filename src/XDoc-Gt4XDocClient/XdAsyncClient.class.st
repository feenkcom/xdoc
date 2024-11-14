Class {
	#name : #XdAsyncClient,
	#superclass : #XdProtoClient,
	#instVars : [
		'client',
		'successCallbacks',
		'failureCallbacks',
		'futureConfiguration'
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
XdAsyncClient >> defaultFutureConfiguration [
	^ XdAsyncConfiguration defaultFutureConfiguration
]

{ #category : #actions }
XdAsyncClient >> documents [
	^ self executeCommand: [ self client documents ].
]

{ #category : #actions }
XdAsyncClient >> downloadPreviewImageUsingFileInfo: aXdFileInfo [
	^ self executeCommand: [ self client downloadPreviewImageUsingFileInfo: aXdFileInfo ].
]

{ #category : #actions }
XdAsyncClient >> downloadXDocUsingFileInfo: anXdInfo [
	^ self executeCommand: [ self client downloadXDocUsingFileInfo: anXdInfo ]
]

{ #category : #'private - execution' }
XdAsyncClient >> executeCommand: aFuture [
	| aPromise |
	aPromise := aFuture asAsyncFuture await: self futureConfiguration.
	aPromise then: [ :result | self notifyResult: result ] otherwise: [ :anException | self notifyFailure: anException ].
	^ aPromise
]

{ #category : #accessing }
XdAsyncClient >> futureConfiguration [
	<return: #AsyncFutureExecutionConfiguration>
	^ futureConfiguration ifNil: [ 
		futureConfiguration := self defaultFutureConfiguration ]
]

{ #category : #accessing }
XdAsyncClient >> futureConfiguration: aAsyncFutureExecutionConfiguration [
	futureConfiguration := aAsyncFutureExecutionConfiguration
]

{ #category : #initialization }
XdAsyncClient >> initialize [
	super initialize.
	client := self defaultClient.
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
