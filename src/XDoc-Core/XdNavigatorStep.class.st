Class {
	#name : #XdNavigatorStep,
	#superclass : #XdNavigatorProtoStep,
	#traits : 'TXdNavigatorStepInsertion + TXdNavigatorAllStepsExtension',
	#classTraits : 'TXdNavigatorStepInsertion classTrait + TXdNavigatorAllStepsExtension classTrait',
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #testing }
XdNavigatorStep class >> isAbstract [
	^ self name = #XdNavigatorStep 
]

{ #category : #factory }
XdNavigatorStep class >> null [
	^ XdNavigatorNullStep default
]

{ #category : #'api - adding steps' }
XdNavigatorStep >> addStep: aXdNavigatorStep into: aPreviousStep [
	self nextStep addStep: aXdNavigatorStep into: self
]

{ #category : #'private - finding' }
XdNavigatorStep >> findHereUsingContext: anXdNavigatorContext [ 
	self subclassResponsibility
]

{ #category : #'private - finding' }
XdNavigatorStep >> findUsingContext: anXdNavigatorContext [
	self findHereUsingContext: anXdNavigatorContext.
	self nextStep findUsingContext: anXdNavigatorContext.
]

{ #category : #enumerating }
XdNavigatorStep >> stepsDo: anOneArgBlock [
	anOneArgBlock cull: self.
	self nextStep stepsDo: anOneArgBlock.
]
