Class {
	#name : #XdFile,
	#superclass : #Object,
	#instVars : [
		'manifest',
		'streamingStrategy'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #testing }
XdFile >> exists [
	<return: #Boolean>
	^ self streamingStrategy exists
]

{ #category : #'gt-extension' }
XdFile >> gitReferenceFor: aView [
	<gtView>
	^ aView list
		title: 'Files';
		items: [ self streamingStrategy zip members ]
]

{ #category : #'gt-extension' }
XdFile >> gtManifestFor: aView [
	<gtView>
	^ (self manifest gtRawFor: aView)
		title: 'Manifest';
		priority: 1
]

{ #category : #initialization }
XdFile >> initialize [
	super initialize.
	manifest := XdEmptyManifest uniqueInstance.
	streamingStrategy := XdNullStreamingStrategy uniqueInstance.
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
XdFile >> streamingStrategy [
	<return: #XdStreamingStrategy>
	^ streamingStrategy
]

{ #category : #accessing }
XdFile >> streamingStrategy: aXdReference [
	self 
		assert: [ aXdReference notNil ] 
		description: [ 'Reference must be non-nil' ].
	streamingStrategy := aXdReference
]
