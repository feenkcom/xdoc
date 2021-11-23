Class {
	#name : #LeUserSpaces,
	#superclass : #Object,
	#classInstVars : [
		'leUserSpaces',
		'selected'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #streams }
LeUserSpaces class >> default [
	^ leUserSpaces
]

{ #category : #accessing }
LeUserSpaces class >> selected [
	^ selected
]

{ #category : #accessing }
LeUserSpaces class >> selected: aSpace [
	selected := aSpace
]

{ #category : #accessing }
LeUserSpaces class >> set: aSpaces [
	leUserSpaces := aSpaces.
	(aSpaces notEmpty and: [ selected isNil ]) ifTrue: [ selected := aSpaces first ]
]
