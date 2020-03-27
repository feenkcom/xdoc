Class {
	#name : #XdNullClient,
	#superclass : #XdProtoClient,
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

{ #category : #accessing }
XdNullClient >> async [
	^ self
]

{ #category : #accessing }
XdNullClient >> callback: aBlockClosure [ 
	"do nothing"
]

{ #category : #accessing }
XdNullClient >> documents [
	^ #()
]
