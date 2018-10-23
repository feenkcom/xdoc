Class {
	#name : #XdEmptyReference,
	#superclass : #XdReference,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #cleanup }
XdEmptyReference class >> cleanUp [
	self reset
]

{ #category : #cleanup }
XdEmptyReference class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
XdEmptyReference class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #testing }
XdEmptyReference >> exists [
	<return: #Boolean>
	^ false
]

{ #category : #streams }
XdEmptyReference >> readStream [
	"Return a binary read stream"
	^ ByteArray new readStream
]
