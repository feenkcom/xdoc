Class {
	#name : #XdSequenceNumberGenerator,
	#superclass : #XdIdGenerator,
	#instVars : [
		'currentId'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #initialization }
XdSequenceNumberGenerator >> initialize [
	super initialize.
	currentId := 0.
]

{ #category : #accessing }
XdSequenceNumberGenerator >> nextId [
	"Return next unique id that can be used to identify objects"
	<return: #String>
	currentId := currentId + 1.
	^ currentId asString.
]
