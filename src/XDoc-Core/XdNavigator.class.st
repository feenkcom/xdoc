Class {
	#name : #XdNavigator,
	#superclass : #Object,
	#traits : 'TGtAssert + TXdConstants + TXdNavigatorStepInsertion + TXdFileAccesssor + TXdNavigatorAllStepsExtension',
	#classTraits : 'TGtAssert classTrait + TXdConstants classTrait + TXdNavigatorStepInsertion classTrait + TXdFileAccesssor classTrait + TXdNavigatorAllStepsExtension classTrait',
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #'api - navigation - basic' }
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

{ #category : #'api - navigation - basic' }
XdNavigator >> componentAttachment [
	self addStep: XdNavigatorComponentAttachmentStep new
]

{ #category : #'api - search' }
XdNavigator >> context [
	<return: #XdNavigatorContext>
	| aContext |
	aContext := self newContext.
	self nextStep findUsingContext: aContext.
	^ aContext
]

{ #category : #'api - search' }
XdNavigator >> find [
	<return: #Object>
	^ self context result
]

{ #category : #initialization }
XdNavigator >> initialize [
	super initialize.
	self nextStep: XdNavigatorStep null.
]

{ #category : #'api - navigation - convenience' }
XdNavigator >> mainAttachment [
	self mainComponentAttachment.
]

{ #category : #'api - navigation - basic' }
XdNavigator >> mainComponent [
	self addStep: XdNavigatorComponentAtIndexStep new
]

{ #category : #'api - navigation - convenience' }
XdNavigator >> mainComponentAttachment [
	self mainComponent.
	self componentAttachment.
]

{ #category : #'api - navigation - basic' }
XdNavigator >> mainDocument [
	self addStep: XdNavigatorDocumentAtIndexStep new
]

{ #category : #'api - navigation - convenience' }
XdNavigator >> mainDocumentAttachment [
	self mainDocument.
	self mainComponentAttachment.
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

{ #category : #'api - navigation - basic' }
XdNavigator >> stringReadStream [
	self addStep: XdNavigatorStringReadStreamStep new
]
