Class {
	#name : #XdEmptyManifest,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #cleanup }
XdEmptyManifest class >> cleanUp [
	self reset
]

{ #category : #cleanup }
XdEmptyManifest class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
XdEmptyManifest class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]
