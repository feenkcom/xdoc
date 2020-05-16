Class {
	#name : #XdDocumentsHandler,
	#superclass : #BlEventHandler,
	#instVars : [
		'client'
	],
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #accessing }
XdDocumentsHandler >> client [
	^ client
]

{ #category : #accessing }
XdDocumentsHandler >> client: anObject [
	client := anObject
]

{ #category : #private }
XdDocumentsHandler >> downloadXdoc: anXdInfo element: anElement [
	self client async 
		callback: [ :anXdFileOrNil | 
			anXdFileOrNil ifNotNil: [ 
				anElement enqueueTask: (BlTaskAction new action: [ 
					anElement phlow 
						selectObject: anXdFileOrNil mainFileReference ]) ] ];
		downloadXDocUsingFileInfo: anXdInfo
]

{ #category : #initialization }
XdDocumentsHandler >> initialize [
	super initialize.
	client := XdClient null.
	self eventClass: BrSelectionChanged.
	self action: (MessageSend receiver: self selector: #notifySelectionChanged:)
]

{ #category : #'api - event managing' }
XdDocumentsHandler >> notifySelectionChanged: anEvent [
	| aListElement |
	aListElement := anEvent currentTarget.
	anEvent selectedDo: [ :anInterval |
		| anXdInfo |
		anXdInfo := aListElement viewModel items at: anInterval first.
		self downloadXdoc: anXdInfo element: aListElement ]
]
