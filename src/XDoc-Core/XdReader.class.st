Class {
	#name : #XdReader,
	#superclass : #XdStreamHolder,
	#instVars : [
		'errorHandler'
	],
	#category : #'XDoc-Core-Tools - Reader'
}

{ #category : #accessing }
XdReader >> errorHandler [
	"Return one arg block that receives an exception object"
	<return: #BlockClosure>
	^ errorHandler
]

{ #category : #initialization }
XdReader >> initialize [
	super initialize.
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
