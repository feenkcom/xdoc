Class {
	#name : #XdClientChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'client'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdClientChanged >> client [
	^ client
]

{ #category : #accessing }
XdClientChanged >> client: anXdClient [
	client := anXdClient
]
