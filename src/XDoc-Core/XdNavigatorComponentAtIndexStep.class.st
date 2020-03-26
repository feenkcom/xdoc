Class {
	#name : #XdNavigatorComponentAtIndexStep,
	#superclass : #XdNavigatorObjectAtIndexStep,
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #asserting }
XdNavigatorComponentAtIndexStep >> assertResultIn: anXdNavigatorContext [
	
]

{ #category : #defaults }
XdNavigatorComponentAtIndexStep >> defaultName [
	<return: #String>
	^ 'Component'
]

{ #category : #'private - finding' }
XdNavigatorComponentAtIndexStep >> findHereUsingContext: anXdNavigatorContext [ 
	| aComponent |
	self assertResultIn: anXdNavigatorContext.
	aComponent := self 
		inCollection: anXdNavigatorContext result components 
		ifAbsent: [ XdComponent empty ].
	anXdNavigatorContext result: aComponent.
]
