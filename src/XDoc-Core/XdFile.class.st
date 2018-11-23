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

{ #category : #testing }
XdFile >> exists [
	<return: #Boolean>
	^ self streamingStrategy exists
]

{ #category : #'gt-extension' }
XdFile >> gitReferenceFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Files' translated;
		priority: 1;
		items: self streamingStrategy zip members ;
		column: '' translated do: [:column |
			column 
				evaluated: [ :each |
					each isDirectory 
						ifTrue: [ BrGlamorousIcons folder ] 
						ifFalse: [ BrGlamorousIcons file ] ];
				stencil: [ :eachIcon | eachIcon asElement margin: (BlInsets left: 5 right: 5) ];
				noResize ];
		column: 'Name' translated do: [ :column |
			column evaluated: [ :each | each fileName ] ];
		column: 'Size' translated do: [ :column |
			column evaluated: [ :each | each compressedSize ] ];
		column: 'Last Modified' translated do: [:column |
			column evaluated: [ :each |
				String streamContents: [:s | 
					each lastModTime printYMDOn: s.
					s nextPut: Character space.
					each lastModTime printHMSOn: s ] ] ].
]

{ #category : #'gt-extension' }
XdFile >> gtManifestFor: aView [
	<gtView>
	^ (self manifest gtRawFor: aView)
		title: 'Manifest'
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

{ #category : #actions }
XdFile >> writer [
	^ XdWriter new
			streamingStrategy: self streamingStrategy
]
