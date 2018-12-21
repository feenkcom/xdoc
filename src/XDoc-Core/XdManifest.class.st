Class {
	#name : #XdManifest,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'author',
		'documents',
		'attachments'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdManifest >> attachments [
	<return: #Array of: #XdAttachment>
	^ attachments
]

{ #category : #accessing }
XdManifest >> attachments: anArrayOfAttachments [
	self 
		assert: [ anArrayOfAttachments notNil ] 
		description: [ 'Attachments must be non-nil' ].
	attachments := anArrayOfAttachments
]

{ #category : #accessing }
XdManifest >> author [
	<return: #String>
	^ author
]

{ #category : #accessing }
XdManifest >> author: aString [
	self 
		assert: [ aString notNil ] 
		description: [ 'Author must be non-nil' ].
	author := aString
]

{ #category : #accessing }
XdManifest >> description [
	<return: #String>
	^ description
]

{ #category : #accessing }
XdManifest >> description: aString [
	self 
		assert: [ aString notNil ] 
		description: [ 'Description must be non-nil' ].
	description := aString
]

{ #category : #enumerating }
XdManifest >> documentOfType: aXdType [ 
	<return: #XdDocument>
	^ self documents 
		detect: [ :eachDocument | eachDocument type = aXdType ] 
		ifFound: [ :aDocument | ^ aDocument ] 
		ifNone: [ self error: 'Document not found' ]
]

{ #category : #accessing }
XdManifest >> documents [
	<return: #Array of: #XdDocument>
	^ documents
]

{ #category : #accessing }
XdManifest >> documents: anArrayOfDocuments [
	self 
		assert: [ anArrayOfDocuments notNil ] 
		description: [ 'Documents must be non-nil' ].
	documents := anArrayOfDocuments
]

{ #category : #'gt-extension' }
XdManifest >> gtContentFor: aView [
	<gtView>
	^ aView list
		title: 'Content';
		items: [ { 
			'Title: ', self title asString.
			'Author: ', self author asString.
			'Description: ', self description asString } ,
			self documents , 
			self attachments ]
			
]

{ #category : #testing }
XdManifest >> hasHtmlDocument [
	<return: #Boolean>
	^ self documents 
		anySatisfy: [ :eachDocument | eachDocument type = XdHtmlType ]
]

{ #category : #enumerating }
XdManifest >> htmlAttachments [
	<return: #Array of: #XdAttachment>
	| aDocument |
	aDocument := self htmlDocument.
	^ self attachments select: [ :eachAttachment | 
		aDocument components anySatisfy: [ :eachComponent | eachComponent link = eachAttachment id ] ]
]

{ #category : #enumerating }
XdManifest >> htmlDocument [
	<return: #XdDocument>
	^ self documentOfType: XdHtmlType
]

{ #category : #initialization }
XdManifest >> initialize [
	super initialize.
	author := ''.
	description := ''.
	title := ''.
	documents := #().
	attachments := #().
]

{ #category : #accessing }
XdManifest >> title [
	<return: #String>
	^ title
]

{ #category : #accessing }
XdManifest >> title: aString [
	self 
		assert: [ aString notNil ] 
		description: [ 'Title must be non-nil' ].
	title := aString
]
