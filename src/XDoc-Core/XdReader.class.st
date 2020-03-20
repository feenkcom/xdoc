Class {
	#name : #XdReader,
	#superclass : #Object,
	#traits : 'TXdManifestJsonMapping + TXdConstants + TGtAssert',
	#classTraits : 'TXdManifestJsonMapping classTrait + TXdConstants classTrait + TGtAssert classTrait',
	#instVars : [
		'streamingStrategy',
		'errorHandler'
	],
	#category : #'XDoc-Core-Reader'
}

{ #category : #initialization }
XdReader >> initialize [
	super initialize.
	streamingStrategy := XdStreamingStrategy null.
	errorHandler := [ :anError | anError pass ].
]

{ #category : #accessing }
XdReader >> json [
	^ XdManifestJsonMapping
]

{ #category : #accessing }
XdReader >> onError: anOneArgBlock [ 
	self 
		assert: [ anOneArgBlock notNil ]
		description: [ 'XDoc reader error handler must be non-nil' ].
	self 
		assert: [ anOneArgBlock numArgs = 1 ]
		description: [ 'XDoc reader error handler must have one argument' ].
	errorHandler := anOneArgBlock
]

{ #category : #reading }
XdReader >> read [
	<return: #XdFile>
	^ [ 	| aZip |
			aZip := self streamingStrategy zip.
			self readManifestIn: aZip ]
		on: Error
		do: errorHandler
]

{ #category : #private }
XdReader >> readFormatVersionIn: aZip [
	<return: #Integer or: nil>
	| aMemberOrNil |
	aMemberOrNil := aZip memberNamed: self constants versionFileName.
	aMemberOrNil ifNil: [ ^ nil ].
	^ aMemberOrNil gtContents asInteger.
]

{ #category : #private }
XdReader >> readManifestIn: aZip [
	<return: #XdFile>
	| aMemberOrNil aManifest |
	aMemberOrNil := aZip memberNamed: self constants manifestFileName.
	aMemberOrNil ifNil: [ self error: 'XDoc manifest file not found' ].
	aManifest := self json readManifest: aMemberOrNil gtContents.
	^ XdFile new
		manifest: aManifest;
		streamingStrategy: self streamingStrategy
]

{ #category : #accessing }
XdReader >> streamingStrategy [
	<return: #XdStreamingStrategy>
	^ streamingStrategy
]

{ #category : #accessing }
XdReader >> streamingStrategy: aXdStreamingStrategy [
	self 
		assert: [ aXdStreamingStrategy notNil ] 
		description: [ 'Streaming strategy must be non-nil' ].
	streamingStrategy := aXdStreamingStrategy
]
