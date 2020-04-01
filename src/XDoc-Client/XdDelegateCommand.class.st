Class {
	#name : #XdDelegateCommand,
	#superclass : #XdProtoClientCommand,
	#instVars : [
		'command'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #testing }
XdDelegateCommand class >> isAbstract [
	^ self name = #XdDelegateCommand 
]

{ #category : #accessing }
XdDelegateCommand >> command [
	^ command
]

{ #category : #accessing }
XdDelegateCommand >> command: anObject [
	command := anObject
]

{ #category : #executing }
XdDelegateCommand >> executeSubCommand [
	self command execute
]

{ #category : #'private ' }
XdDelegateCommand >> zincClient [
	<return: #ZnClient>
	^ self command zincClient
]
