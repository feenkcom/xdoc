Class {
	#name : #XdBearerAuthenticationCommand,
	#superclass : #XdAuthenticationCommand,
	#instVars : [
		'accessToken'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #accessing }
XdBearerAuthenticationCommand >> accessToken [
	^ accessToken
]

{ #category : #accessing }
XdBearerAuthenticationCommand >> accessToken: anAccessToken [
	self assert: [ anAccessToken notNil ].
	accessToken := anAccessToken
]

{ #category : #authentication }
XdBearerAuthenticationCommand >> authenticate [
	self assert: [ self accessToken notNil ].
	
	self zincClient prepareRequest: [ :aRequest | 
		aRequest setAuthorization: 'Bearer ', self accessToken ]
]
