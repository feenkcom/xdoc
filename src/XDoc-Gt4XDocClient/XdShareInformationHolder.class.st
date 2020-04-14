Class {
	#name : #XdShareInformationHolder,
	#superclass : #XdShareProtoInformation,
	#traits : 'TXdShareInformationAccess',
	#classTraits : 'TXdShareInformationAccess classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #testing }
XdShareInformationHolder >> hasParts [
	<return: #Boolean>
	^ self information hasParts
]

{ #category : #enumerating }
XdShareInformationHolder >> partsDo: aBlock [ 
	"aBlock receives aKey and aValue"
	self information partsDo: aBlock
]

{ #category : #initialization }
XdShareInformationHolder >> setPart: aType value: aValue [
	self information setPart: aType value: aValue
]
