Class {
	#name : #XdAsyncClient,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'client',
		'callbacks'
	],
	#category : #'XDoc-Client-Core'
}

{ #category : #initialization }
XdAsyncClient >> callback: aCallback [
	self 
		assert: [ aCallback notNil ] 
		description: [ 'Async callback must be non-nil' ].
	callbacks add: aCallback.
]

{ #category : #accessing }
XdAsyncClient >> callbacks [
	<return: #OrderedCollection of: #Valuable>
	^ callbacks
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

{ #category : #accessing }
XdAsyncClient >> documents [
	^ self downloadList
]

{ #category : #actions }
XdAsyncClient >> downloadList [
	(BlValuableCommand new
		valuable: [ self client downloadList ]) future
			onSuccessDo: [ :result | self resultNotification: result ]
]

{ #category : #actions }
XdAsyncClient >> downloadPreviewImageUsingFileInfo: aXdFileInfo [
	(BlValuableCommand new
		valuable: [ self client downloadPreviewImageUsingFileInfo: aXdFileInfo ]) future
			onSuccessDo: [ :result | self resultNotification: result ]
]

{ #category : #actions }
XdAsyncClient >> downloadXDocUsingFileInfo: anXdInfo [
	(BlValuableCommand new
		valuable: [ self client downloadXDocUsingFileInfo: anXdInfo ]) future
			onSuccessDo: [ :result | self resultNotification: result ]
]

{ #category : #initialization }
XdAsyncClient >> initialize [
	super initialize.
	client := XdClient null.
	callbacks := OrderedCollection new: 1.
]

{ #category : #notifying }
XdAsyncClient >> resultNotification: anObject [ 
	self callbacks do: [ :eachCallback | eachCallback value: anObject ]
]
