Class {
	#name : #GtDecoratingCommandBuilder,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'commands'
	],
	#category : #'XDoc-Client-Decorating Command Builder'
}

{ #category : #accessing }
GtDecoratingCommandBuilder >> command: aCommand [
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Decorating command must be non-nil' ].
	self commands: (self commands copyWith: aCommand).
]

{ #category : #accessing }
GtDecoratingCommandBuilder >> commands [
	^ commands
]

{ #category : #accessing }
GtDecoratingCommandBuilder >> commands: anObject [
	commands := anObject
]

{ #category : #'private - execution' }
GtDecoratingCommandBuilder >> decorateCommand: aCommand [
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Executable command must be non-nil' ].
	^ self commands 
		inject: aCommand 
		into: [ :aComposition :eachDecoratedCommand | 
			eachDecoratedCommand copy command: aComposition ].
]

{ #category : #defaults }
GtDecoratingCommandBuilder >> defaultCommands [
	^ Array empty 
]

{ #category : #executing }
GtDecoratingCommandBuilder >> execute: aCommand [
	| aDecoratedCommand |
	aDecoratedCommand := self decorateCommand: aCommand.
	aDecoratedCommand execute.
]

{ #category : #'gt-extension' }
GtDecoratingCommandBuilder >> gtCommandsFor: aView [
	<gtView>
	self commands ifNil: [ ^ aView empty ].
	^ aView list
		title: 'Commands';
		priority: 1;
		items: [ self commands ]
]

{ #category : #initialization }
GtDecoratingCommandBuilder >> initialize [
	super initialize.
	commands := self defaultCommands.
]
