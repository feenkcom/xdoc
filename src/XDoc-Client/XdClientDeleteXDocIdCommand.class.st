Class {
	#name : #XdClientDeleteXDocIdCommand,
	#superclass : #XdClientWithResponseCommand,
	#traits : 'TXdClientXDocIdInstance - {#client}',
	#classTraits : 'TXdClientXDocIdInstance classTrait',
	#category : 'XDoc-Client-Commands'
}

{ #category : #visitor }
XdClientDeleteXDocIdCommand >> accept: aVisitor [
	^ aVisitor visitXdClientDeleteXDocIdCommand: self
]

{ #category : #execution }
XdClientDeleteXDocIdCommand >> execute [
	self response: (self zincClient
		url: self xdocUrl;
		delete;
		response).
	
]

{ #category : #'accessing - computed' }
XdClientDeleteXDocIdCommand >> xdocUrl [
	<return: #ZnUrl>
	^ self client serverUrl / XdConstants xdocPathSegments / self xdocId
]
