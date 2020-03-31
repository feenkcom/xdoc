Class {
	#name : #XdPublishInfo,
	#superclass : #Object,
	#instVars : [
		'author',
		'title',
		'description',
		'publishAction',
		'username',
		'password'
	],
	#category : #'XDoc-Gt4XDocClient-Publish'
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
	username := ''.
	password := ''.
	publishAction := [ self inform: 'Fake publish action' ].
]

{ #category : #accessing }
XdPublishInfo >> password [
	^ password
]

{ #category : #accessing }
XdPublishInfo >> password: anObject [
	password := anObject
]

{ #category : #'api - actions' }
XdPublishInfo >> publish [
	"do nothing"
	self publishAction cull: self
]

{ #category : #accessing }
XdPublishInfo >> publishAction [
	^ publishAction
]

{ #category : #accessing }
XdPublishInfo >> publishAction: anObject [
	publishAction := anObject
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

{ #category : #accessing }
XdPublishInfo >> username [
	^ username
]

{ #category : #accessing }
XdPublishInfo >> username: anObject [
	username := anObject
]
