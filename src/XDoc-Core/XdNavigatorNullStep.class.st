Class {
	#name : #XdNavigatorNullStep,
	#superclass : #XdNavigatorProtoStep,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #'api - adding steps' }
XdNavigatorNullStep >> addStep: aXdNavigatorStep into: aPreviousStep [
	aPreviousStep insertStep: aXdNavigatorStep
]

{ #category : #'api - finding' }
XdNavigatorNullStep >> findUsingContext: anXdNavigatorContext [
	"do nothing"
]

{ #category : #accessing }
XdNavigatorNullStep >> name [
	^ 'Stop'
]

{ #category : #enumerating }
XdNavigatorNullStep >> stepsDo: anOneArgBlock [
	anOneArgBlock cull: self
]
