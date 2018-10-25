Class {
	#name : #XdNullStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #cleanup }
XdNullStreamingStrategy class >> cleanUp [
	self reset
]

{ #category : #cleanup }
XdNullStreamingStrategy class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
XdNullStreamingStrategy class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #testing }
XdNullStreamingStrategy >> exists [
	<return: #Boolean>
	^ false
]

{ #category : #streams }
XdNullStreamingStrategy >> readStream [
	"Return a binary read stream"
	^ ByteArray new readStream
]
