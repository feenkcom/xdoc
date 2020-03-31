Class {
	#name : #GtDecoratedCommandBuilder,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#instVars : [
		'commands'
	],
	#category : #'XDoc-Client-Decorated Command Builder'
}

{ #category : #accessing }
GtDecoratedCommandBuilder >> command: aCommand [
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Decorating command must be non-nil' ].
	self commands: (self commands copyWith: aCommand).
]

{ #category : #accessing }
GtDecoratedCommandBuilder >> commands [
	^ commands
]

{ #category : #accessing }
GtDecoratedCommandBuilder >> commands: anObject [
	commands := anObject
]

{ #category : #'private - execution' }
GtDecoratedCommandBuilder >> decorateCommand: aCommand [
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Executable command must be non-nil' ].
	^ self commands 
		inject: aCommand 
		into: [ :aComposition :eachDecoratedCommand | 
			eachDecoratedCommand copy command: aComposition ].
]

{ #category : #defaults }
GtDecoratedCommandBuilder >> defaultCommands [
	^ Array empty 
]

{ #category : #executing }
GtDecoratedCommandBuilder >> execute: aCommand [
	| aDecoratedCommand |
	aDecoratedCommand := self decorateCommand: aCommand.
	aDecoratedCommand execute.
]

{ #category : #'gt-extension' }
GtDecoratedCommandBuilder >> gtCommandsFor: aView [
	<gtView>
	self commands ifNil: [ ^ aView empty ].
	^ aView list
		title: 'Commands';
		priority: 1;
		items: [ self commands ]
]

{ #category : #initialization }
GtDecoratedCommandBuilder >> initialize [
	super initialize.
	commands := self defaultCommands.
]
