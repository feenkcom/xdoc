Class {
	#name : #XdProtoClient,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'XDoc-Client-Core'
}

{ #category : #accessing }
XdProtoClient >> documents [
	"Return a list of published documents"
	^ self subclassResponsibility
]
