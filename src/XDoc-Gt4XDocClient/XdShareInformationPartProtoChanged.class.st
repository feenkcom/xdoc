Class {
	#name : #XdShareInformationPartProtoChanged,
	#superclass : #XdShareEvent,
	#instVars : [
		'type',
		'value'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Events'
}

{ #category : #accessing }
XdShareInformationPartProtoChanged >> type [
	^ type
]

{ #category : #accessing }
XdShareInformationPartProtoChanged >> type: anObject [
	type := anObject
]

{ #category : #accessing }
XdShareInformationPartProtoChanged >> value [
	^ value
]

{ #category : #accessing }
XdShareInformationPartProtoChanged >> value: anObject [
	value := anObject
]
