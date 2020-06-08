Class {
	#name : #XdUUIDGenerator,
	#superclass : #XdIdGenerator,
	#category : #'XDoc-Core-ID Generator'
}

{ #category : #accessing }
XdUUIDGenerator >> nextId [
	^ UUID new asString36
]
