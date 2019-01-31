Class {
	#name : #XdClientDeleteXDocIdCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'xdocId',
		'response'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdClientDeleteXDocIdCommand >> execute [
	self response: (ZnClient new
		url: self xdocUrl;
		delete;
		response).
	
]

{ #category : #accessing }
XdClientDeleteXDocIdCommand >> response [
	^ response
]

{ #category : #accessing }
XdClientDeleteXDocIdCommand >> response: anObject [
	response := anObject
]

{ #category : #accessing }
XdClientDeleteXDocIdCommand >> xdocId [
	<return: #String>
	^ xdocId
]

{ #category : #accessing }
XdClientDeleteXDocIdCommand >> xdocId: anIdString [
	self 
		assert: [ anIdString notNil ] 
		description: [ 'XDoc ID must be non-nil' ].
	xdocId := anIdString
]

{ #category : #'accessing - computed' }
XdClientDeleteXDocIdCommand >> xdocUrl [
	<return: #ZnUrl>
	^ self client serverUrl / XdConstants xdocPathSegments / self xdocId
]
