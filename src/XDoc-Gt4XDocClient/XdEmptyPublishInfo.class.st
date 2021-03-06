Class {
	#name : #XdEmptyPublishInfo,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Gt4XDocClient-Publish'
}

{ #category : #cleanup }
XdEmptyPublishInfo class >> cleanUp [
	self reset
]

{ #category : #cleanup }
XdEmptyPublishInfo class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
XdEmptyPublishInfo class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
XdEmptyPublishInfo >> author [
	^ BlText empty
]

{ #category : #accessing }
XdEmptyPublishInfo >> description [
	^ BlText empty
]

{ #category : #accessing }
XdEmptyPublishInfo >> password [
	^ BlText empty
]

{ #category : #'api - actions' }
XdEmptyPublishInfo >> publish [
	"do nothing"
	self inform: 'Fake publish action'
]

{ #category : #accessing }
XdEmptyPublishInfo >> title [
	^ BlText empty
]

{ #category : #accessing }
XdEmptyPublishInfo >> username [
	^ BlText empty
]
