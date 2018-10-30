Class {
	#name : #XdPlayBookPublishInfo,
	#superclass : #XdPublishInfo,
	#instVars : [
		'book'
	],
	#category : #'XDoc-Core-Publisher'
}

{ #category : #converting }
XdPlayBookPublishInfo >> asStencilBuilder [
	^ XdPillarPublishInfoStencilBuilder new info: self
]

{ #category : #accessing }
XdPlayBookPublishInfo >> book [
	^ book
]

{ #category : #accessing }
XdPlayBookPublishInfo >> book: anObject [
	book := anObject
]

{ #category : #initialization }
XdPlayBookPublishInfo >> initialize [
	super initialize.
	book := GtPlayBook empty.
]

{ #category : #'api - actions' }
XdPlayBookPublishInfo >> publish [
	GtPhlowUseTaskItView 
		value: false during: [
			XdPlayBookPublisher new
				info: self;
				prepare. ]
]
