Class {
	#name : #XdBytesReference,
	#superclass : #XdReference,
	#instVars : [
		'bytes'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdBytesReference >> bytes [
	<return: #ByteArray or: nil>
	^ bytes
]

{ #category : #accessing }
XdBytesReference >> bytes: aByteArray [
	self 
		assert: [ aByteArray notNil ] 
		description: [ 'Bytes must be non-nil' ].
	bytes := aByteArray
]

{ #category : #testing }
XdBytesReference >> exists [
	<return: #Boolean>
	^ self bytes notNil
]

{ #category : #streams }
XdBytesReference >> readStream [
	self 
		assert: [ self exists ]
		description: [ 'Bytes must be defined before reading them' ].
	^ self bytes readStream
]
