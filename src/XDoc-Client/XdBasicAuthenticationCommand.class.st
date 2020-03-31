Class {
	#name : #XdBasicAuthenticationCommand,
	#superclass : #XdAuthenticationCommand,
	#instVars : [
		'username',
		'password'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #accessing }
XdBasicAuthenticationCommand >> password [
	^ password
]

{ #category : #accessing }
XdBasicAuthenticationCommand >> password: anObject [
	password := anObject
]

{ #category : #accessing }
XdBasicAuthenticationCommand >> username [
	^ username
]

{ #category : #accessing }
XdBasicAuthenticationCommand >> username: anObject [
	username := anObject
]
