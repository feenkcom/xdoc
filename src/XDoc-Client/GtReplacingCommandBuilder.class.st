Class {
	#name : #GtReplacingCommandBuilder,
	#superclass : #GtDecoratingCommandBuilder,
	#category : #'XDoc-Client-Decorating Command Builder'
}

{ #category : #accessing }
GtReplacingCommandBuilder >> replace: aCommand [
	| anIndex |
	self
		assert: [ aCommand isNotNil ] 
		description: [ 'Decorating command must be non-nil' ].
	anIndex := self commands
		detectIndex: [ :eachCommand | aCommand shouldReplace: eachCommand ] 
		ifNone: [ self command: aCommand. ^ self ].
	self commands: (self commands copy at: anIndex put: aCommand; yourself).
]
