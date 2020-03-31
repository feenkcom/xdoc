Class {
	#name : #XdCommandResponse,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'response',
		'command'
	],
	#category : #'XDoc-Client-Responses'
}

{ #category : #accessing }
XdCommandResponse >> command [
	<return: #XdClientCommand>
	^ command
]

{ #category : #accessing }
XdCommandResponse >> command: anXdClientCommand [
	self 
		assert: [ anXdClientCommand isNotNil ] 
		description: [ 'Command response must be non-nil' ].
	command := anXdClientCommand
]

{ #category : #initialization }
XdCommandResponse >> initialize [
	super initialize.
	command := XdClientCommand null.
	response := XdZincResponse null.
]

{ #category : #accessing }
XdCommandResponse >> response [
	<return: #XdZincResponse>
	^ response
]

{ #category : #accessing }
XdCommandResponse >> response: aXdZincResponse [
	self 
		assert: [ aXdZincResponse isNotNil ] 
		description: [ 'Zinc response must be non-nil' ].
	response := aXdZincResponse
]
