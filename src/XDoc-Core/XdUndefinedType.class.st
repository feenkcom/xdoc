Class {
	#name : #XdUndefinedType,
	#superclass : #XdType,
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
