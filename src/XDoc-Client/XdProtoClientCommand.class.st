Class {
	#name : #XdProtoClientCommand,
	#superclass : #Object,
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdProtoClientCommand >> execute [
	self subclassResponsibility
]

{ #category : #accessing }
XdProtoClientCommand >> name [
	^ self printString
]
