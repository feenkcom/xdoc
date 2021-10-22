Class {
	#name : #XdCommandResponseAnswerContext,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'command',
		'commandChain'
	],
	#category : 'XDoc-Client-Answers - Builder'
}

{ #category : #accessing }
XdCommandResponseAnswerContext >> command [
	^ command
]

{ #category : #accessing }
XdCommandResponseAnswerContext >> command: anXdCommand [
	self 
		assert: [ anXdCommand isNotNil ] 
		description: [ 'Command must be non-nil' ].
	command := anXdCommand
]

{ #category : #accessing }
XdCommandResponseAnswerContext >> commandChain [
	^ commandChain
]

{ #category : #accessing }
XdCommandResponseAnswerContext >> commandChain: anObject [
	commandChain := anObject
]

{ #category : #accessing }
XdCommandResponseAnswerContext >> gtCommandsFor: aView [
	<gtView>
	self commandChain ifNil: [ ^ aView empty ].
	^ aView forward 
		title: 'Command Chain';
		object: [ self commandChain ];
		view: #gtCommandsFor:
]
