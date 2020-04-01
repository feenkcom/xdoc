Class {
	#name : #XdZincResponse,
	#superclass : #XdZincProtoResponse,
	#traits : 'TGtResponseStatus',
	#classTraits : 'TGtResponseStatus classTrait',
	#instVars : [
		'response'
	],
	#category : #'XDoc-Client-Responses'
}

{ #category : #factory }
XdZincResponse class >> null [
	^ XdZincNullResponse default
]

{ #category : #'gt-extension' }
XdZincResponse >> gtViewsInContext: aContext [
	^ Array streamContents: [ :aStream | 
		| aZnResponseViews |
		aZnResponseViews := GtPhlowViewsCollector new
			fromObject: self response;
			to: ZnMessage;
			context: aContext;
			collect.
		aStream nextPutAll: aZnResponseViews.
		aStream nextPutAll: (super gtViewsInContext: aContext). ]
]

{ #category : #testing }
XdZincResponse >> isResponse [
	<return: #Boolean>
	^ true
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
