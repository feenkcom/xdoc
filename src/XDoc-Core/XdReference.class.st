Class {
	#name : #XdReference,
	#superclass : #Object,
	#traits : 'GtAssertingTrait',
	#classTraits : 'GtAssertingTrait classTrait',
	#instVars : [
		'aStream'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #requirements }
XdReference class >> bytes [
	^ XdBytesReference new
]

{ #category : #requirements }
XdReference class >> bytes: aByteArray [
	^ self bytes bytes: aByteArray
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

{ #category : #streams }
XdReference >> readStream [
	"Return a binary read stream"
	^ self subclassResponsibility
]

{ #category : #streams }
XdReference >> readStreamDo: aBlock [
	aStream := self readStream.
	^ [ aBlock value: aStream ]
		ensure: [ aStream close ]
]
