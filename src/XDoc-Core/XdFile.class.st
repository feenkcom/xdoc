Class {
	#name : #XdFile,
	#superclass : #Object,
	#instVars : [
		'manifest',
		'streamingStrategy'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #'instance creation' }
XdFile class >> empty [
	^ self new
]

{ #category : #public }
XdFile class >> fromBytes: aByteArray [ 
	<return: #XdFile>
	^ XdReader new
		streamingStrategy: (XdStreamingStrategy bytes: aByteArray);
		read
]

{ #category : #testing }
XdFile >> exists [
	<return: #Boolean>
	^ self streamingStrategy exists
]

{ #category : #'gt-extension' }
XdFile >> gtManifestFor: aView [
	<gtView>
	^ (self manifest gtContentFor: aView)
		title: 'Manifest'
]

{ #category : #enumerating }
XdFile >> htmlMembers [
	<return: #Array of: #ArchiveMember>
	| anXdAttachments |
	anXdAttachments := self manifest htmlAttachments.
	^ self streamingStrategy zip members select: [ :eachMember |
		anXdAttachments anySatisfy: [ :eachAttachment | 
			eachAttachment fileName = eachMember fileName ] ]
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

{ #category : #actions }
XdFile >> open [
	^ self inspect
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

{ #category : #accessing }
XdFile >> titleAndAuthor [
	<return: #String>
	| aTitle anAuthor |
	aTitle := self manifest title ifEmpty: [ 'Empty document title' ].
	anAuthor := self manifest author ifEmpty: [ 'unknown author' ].
	^ aTitle, ' by ', anAuthor
]

{ #category : #actions }
XdFile >> writer [
	^ XdWriter new
			streamingStrategy: self streamingStrategy
]
