Class {
	#name : #XdAuthenticationCommand,
	#superclass : #XdClientCommand,
	#category : #'XDoc-Client-Commands'
}

{ #category : #factory }
XdAuthenticationCommand class >> null [
	^ XdNullAuthenticationCommand default
]

{ #category : #accessing }
XdAuthenticationCommand >> zincClient [
	^ zincClient
]

{ #category : #accessing }
XdAuthenticationCommand >> zincClient: anObject [
	zincClient := anObject
]
