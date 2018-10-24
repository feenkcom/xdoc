Class {
	#name : #XdTextType,
	#superclass : #XdType,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdTextType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'text'
]
