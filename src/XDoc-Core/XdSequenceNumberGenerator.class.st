Class {
	#name : #XdSequenceNumberGenerator,
	#superclass : #XdIdGenerator,
	#instVars : [
		'currentId'
	],
	#category : #'XDoc-Core-ID Generator'
}

{ #category : #'instance creation' }
XdSequenceNumberGenerator class >> initialId: anInteger [
	^ self new initialId: anInteger
]

{ #category : #accessing }
XdSequenceNumberGenerator >> currentId [
	<return: #Integer>
	^ currentId
]

{ #category : #'gt-extension' }
XdSequenceNumberGenerator >> gtSequenceExampleFor: aView [
	<gtView>
	self currentId ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Sequence Examples';
		priority: 1;
		object: [ | aCopy | 
			aCopy := self copy. 
			20 timesCollect: [ aCopy nextId ] ];
		view: #gtItemsFor:
]

{ #category : #initialization }
XdSequenceNumberGenerator >> initialId: anInteger [
	"This method should be called only at the instance creation phase."
	currentId := anInteger
]

{ #category : #initialization }
XdSequenceNumberGenerator >> initialize [
	super initialize.
	currentId := 0.
]

{ #category : #accessing }
XdSequenceNumberGenerator >> nextId [
	"Return next unique id that can be used to identify objects"
	<return: #String>
	currentId := currentId + 1.
	^ currentId asString.
]
