Class {
	#name : #XdManifest,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'author',
		'documents'
	],
	#category : #'XDoc-Core-Model'
}

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

{ #category : #initialization }
XdManifest >> initialize [
	super initialize.
	author := ''.
	description := ''.
	title := ''.
	documents := #()
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
