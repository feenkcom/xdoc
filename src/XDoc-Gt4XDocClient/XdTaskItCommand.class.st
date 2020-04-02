Class {
	#name : #XdTaskItCommand,
	#superclass : #XdDelegateCommand,
	#instVars : [
		'pool',
		'onSuccess',
		'onFailure',
		'future',
		'answer'
	],
	#category : #'XDoc-Gt4XDocClient-Commands'
}

{ #category : #visitor }
XdTaskItCommand >> accept: aVisitor [
	^ aVisitor visitXdTaskItCommand: self
]

{ #category : #execution }
XdTaskItCommand >> execute [
	future := BlTktWorkerProvider highUICPUBoundPool
		future: [ self command execute. self command ].
	self subscribeFutureCallbacks.
]

{ #category : #accessing }
XdTaskItCommand >> future [
	<return: #TKTFuture>
	^ future
]

{ #category : #initialization }
XdTaskItCommand >> initialize [
	super initialize.
	onFailure := OrderedCollection new: 2.
	onSuccess := OrderedCollection new: 2.
]

{ #category : #accessing }
XdTaskItCommand >> onFailure [
	^ onFailure
]

{ #category : #accessing }
XdTaskItCommand >> onFailureDo: aCallback [
	onFailure add: aCallback
]

{ #category : #accessing }
XdTaskItCommand >> onSuccess [
	^ onSuccess
]

{ #category : #accessing }
XdTaskItCommand >> onSuccessDo: aCallback [
	onSuccess add: aCallback
]

{ #category : #accessing }
XdTaskItCommand >> pool [
	^ pool ifNil: [ pool := BlTktWorkerProvider highUIExternalResourceBoundPool ]
]

{ #category : #accessing }
XdTaskItCommand >> pool: aBlTktCommonQueueWorkerPool [
	self 
		assert: [ aBlTktCommonQueueWorkerPool isNotNil ]
		description: [ 'Worker pool must be non-nil' ].
	pool := aBlTktCommonQueueWorkerPool
]

{ #category : #printing }
XdTaskItCommand >> printOn: aStream [
	aStream nextPutAll: 'Execute in TaskIt background process'.
	
]

{ #category : #'private - subscriptions' }
XdTaskItCommand >> subscribeFutureCallbacks [
	self onSuccess
		do: [ :eachCallback | self future onSuccessDo: eachCallback ].
	self onSuccess
		do: [ :eachCallback | self future onFailureDo: eachCallback ]
]
