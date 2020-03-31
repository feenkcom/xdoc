Class {
	#name : #XdDelegateCommand,
	#superclass : #XdClientCommand,
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
