Class {
	#name : #XdNavigatorProtoStep,
	#superclass : #Object,
	#traits : 'TGtAssert + TXdConstants',
	#classTraits : 'TGtAssert classTrait + TXdConstants classTrait',
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #'api - adding steps' }
XdNavigatorProtoStep >> addStep: aXdNavigatorStep into: aPreviousStep [
	self subclassResponsibility
]

{ #category : #accessing }
XdNavigatorProtoStep >> allSteps [
	<return: #Array of: #XdNavigatorProtoStep>
	^ Array streamContents: [ :aStream | 
		self stepsDo: [ :eachStep | aStream nextPut: eachStep ] ]
]

{ #category : #'api - finding' }
XdNavigatorProtoStep >> findUsingContext: anXdNavigatorContext [ 
	self subclassResponsibility
]

{ #category : #accessing }
XdNavigatorProtoStep >> name [
	<return: #String>
	^ self className
]

{ #category : #enumerating }
XdNavigatorProtoStep >> stepsDo: anOneArgBlock [
	self subclassResponsibility
]
