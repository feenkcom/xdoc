Class {
	#name : #XdProtoClientCommand,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdProtoClientCommand >> execute [
	self subclassResponsibility
]

{ #category : #'gt-extension' }
XdProtoClientCommand >> gtCommandsFor: aView [
	^ aView empty
]

{ #category : #accessing }
XdProtoClientCommand >> name [
	^ self printString
]

{ #category : #accessing }
XdProtoClientCommand >> result [
	^ self response
]
