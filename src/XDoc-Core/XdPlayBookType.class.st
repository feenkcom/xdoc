Class {
	#name : #XdPlayBookType,
	#superclass : #XdType,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdPlayBookType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'gtoolkit-playbook'
]
