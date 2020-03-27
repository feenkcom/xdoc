Class {
	#name : #XdNavigatorContext,
	#superclass : #XdObject,
	#traits : 'TXdFileAccesssor',
	#classTraits : 'TXdFileAccesssor classTrait',
	#instVars : [
		'navigator',
		'results'
	],
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #enumerating }
XdNavigatorContext >> allStepsAndResults [
	<return: #Array of: #Association>
	^ Array streamContents: [ :aStream | 
		self results ifNotEmpty: [ 
			aStream nextPut: self navigator -> self results first ].
		self navigator allSteps withIndexDo: [ :eachStep :anIndex | 
			| aResult |
			aResult := self results size > anIndex 
				ifTrue: [ self results at: anIndex + 1 ] 
				ifFalse: [ nil ].
			aStream nextPut: eachStep -> aResult ] ]
]

{ #category : #initialization }
XdNavigatorContext >> initialize [
	super initialize.
	results := OrderedCollection new.
]

{ #category : #'accessing - convenience' }
XdNavigatorContext >> manifest [
	<return: #XdManifest>
	^ self xdFile manifest
]

{ #category : #accessing }
XdNavigatorContext >> navigator [
	<return: #XdNavigator>
	^ navigator
]

{ #category : #accessing }
XdNavigatorContext >> navigator: anXdNavigator [
	navigator := anXdNavigator
]

{ #category : #accessing }
XdNavigatorContext >> result [
	^ results last
]

{ #category : #accessing }
XdNavigatorContext >> result: anObject [
	results addLast: anObject
]

{ #category : #accessing }
XdNavigatorContext >> results [
	^ results
]

{ #category : #'accessing - convenience' }
XdNavigatorContext >> streamingStrategy [
	<return: #XdStreamingStrategy>
	^ self xdFile streamingStrategy
]
