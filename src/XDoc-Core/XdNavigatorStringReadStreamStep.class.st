Class {
	#name : #XdNavigatorStringReadStreamStep,
	#superclass : #XdNavigatorStep,
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #'private - finding' }
XdNavigatorStringReadStreamStep >> findHereUsingContext: anXdNavigatorContext [ 
	| aResult |
	self 
		assert: [ anXdNavigatorContext result respondsTo: #asXdStringReadStream ]
		description: [ 'Previous search context result must understand the #asXdStringReadStream message' ].
	aResult := anXdNavigatorContext result asXdStringReadStream.
	self 
		assert: [ aResult isNotNil ]
		description: [ 'Read stream must be non-nil' ].
	aResult streamingStrategy: anXdNavigatorContext streamingStrategy.
	anXdNavigatorContext result: aResult.
]

{ #category : #initialization }
XdNavigatorStringReadStreamStep >> setStringReadStreamUsingContext: anXdNavigatorContext [
	| aFileName |
	aFileName := anXdNavigatorContext fileName.
	
]
