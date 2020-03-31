Class {
	#name : #XdZincResponse,
	#superclass : #XdZincProtoResponse,
	#instVars : [
		'response'
	],
	#category : #'XDoc-Client-Responses'
}

{ #category : #factory }
XdZincResponse class >> null [
	^ XdZincNullResponse default
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
