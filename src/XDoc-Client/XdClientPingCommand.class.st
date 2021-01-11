Class {
	#name : #XdClientPingCommand,
	#superclass : #XdClientWithResponseCommand,
	#category : #'XDoc-Client-Commands'
}

{ #category : #visiting }
XdClientPingCommand >> accept: aVisitor [
	^ aVisitor visitXdClientPingCommand: self
]

{ #category : #accessing }
XdClientPingCommand >> pingUrl [
	<return: #ZnUrl>
	^ self client serverUrl / 'ping'
]
