Class {
	#name : #XdDocument,
	#superclass : #Object,
	#instVars : [
		'type',
		'components'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdDocument >> components [
	<return: #Array of: #XdComponent>
	^ components
]

{ #category : #accessing }
XdDocument >> components: aXdComponent [
	self 
		assert: [ aXdComponent notNil ] 
		description: [ 'Document component must be non-nil' ].
	components := aXdComponent
]

{ #category : #initialization }
XdDocument >> initialize [
	super initialize.
	components := #().
	type := XdUndefinedType.
]

{ #category : #accessing }
XdDocument >> type [
	<return: #XdType>
	^ type
]

{ #category : #accessing }
XdDocument >> type: aXdType [
	self 
		assert: [ aXdType notNil ] 
		description: [ 'Document type must be non-nil' ].
	type := aXdType
]
