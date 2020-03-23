Class {
	#name : #XdNavigatorObjectAtIndexStep,
	#superclass : #XdNavigatorStep,
	#traits : 'TXdNavigatorStepIndex',
	#classTraits : 'TXdNavigatorStepIndex classTrait',
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #defaults }
XdNavigatorObjectAtIndexStep >> defaultName [
	<return: #String>
	^ self subclassResponsibility
]
