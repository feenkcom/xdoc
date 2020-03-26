Class {
	#name : #XdClientCommand,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'client',
		'signalProgress'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #accessing }
XdClientCommand >> client [
	^ client
]

{ #category : #accessing }
XdClientCommand >> client: anObject [
	client := anObject
]

{ #category : #execution }
XdClientCommand >> execute [
	self subclassResponsibility
]

{ #category : #initialization }
XdClientCommand >> initialize [
	super initialize.
	client := XdClient null.
	signalProgress := false.
]

{ #category : #accessing }
XdClientCommand >> name [
	^ self printString
]

{ #category : #accessing }
XdClientCommand >> signalProgress [
	<return: #Boolean>
	^ signalProgress
]

{ #category : #accessing }
XdClientCommand >> signalProgress: aBoolean [
	signalProgress := aBoolean
]
