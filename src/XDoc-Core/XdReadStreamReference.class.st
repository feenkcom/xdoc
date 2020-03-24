Class {
	#name : #XdReadStreamReference,
	#superclass : #XdObject,
	#instVars : [
		'fileName',
		'stream'
	],
	#category : #'XDoc-Core-Streaming'
}

{ #category : #accessing }
XdReadStreamReference >> fileName [
	^ fileName
]

{ #category : #accessing }
XdReadStreamReference >> fileName: anObject [
	fileName := anObject
]

{ #category : #accessing }
XdReadStreamReference >> stream [
	^ stream
]

{ #category : #accessing }
XdReadStreamReference >> stream: anObject [
	stream := anObject
]

{ #category : #streams }
XdReadStreamReference >> stringStreamDo: aBlock [
	^ self stream 
		readStreamEncoded: self constants defaultStringEnconding 
		do: aBlock
]
