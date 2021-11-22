Class {
	#name : #XdClientUpdateXDocCommand,
	#superclass : #XdClientCreateXDocCommand,
	#traits : 'TXdClientXDocIdInstance - {#client}',
	#classTraits : 'TXdClientXDocIdInstance classTrait',
	#instVars : [
		'createDate'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #visitor }
XdClientUpdateXDocCommand >> accept: aVisitor [
	^ aVisitor visitXdClientUpdateXDocCommand: self
]

{ #category : #accessing }
XdClientUpdateXDocCommand >> createDate: aDate [
	createDate := aDate
]

{ #category : #execution }
XdClientUpdateXDocCommand >> execute [
	| znClient |
	znClient := self zincClient.
		
	createDate ifNotNil: [znClient headerAt: 'X-Lepiter-CreatedOn' put: createDate asString ].
	
	self response: (znClient
		url: self xdocUrl;
		entity: self xdocEntity;
		patch;
		response).
]
