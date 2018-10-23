Class {
	#name : #XdReader,
	#superclass : #Object,
	#traits : 'XdJsonMappingTrait + XdConstantsTrait',
	#classTraits : 'XdJsonMappingTrait classTrait + XdConstantsTrait classTrait',
	#instVars : [
		'reference'
	],
	#category : #'XDoc-Core-Reader'
}

{ #category : #initialization }
XdReader >> initialize [
	super initialize.
	reference := XdReference empty.
]

{ #category : #reading }
XdReader >> read [
	<return: #XdFile>
	| aZip |
	aZip := self reference zip.
	^ aZip members 
		detect: [ :eachMember | eachMember fileName = self constants manifestFileName ]
		ifFound: [ :aMember | 
			| aManifest |
			aManifest := self json readManifest: aMember contents.
			XdFile new
				manifest: aManifest;
				reference: self reference ]
		ifNone: [ self error: 'XDoc manifest file not found' ]
]

{ #category : #accessing }
XdReader >> reference [
	<return: #XdReference>
	^ reference
]

{ #category : #accessing }
XdReader >> reference: aXdReference [
	self 
		assert: [ aXdReference notNil ] 
		description: [ 'Reference must be non-nil' ].
	reference := aXdReference
]
