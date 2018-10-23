Class {
	#name : #XdReference,
	#superclass : #Object,
	#traits : 'GtAssertingTrait',
	#classTraits : 'GtAssertingTrait classTrait',
	#category : #'XDoc-Core-Model'
}

{ #category : #requirements }
XdReference class >> bytes [
	^ XdBytesReference new
]

{ #category : #requirements }
XdReference class >> empty [
	^ XdEmptyReference uniqueInstance
]

{ #category : #requirements }
XdReference class >> file [
	^ XdFileReference new
]

{ #category : #testing }
XdReference >> exists [
	<return: #Boolean>
	^ self subclassResponsibility
]
