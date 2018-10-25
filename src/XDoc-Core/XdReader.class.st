Class {
	#name : #XdReader,
	#superclass : #Object,
	#traits : 'XdManifestJsonMappingTrait + XdConstantsTrait',
	#classTraits : 'XdManifestJsonMappingTrait classTrait + XdConstantsTrait classTrait',
	#instVars : [
		'streamingStrategy'
	],
	#category : #'XDoc-Core-Reader'
}

{ #category : #initialization }
XdReader >> initialize [
	super initialize.
	streamingStrategy := XdStreamingStrategy null.
]

{ #category : #accessing }
XdReader >> json [
	^ XdManifestJsonMapping
]

{ #category : #reading }
XdReader >> read [
	<return: #XdFile>
	| aZip |
	aZip := self streamingStrategy zip.
	^ aZip members 
		detect: [ :eachMember | eachMember fileName = self constants manifestFileName ]
		ifFound: [ :aMember | 
			| aManifest |
			aManifest := self json readManifest: aMember contents.
			XdFile new
				manifest: aManifest;
				streamingStrategy: self streamingStrategy ]
		ifNone: [ self error: 'XDoc manifest file not found' ]
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
