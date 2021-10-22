Class {
	#name : #XdBearerExampleAuthenticator,
	#superclass : #Object,
	#instVars : [
		'token'
	],
	#category : 'XDoc-Client-Examples'
}

{ #category : #accessing }
XdBearerExampleAuthenticator class >> token: aToken [
	^ self new 
		token: aToken
]

{ #category : #public }
XdBearerExampleAuthenticator >> authHeader [
	
	^ 'Bearer '
]

{ #category : #public }
XdBearerExampleAuthenticator >> authenticateRequest: request do: block [
	^ (self isRequestAuthenticated: request)
		ifTrue: [ block value ]
		ifFalse: [ ZnResponse unauthorized: self authHeader ]
]

{ #category : #testing }
XdBearerExampleAuthenticator >> isRequestAuthenticated: aRequest [
	| authorization receivedToken |
	
	(aRequest headers includesKey: 'Authorization') ifFalse: [ ^ false ].
	
	authorization := aRequest authorization.
	authorization size < 8 ifTrue: [ ^ false ].
	receivedToken := authorization copyFrom: 8 to: authorization size.
	^ receivedToken = token
]

{ #category : #accessing }
XdBearerExampleAuthenticator >> token [
	^ token
]

{ #category : #accessing }
XdBearerExampleAuthenticator >> token: anObject [
	token := anObject
]
