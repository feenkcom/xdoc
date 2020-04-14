Class {
	#name : #XdShareNullInformation,
	#superclass : #XdShareProtoInformation,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #testing }
XdShareNullInformation >> hasParts [
	^ false
]

{ #category : #initialization }
XdShareNullInformation >> partAt: aType [
	^ ''
]

{ #category : #initialization }
XdShareNullInformation >> partAt: aType put: aValue [
	"do nothing"
]

{ #category : #enumerating }
XdShareNullInformation >> partsDo: aBlock [ 
	"do nothing"
]
