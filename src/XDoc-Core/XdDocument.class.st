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

{ #category : #accessing }
XdDocument >> gtComponentsFor: aView [
	<gtView>
	^ aView list
		title: 'Components';
		priority: 1;
		items: [ self components asOrderedCollection ];
		itemFormat: [ :eachComponent | 
			'Link to attachment id: ', eachComponent link asString ]
]

{ #category : #initialization }
XdDocument >> initialize [
	super initialize.
	components := #().
	type := XdUndefinedType.
]

{ #category : #actions }
XdDocument >> openXdFileInPharo: aXdFile [ 
	^ self type openDocument: self ofXdFileInPharo: aXdFile
]

{ #category : #printing }
XdDocument >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPut: $(;
		nextPutAll: (self type ifNotNil: #typeString ifNil: [ 'no-type' ]);
		nextPut: $,;
		space.
	self components 
		ifNotNil: [ :anArray |
			aStream 
				print: anArray size; 
				space;
				nextPutAll: ('component' asPluralBasedOn: anArray size) ]
		ifNil: [ aStream nextPutAll: 'no-components' ].
	aStream nextPut: $)
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
