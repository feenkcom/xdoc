Class {
	#name : #XdPublishInfo,
	#superclass : #XdProtoPublishInfo,
	#instVars : [
		'author',
		'title',
		'description'
	],
	#category : #'XDoc-Core-Publisher'
}

{ #category : #accessing }
XdPublishInfo class >> empty [
	^ XdEmptyPublishInfo uniqueInstance
]

{ #category : #testing }
XdPublishInfo class >> isAbstract [
	^ self name = #OldXdPublishInfo 
]

{ #category : #converting }
XdPublishInfo >> asElement [
	<return: #BlElement>
	^ self asStencilBuilder asElement
]

{ #category : #converting }
XdPublishInfo >> asStencilBuilder [
	<return: #BrStencilBuilder>
	^ self subclassResponsibility
]

{ #category : #'api - accessing' }
XdPublishInfo >> author [
	^ author
]

{ #category : #'api - accessing' }
XdPublishInfo >> author: aStringOrBlRope [
	self 
		assert: [ aStringOrBlRope notNil ] 
		description: [ 'Document author must be non-nil' ].
	author := aStringOrBlRope asRopedText
]

{ #category : #'api - accessing' }
XdPublishInfo >> description [
	^ description
]

{ #category : #'api - accessing' }
XdPublishInfo >> description: aStringOrBlRope [
	self 
		assert: [ aStringOrBlRope notNil ] 
		description: [ 'Document description must be non-nil' ].
	description := aStringOrBlRope asRopedText
]

{ #category : #'gt-extension' }
XdPublishInfo >> gtLiveFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Live';
		priority: 1;
		stencil: self
]

{ #category : #initialization }
XdPublishInfo >> initialize [
	super initialize.
	self initializeAuthor.
	self initializeTitle.
	self initializeDescription.
]

{ #category : #initialization }
XdPublishInfo >> initializeAuthor [
	author := (String streamContents: [ :aStream | 
		Author fullName do: [ :eachCharacter | 
			eachCharacter isUppercase ifTrue: [ aStream space ].
			aStream nextPut: eachCharacter ] ]) trimBoth asRopedText
]

{ #category : #initialization }
XdPublishInfo >> initializeDescription [
	description := '' asRopedText
]

{ #category : #initialization }
XdPublishInfo >> initializeTitle [
	title := '' asRopedText
]

{ #category : #'api - accessing' }
XdPublishInfo >> title [
	^ title
]

{ #category : #'api - accessing' }
XdPublishInfo >> title: aStringOrBlRope [
	self 
		assert: [ aStringOrBlRope notNil ] 
		description: [ 'Document title must be non-nil' ].
	title := aStringOrBlRope asRopedText
]
