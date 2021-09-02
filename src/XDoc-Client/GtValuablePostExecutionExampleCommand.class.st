Class {
	#name : 'GtValuablePostExecutionExampleCommand',
	#superclass : 'Object',
	#traits : 'TGtReplacingCommand',
	#classTraits : 'TGtReplacingCommand classTrait',
	#instVars : [
		'command',
		'valuable'
	],
	#category : 'XDoc-Client-Decorating Command Builder'
}

{ #category : 'accessing' }
GtValuablePostExecutionExampleCommand >> command [
	^ command
]

{ #category : 'accessing' }
GtValuablePostExecutionExampleCommand >> command: anObject [
	command := anObject
]

{ #category : 'execution' }
GtValuablePostExecutionExampleCommand >> execute [
	self command execute.
	self valuable value: self command.
	
]

{ #category : 'initialization' }
GtValuablePostExecutionExampleCommand >> initialize [
	super initialize.
	valuable := [ :aCommand | "do nothing" ].
]

{ #category : 'accessing' }
GtValuablePostExecutionExampleCommand >> result: aValue [
	self command result: aValue
]

{ #category : 'accessing' }
GtValuablePostExecutionExampleCommand >> valuable [
	^ valuable
]

{ #category : 'accessing' }
GtValuablePostExecutionExampleCommand >> valuable: anObject [
	valuable := anObject
]
