Class {
	#name : #XdUndefinedType,
	#superclass : #XdType,
	#instVars : [
		'name'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #testing }
XdUndefinedType class >> matchesMimeType: aZnMimeType [
	"Return true if the document type is equivalent to the Zinc MIME type"
	<return: #Boolean>
	^ false
]

{ #category : #accessing }
XdUndefinedType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'undefined'
]

{ #category : #accessing }
XdUndefinedType >> name [
	^ name
]

{ #category : #accessing }
XdUndefinedType >> name: anObject [
	name := anObject
]

{ #category : #printing }
XdUndefinedType >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPut: $(;
		print: self name;
		nextPut: $)
]

{ #category : #accessing }
XdUndefinedType >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ self name ifNil: [ self class typeString ]
]
