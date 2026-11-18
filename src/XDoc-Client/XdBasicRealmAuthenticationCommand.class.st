Class {
	#name : #XdBasicRealmAuthenticationCommand,
	#superclass : #XdBasicAuthenticationCommand,
	#instVars : [
		'realm'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #accessing }
XdBasicRealmAuthenticationCommand >> realm [
	^ realm
]

{ #category : #accessing }
XdBasicRealmAuthenticationCommand >> realm: aRealm [
 realm := aRealm
]
