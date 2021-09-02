Class {
	#name : 'XdClientPingCommand',
	#superclass : 'XdClientWithResponseCommand',
	#category : 'XDoc-Client-Commands'
}

{ #category : 'visiting' }
XdClientPingCommand >> accept: aVisitor [
	^ aVisitor visitXdClientPingCommand: self
]

{ #category : 'execution' }
XdClientPingCommand >> execute [
	self response: (self zincClient
		url: self pingUrl;
		get;
		response).
]

{ #category : 'accessing' }
XdClientPingCommand >> pingUrl [
	<return: #ZnUrl>
	^ self client serverUrl / 'ping'
]
