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

{ #category : #enumerating }
XdShareNullInformation >> partsDo: aBlock [ 
	"do nothing"
]

{ #category : #initialization }
XdShareNullInformation >> setPart: aType value: aValue [
	"do nothing"
]
