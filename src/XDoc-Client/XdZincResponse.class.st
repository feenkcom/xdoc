Class {
	#name : #XdZincResponse,
	#superclass : #XdProtoResponse,
	#traits : 'TGtResponseStatus',
	#classTraits : 'TGtResponseStatus classTrait',
	#instVars : [
		'response'
	],
	#category : #'XDoc-Client-Answers'
}

{ #category : #factory }
XdZincResponse class >> null [
	^ XdNullResponse default
]

{ #category : #testing }
XdZincResponse >> isResponse [
	<return: #Boolean>
	^ true
]

{ #category : #accessing }
XdZincResponse >> rawResponse [
	<return: #ZnResponse>
	^ self response
]

{ #category : #accessing }
XdZincResponse >> response [
	^ response
]

{ #category : #accessing }
XdZincResponse >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ] 
		description: [ 'Zinc response must be non-nil' ].
	response := aZnResponse
]

{ #category : #'accessing - response' }
XdZincResponse >> statusLineMessage [
	^ (String streamContents: [ :out | self response statusLine writeOn: out ])
]
