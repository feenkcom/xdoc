Class {
	#name : #XdBearerAuthenticationCommand,
	#superclass : #XdAuthenticationCommand,
	#instVars : [
		'accessToken',
		'username',
		'password'
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
	self getAccessToken.
	self assert: [ self accessToken notNil ].
	
	self zincClient prepareRequest: [ :aRequest | 
		aRequest setAuthorization: 'Bearer ', self accessToken ]
]

{ #category : #accessing }
XdBearerAuthenticationCommand >> getAccessToken [
	| loginConfig response |
	loginConfig := LeAuthAPIConfig forDefaultServer.
	response := LeAuthAPIClient new 
		configuration: loginConfig; 
		login: username with:password.
	accessToken := response contents at: 'accessToken'.
]

{ #category : #authentication }
XdBearerAuthenticationCommand >> password [
	^ password
]

{ #category : #authentication }
XdBearerAuthenticationCommand >> password: anObject [
	password := anObject
]

{ #category : #authentication }
XdBearerAuthenticationCommand >> username [
	^ username
]

{ #category : #authentication }
XdBearerAuthenticationCommand >> username: anObject [
	username := anObject
]
