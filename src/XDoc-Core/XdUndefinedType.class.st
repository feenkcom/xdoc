Class {
	#name : #XdUndefinedType,
	#superclass : #XdType,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdUndefinedType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'undefined'
]
