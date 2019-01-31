Class {
	#name : #XdDocumentsHandler,
	#superclass : #BlEventHandler,
	#instVars : [
		'client'
	],
	#category : #'XDoc-Client-Documents - Brick'
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
		callback: [ :anXdFile | 
			anElement enqueueTask: (BlTaskAction new action: [ 
				anElement fireEvent: (GtPhlowObjectToSelect new 
					object: anXdFile mainFileReference;
					sourceElement: anElement) ]) ];
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
		anXdInfo := aListElement viewModel items at: aListElement selection from.
		self downloadXdoc: anXdInfo element: aListElement ]
]
