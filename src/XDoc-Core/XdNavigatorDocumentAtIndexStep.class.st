Class {
	#name : #XdNavigatorDocumentAtIndexStep,
	#superclass : #XdNavigatorStep,
	#traits : 'TXdNavigatorStepIndex',
	#classTraits : 'TXdNavigatorStepIndex classTrait',
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #default }
XdNavigatorDocumentAtIndexStep >> defaultName [
	<return: #String>
	^ 'Document'
]

{ #category : #'api - finding' }
XdNavigatorDocumentAtIndexStep >> findHereUsingContext: anXdNavigatorContext [ 
	| aResult |
	aResult := self 
		inCollection: anXdNavigatorContext xdFile manifest documents 
		ifAbsent: [ XdDocument empty ].
	anXdNavigatorContext result: aResult
]

{ #category : #accessing }
XdNavigatorDocumentAtIndexStep >> name [
	^ self index = self defaultIndexValue
		ifTrue: [ 'Main Document' ] 
		ifFalse: [ 'Document at: ', self index asString ]
]
