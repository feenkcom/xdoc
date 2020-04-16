Class {
	#name : #XdShareActions,
	#superclass : #XdShareProtoActions,
	#instVars : [
		'publishAction',
		'updateAction',
		'deleteAction'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #factory }
XdShareActions class >> null [ 
	^ XdShareNullActions default
]

{ #category : #actions }
XdShareActions >> delete [
	^ self deleteAction value
]

{ #category : #accessing }
XdShareActions >> deleteAction [
	^ deleteAction
]

{ #category : #accessing }
XdShareActions >> deleteAction: anObject [
	deleteAction := anObject
]

{ #category : #actions }
XdShareActions >> publish [
	^ self publishAction value
]

{ #category : #accessing }
XdShareActions >> publishAction [
	^ publishAction
]

{ #category : #accessing }
XdShareActions >> publishAction: anObject [
	publishAction := anObject
]

{ #category : #actions }
XdShareActions >> update [
	^ self updateAction value
]

{ #category : #accessing }
XdShareActions >> updateAction [
	^ updateAction
]

{ #category : #accessing }
XdShareActions >> updateAction: anObject [
	updateAction := anObject
]
