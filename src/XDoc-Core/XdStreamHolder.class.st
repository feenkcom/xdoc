Class {
	#name : #XdStreamHolder,
	#superclass : #Object,
	#traits : 'TGtAssert + TXdConstants',
	#classTraits : 'TGtAssert classTrait + TXdConstants classTrait',
	#instVars : [
		'streamingStrategy'
	],
	#category : #'XDoc-Core-Basic'
}

{ #category : #initialization }
XdStreamHolder >> defaultStreamingStrategy [
	^ XdStreamingStrategy null
]

{ #category : #initialization }
XdStreamHolder >> initialize [
	super initialize.
	streamingStrategy := self defaultStreamingStrategy
]

{ #category : #accessing }
XdStreamHolder >> streamingStrategy [
	<return: #XdStreamingStrategy>
	^ streamingStrategy
]

{ #category : #accessing }
XdStreamHolder >> streamingStrategy: aXdStreamingStrategy [
	self 
		assert: [ aXdStreamingStrategy notNil ] 
		description: [ 'Streaming strategy must be non-nil' ].
	streamingStrategy := aXdStreamingStrategy
]
