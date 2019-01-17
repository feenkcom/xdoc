Class {
	#name : #XdReader,
	#superclass : #Object,
	#traits : 'XdManifestJsonMappingTrait + XdConstantsTrait',
	#classTraits : 'XdManifestJsonMappingTrait classTrait + XdConstantsTrait classTrait',
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
	^ [  
		| aZip |
		aZip := self streamingStrategy zip.
		aZip members 
			detect: [ :eachMember | eachMember fileName = self constants manifestFileName ]
			ifFound: [ :aMember | 
				| aManifest |
				aManifest := self json readManifest: aMember contents "utf8Decoded".
				XdFile new
					manifest: aManifest;
					streamingStrategy: self streamingStrategy ]
			ifNone: [ self error: 'XDoc manifest file not found' ]
	] on: Error do: errorHandler
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
