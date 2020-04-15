Class {
	#name : #XdShareProtoInformation,
	#superclass : #Object,
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #testing }
XdShareProtoInformation >> hasParts [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #initialization }
XdShareProtoInformation >> partAt: aType [
	self subclassResponsibility
]

{ #category : #initialization }
XdShareProtoInformation >> partAt: aType put: aValue [
	self subclassResponsibility
]

{ #category : #enumerating }
XdShareProtoInformation >> partsDo: aBlock [ 
	"aBlock receives aKey and aValue"
	self subclassResponsibility
]
