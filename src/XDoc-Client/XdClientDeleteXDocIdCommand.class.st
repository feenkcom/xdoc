Class {
	#name : #XdClientDeleteXDocIdCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'xdocId'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdClientDeleteXDocIdCommand >> execute [
	self response: (ZnClient new
		url: self postUrl;
		entity: self xdocEntity;
		post;
		response).
	
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
