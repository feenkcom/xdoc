Class {
	#name : #XdClientChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'client'
	],
	#category : #'XDoc-Client-Documents - Brick'
}

{ #category : #accessing }
XdClientChanged >> client [
	^ client
]

{ #category : #accessing }
XdClientChanged >> client: anXdClient [
	client := anXdClient
]
