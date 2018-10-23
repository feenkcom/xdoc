Class {
	#name : #XdFile,
	#superclass : #Object,
	#instVars : [
		'manifest',
		'reference'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #testing }
XdFile >> exists [
	<return: #Boolean>
	^ self reference exists
]

{ #category : #initialization }
XdFile >> initialize [
	super initialize.
	manifest := XdEmptyManifest uniqueInstance.
	reference := XdEmptyReference uniqueInstance.
]

{ #category : #accessing }
XdFile >> manifest [
	<return: #XdManifest>
	^ manifest
]

{ #category : #accessing }
XdFile >> manifest: aXdManifest [
	self 
		assert: [ aXdManifest notNil ] 
		description: [ 'Manifest must be non-nil' ].
	manifest := aXdManifest
]

{ #category : #accessing }
XdFile >> reference [
	<return: #XdReference>
	^ reference
]

{ #category : #accessing }
XdFile >> reference: aXdReference [
	self 
		assert: [ aXdReference notNil ] 
		description: [ 'Reference must be non-nil' ].
	reference := aXdReference
]
