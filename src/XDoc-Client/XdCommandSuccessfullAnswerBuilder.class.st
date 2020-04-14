Class {
	#name : #XdCommandSuccessfullAnswerBuilder,
	#superclass : #Object,
	#traits : 'TXdCommandVisitor',
	#classTraits : 'TXdCommandVisitor classTrait',
	#instVars : [
		'context'
	],
	#category : #'XDoc-Client-Answers - Builder'
}

{ #category : #building }
XdCommandSuccessfullAnswerBuilder >> buildAnswer: anAsnwer withCommand: aCommand [
	^ anAsnwer
		command: aCommand;
		commandChain: self context commandChain;
		response: (XdZincResponse new response: aCommand response)
]

{ #category : #accessing }
XdCommandSuccessfullAnswerBuilder >> context [
	^ context
]

{ #category : #accessing }
XdCommandSuccessfullAnswerBuilder >> context: anObject [
	context := anObject
]

{ #category : #visiting }
XdCommandSuccessfullAnswerBuilder >> visitXdClientPublishXDocCommand: aCommand [
	^ self 
		buildAnswer: XdSuccessfullyPublishedAnswer new 
		withCommand: aCommand
]

{ #category : #visiting }
XdCommandSuccessfullAnswerBuilder >> visitXdClientUpdateXDocCommand: aCommand [
	^ self 
		buildAnswer: XdSuccessfullyUpdatedAnswer new 
		withCommand: aCommand
]
