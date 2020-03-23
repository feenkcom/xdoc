Class {
	#name : #XdNavigator,
	#superclass : #Object,
	#traits : 'TGtAssert + TXdConstants + TXdNavigatorStepInsertion + TXdFileAccesssor + TXdNavigatorAllStepsExtension',
	#classTraits : 'TGtAssert classTrait + TXdConstants classTrait + TXdNavigatorStepInsertion classTrait + TXdFileAccesssor classTrait + TXdNavigatorAllStepsExtension classTrait',
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #'api - navigation' }
XdNavigator >> addStep: aXdNavigatorStep [
	self nextStep 
		addStep: aXdNavigatorStep 
		into: self
]

{ #category : #convenient }
XdNavigator >> allSteps [
	<return: #Array of: #XdNavigatorProtoStep>
	^ self nextStep allSteps
]

{ #category : #'api - navigation' }
XdNavigator >> context [
	<return: #XdNavigatorContext>
	| aContext |
	aContext := self newContext.
	self nextStep findUsingContext: aContext.
	^ aContext
]

{ #category : #'api - navigation' }
XdNavigator >> find [
	<return: #Object>
	^ self context result
]

{ #category : #initialization }
XdNavigator >> initialize [
	super initialize.
	self nextStep: XdNavigatorStep null.
]

{ #category : #'api - navigation' }
XdNavigator >> mainComponent [
	self addStep: XdNavigatorComponentAtIndexStep new
]

{ #category : #'api - navigation' }
XdNavigator >> mainDocument [
	self addStep: XdNavigatorDocumentAtIndexStep new
]

{ #category : #accessing }
XdNavigator >> name [
	^ 'Navigator'
]

{ #category : #'instance creation' }
XdNavigator >> newContext [
	^ XdNavigatorContext new
		navigator: self;
		xdFile: self xdFile;
		result: xdFile
]
