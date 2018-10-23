Class {
	#name : #XdReference,
	#superclass : #Object,
	#traits : 'GtAssertingTrait',
	#classTraits : 'GtAssertingTrait classTrait',
	#category : #'XDoc-Core-Model'
}

{ #category : #testing }
XdReference >> exists [
	<return: #Boolean>
	^ self subclassResponsibility
]
