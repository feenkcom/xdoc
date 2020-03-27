Class {
	#name : #XdNavigatorDocumentAtIndexStep,
	#superclass : #XdNavigatorObjectAtIndexStep,
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
