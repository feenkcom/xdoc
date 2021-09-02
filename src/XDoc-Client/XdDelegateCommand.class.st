Class {
	#name : 'XdDelegateCommand',
	#superclass : 'XdProtoClientCommand',
	#instVars : [
		'command'
	],
	#category : 'XDoc-Client-Commands'
}

{ #category : 'testing' }
XdDelegateCommand class >> isAbstract [
	^ self name = #XdDelegateCommand 
]

{ #category : 'gt-extension' }
XdDelegateCommand >> allCommands [
	^ Array streamContents: [ :aStream |
		self putCommandsInto: aStream ] 
]

{ #category : 'accessing' }
XdDelegateCommand >> command [
	^ command
]

{ #category : 'accessing' }
XdDelegateCommand >> command: anObject [
	command := anObject
]

{ #category : 'executing' }
XdDelegateCommand >> executeSubCommand [
	self command execute
]

{ #category : 'gt-extension' }
XdDelegateCommand >> gtCommandsFor: aView [
	<gtView>
	self command ifNil: [ ^ aView empty ].
	^ aView list 
		title: 'Commands';
		items: [ self allCommands ]
]

{ #category : 'gt-extension' }
XdDelegateCommand >> putCommandsInto: aStream [
	aStream nextPut: self.
	self command ifNil: [ ^ self ].
	(self command respondsTo: #putCommandsInto:) 
		ifFalse: [ 
			aStream nextPut: self command.
			^ self ].
	self command putCommandsInto: aStream
]

{ #category : 'private ' }
XdDelegateCommand >> response [
	<return: #ZnResponse>
	^ self command response 
]

{ #category : 'private ' }
XdDelegateCommand >> zincClient [
	<return: #ZnClient>
	^ self command zincClient
]
