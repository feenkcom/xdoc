Class {
	#name : #XdCommandResponseBuilder,
	#superclass : #Object,
	#instVars : [
		'command'
	],
	#category : #'XDoc-Client-Responses'
}

{ #category : #building }
XdCommandResponseBuilder >> build [
	<return: #XdCommandResponse>
	| aZnResponse |
	aZnResponse := self command response.
	aZnResponse isAuthenticationRequired ifTrue: [ ^ self buildAuthenticationRequiredResponse ].
	aZnResponse isSuccess ifTrue: [ ^ self buildSuccessfulResponse ].
	aZnResponse isError ifTrue: [ ^ self buildErrorResponse ].
	self error: 'Response code is not handled'
]

{ #category : #'private - building' }
XdCommandResponseBuilder >> buildAuthenticationRequiredResponse [
	<return: #XdCommandResponse>
	^ self buildResponse: XdAuthenticationRequiredResponse new.
]

{ #category : #'private - building' }
XdCommandResponseBuilder >> buildErrorResponse [
	<return: #XdCommandResponse>
	^ self buildResponse: XdErrorResponse new.
]

{ #category : #'private - building' }
XdCommandResponseBuilder >> buildResponse: aXdCommandResponse [
	<return: #XdCommandResponse>
	^ aXdCommandResponse
		command: self command;
		response: (XdZincResponse new response: self command response)
]

{ #category : #'private - building' }
XdCommandResponseBuilder >> buildSuccessfulResponse [
	<return: #XdCommandResponse>
	| aClass |
	aClass := self command accept: XdCommandSuccessfullResponseVisitor default.
	^ self buildResponse: aClass new
]

{ #category : #accessing }
XdCommandResponseBuilder >> command [
	^ command
]

{ #category : #accessing }
XdCommandResponseBuilder >> command: anXdCommand [
	self 
		assert: [ anXdCommand isNotNil ] 
		description: [ 'Command must be non-nil' ].
	command := anXdCommand
]
