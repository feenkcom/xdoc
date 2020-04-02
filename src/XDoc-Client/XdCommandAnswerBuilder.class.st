Class {
	#name : #XdCommandAnswerBuilder,
	#superclass : #Object,
	#traits : 'TXdCommandVisitor + TGtAssert',
	#classTraits : 'TXdCommandVisitor classTrait + TGtAssert classTrait',
	#instVars : [
		'context'
	],
	#category : #'XDoc-Client-Answers - Builder'
}

{ #category : #building }
XdCommandAnswerBuilder >> build [
	<return: #XdCommandAnswer>
	^ self context commandChain accept: self
]

{ #category : #'private - building' }
XdCommandAnswerBuilder >> buildAuthenticationRequiredResponse [
	<return: #XdCommandAnswer>
	^ self initializeResponse: XdAuthenticationRequiredAnswer new.
]

{ #category : #'private - building' }
XdCommandAnswerBuilder >> buildErrorResponse [
	<return: #XdCommandAnswer>
	^ self initializeResponse: XdErrorAnswer new.
]

{ #category : #'private - building' }
XdCommandAnswerBuilder >> buildResponse: aCommand [
	| aZnResponse |
	self context command: aCommand.
	aZnResponse := aCommand response.
	aZnResponse isAuthenticationRequired ifTrue: [ ^ self buildAuthenticationRequiredResponse ].
	aZnResponse isSuccess ifTrue: [ ^ self buildSuccessfulResponse ].
	aZnResponse isError ifTrue: [ ^ self buildErrorResponse ].
	self error: 'Response code is not handled'
]

{ #category : #'private - building' }
XdCommandAnswerBuilder >> buildSuccessfulResponse [
	<return: #XdCommandAnswer>
	^ self context command accept: (XdCommandSuccessfullAnswerBuilder new context: self context).
]

{ #category : #accessing }
XdCommandAnswerBuilder >> commandChain: aXdCommand [
	self context commandChain: aXdCommand
]

{ #category : #accessing }
XdCommandAnswerBuilder >> context [
	^ context
]

{ #category : #accessing }
XdCommandAnswerBuilder >> context: anObject [
	context := anObject
]

{ #category : #'gt-extension' }
XdCommandAnswerBuilder >> gtCommandsFor: aView [
	<gtView>
	self context ifNil: [ ^ aView empty ].
	^ aView forward 
		title: 'Command Chain';
		object: [ self context commandChain ];
		view: #gtCommandsFor:
]

{ #category : #initialization }
XdCommandAnswerBuilder >> initialize [
	super initialize.
	context := XdCommandResponseAnswerContext new.
]

{ #category : #'private - building' }
XdCommandAnswerBuilder >> initializeResponse: aXdCommandResponse [
	<return: #XdCommandAnswer>
	^ aXdCommandResponse
		command: self context command;
		commandChain: self context commandChain;
		response: (XdZincResponse new response: self context command response)
]

{ #category : #visiting }
XdCommandAnswerBuilder >> visitXdClientPublishXDocCommand: aCommand [
	^ self buildResponse: aCommand
]

{ #category : #visiting }
XdCommandAnswerBuilder >> visitXdTaskItCommand: aCommand [
	^ XdTaskItCommandAnswer new
		command: aCommand;
		commandChain: self context commandChain;
		future: aCommand future.
]
