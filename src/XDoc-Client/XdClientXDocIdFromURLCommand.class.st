Class {
	#name : #XdClientXDocIdFromURLCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'url',
		'id'
	],
	#classInstVars : [
		'execute'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdClientXDocIdFromURLCommand >> execute [
	self id: self url segments first
]

{ #category : #accessing }
XdClientXDocIdFromURLCommand >> id [
	^ id
]

{ #category : #accessing }
XdClientXDocIdFromURLCommand >> id: anId [
	id := anId
]

{ #category : #accessing }
XdClientXDocIdFromURLCommand >> url [
	<return: #ZnUrl>
	^ url
]

{ #category : #accessing }
XdClientXDocIdFromURLCommand >> url: aZnUrl [
	url := aZnUrl
]
