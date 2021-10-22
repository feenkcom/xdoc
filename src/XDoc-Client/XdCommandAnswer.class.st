Class {
	#name : #XdCommandAnswer,
	#superclass : #Object,
	#traits : 'TGtAssert + TGtResponseStatus',
	#classTraits : 'TGtAssert classTrait + TGtResponseStatus classTrait',
	#instVars : [
		'response',
		'command',
		'commandChain'
	],
	#category : 'XDoc-Client-Answers'
}

{ #category : #accessing }
XdCommandAnswer >> command [
	<return: #XdClientCommand>
	^ command
]

{ #category : #accessing }
XdCommandAnswer >> command: anXdClientCommand [
	self 
		assert: [ anXdClientCommand isNotNil ] 
		description: [ 'Command response must be non-nil' ].
	command := anXdClientCommand
]

{ #category : #accessing }
XdCommandAnswer >> commandChain [
	^ commandChain
]

{ #category : #accessing }
XdCommandAnswer >> commandChain: anObject [
	commandChain := anObject
]

{ #category : #'gt-extension' }
XdCommandAnswer >> gtCommandsFor: aView [
	<gtView>
	self commandChain ifNil: [ ^ aView empty ].
	^ aView forward 
		title: 'Command Chain';
		object: [ self commandChain ];
		view: #gtCommandsFor:
]

{ #category : #testing }
XdCommandAnswer >> hasResponse [
	<return: #Boolean>
	^ self response isResponse
]

{ #category : #initialization }
XdCommandAnswer >> initialize [
	super initialize.
	command := XdClientCommand null.
	commandChain := XdClientCommand null.
	response := XdZincResponse null.
]

{ #category : #accessing }
XdCommandAnswer >> response [
	<return: #XdZincResponse>
	^ response
]

{ #category : #accessing }
XdCommandAnswer >> response: aXdZincResponse [
	self 
		assert: [ aXdZincResponse isNotNil ] 
		description: [ 'Zinc response must be non-nil' ].
	response := aXdZincResponse
]

{ #category : #'accessing - response' }
XdCommandAnswer >> statusLineMessage [
	^ self response statusLineMessage
]
