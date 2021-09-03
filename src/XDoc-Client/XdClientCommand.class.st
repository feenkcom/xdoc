Class {
	#name : 'XdClientCommand',
	#superclass : 'XdProtoClientCommand',
	#instVars : [
		'client',
		'signalProgress',
		'zincClient'
	],
	#category : 'XDoc-Client-Commands'
}

{ #category : 'factory' }
XdClientCommand class >> null [
	^ XdNullCommand default
]

{ #category : 'visiting' }
XdClientCommand >> accept: aVisitor [
	^ self subclassResponsibility
]

{ #category : 'private ' }
XdClientCommand >> authenticatedZincClient [
	<return: #ZnClient>
	| aClient |
	aClient := self zincClient.
	self client authentication 
		zincClient: aClient;
		execute.
	^ aClient
]

{ #category : 'accessing' }
XdClientCommand >> client [
	^ client
]

{ #category : 'accessing' }
XdClientCommand >> client: anObject [
	client := anObject
]

{ #category : 'initialization' }
XdClientCommand >> initialize [
	super initialize.
	client := XdClient null.
	signalProgress := false.
]

{ #category : 'accessing' }
XdClientCommand >> signalProgress [
	<return: #Boolean>
	^ signalProgress
]

{ #category : 'accessing' }
XdClientCommand >> signalProgress: aBoolean [
	signalProgress := aBoolean
]

{ #category : 'private ' }
XdClientCommand >> zincClient [
	^ zincClient ifNil: [ zincClient := ZnClient new ]
]
