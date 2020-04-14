Class {
	#name : #XdClientUpdateXDocCommand,
	#superclass : #XdClientCreateXDocCommand,
	#traits : 'TXdClientXDocIdInstance - {#client}',
	#classTraits : 'TXdClientXDocIdInstance classTrait',
	#category : #'XDoc-Client-Commands'
}

{ #category : #visitor }
XdClientUpdateXDocCommand >> accept: aVisitor [
	^ aVisitor visitXdClientUpdateXDocCommand: self
]

{ #category : #execution }
XdClientUpdateXDocCommand >> execute [
	self response: (self zincClient
		url: self xdocUrl;
		entity: self xdocEntity;
		patch;
		response).
]
