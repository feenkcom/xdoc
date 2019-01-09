Class {
	#name : #XdPublishInfo,
	#superclass : #Object,
	#instVars : [
		'author',
		'title',
		'description'
	],
	#category : #'XDoc-Client-Brick'
}

{ #category : #accessing }
XdPublishInfo >> author [
	^ author
]

{ #category : #accessing }
XdPublishInfo >> author: aStringOrBlRope [
	self 
		assert: [ aStringOrBlRope notNil ] 
		description: [ 'Document author must be non-nil' ].
	author := aStringOrBlRope asRopedText
]

{ #category : #accessing }
XdPublishInfo >> description [
	^ description
]

{ #category : #accessing }
XdPublishInfo >> description: aStringOrBlRope [
	self 
		assert: [ aStringOrBlRope notNil ] 
		description: [ 'Document description must be non-nil' ].
	description := aStringOrBlRope asRopedText
]

{ #category : #initialization }
XdPublishInfo >> initialize [
	super initialize.
	author := ''.
	description := ''.
	title := ''.
]

{ #category : #accessing }
XdPublishInfo >> title [
	^ title
]

{ #category : #accessing }
XdPublishInfo >> title: aStringOrBlRope [
	self 
		assert: [ aStringOrBlRope notNil ] 
		description: [ 'Document title must be non-nil' ].
	title := aStringOrBlRope asRopedText
]
