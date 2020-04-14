Class {
	#name : #XdShareInformationHolder,
	#superclass : #XdShareProtoInformation,
	#instVars : [
		'valueHolder'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #defaults }
XdShareInformationHolder >> defaultInformation [
	^ XdShareInformation null asValueHolder
]

{ #category : #testing }
XdShareInformationHolder >> hasParts [
	<return: #Boolean>
	^ self information hasParts
]

{ #category : #accessing }
XdShareInformationHolder >> information [
	^ valueHolder value
]

{ #category : #accessing }
XdShareInformationHolder >> information: anObject [
	valueHolder value: anObject
]

{ #category : #initialization }
XdShareInformationHolder >> initialize [
	super initialize.
	valueHolder := self defaultInformation.
]

{ #category : #initialization }
XdShareInformationHolder >> partAt: aType [
	^ self information partAt: aType
]

{ #category : #accessing }
XdShareInformationHolder >> partAt: aType put: aValue [
	self information partAt: aType put: aValue
]

{ #category : #enumerating }
XdShareInformationHolder >> partsDo: aBlock [ 
	"aBlock receives aKey and aValue"
	self information partsDo: aBlock
]

{ #category : #subscriptions }
XdShareInformationHolder >> whenAllChangedDo: aBlock [
	valueHolder whenChangedDo: [ :newValue :oldValue | 
		aBlock cull: newValue cull: oldValue ]
]
