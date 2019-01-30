Class {
	#name : #XdClientCommand,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'client'
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
