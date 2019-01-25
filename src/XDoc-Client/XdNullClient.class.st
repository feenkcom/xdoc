Class {
	#name : #XdNullClient,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Client-Core'
}

{ #category : #cleanup }
XdNullClient class >> cleanUp [
	self resetUniqueInstance
]

{ #category : #cleanup }
XdNullClient class >> resetUniqueInstance [
	uniqueInstance := nil
]

{ #category : #accessing }
XdNullClient class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]
