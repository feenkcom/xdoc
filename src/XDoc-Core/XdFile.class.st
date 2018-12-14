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

	| aList |
	aList := aView columnedList
		title: 'Files' translated;
		priority: 1;
		items: self streamingStrategy zip members.
	
	aList	column: 'Icon' translated do: [:column |
			column 
				evaluated: [ :each |
					each isDirectory 
						ifTrue: [ BrGlamorousIcons folder ] 
						ifFalse: [ BrGlamorousIcons file ] ];
				stencil: [ :eachIcon | eachIcon asElement margin: (BlInsets left: 5 right: 5) ];
				noResize ].
	aList	column
		title: 'Name' translated;
		matchParent;
		evaluated: [ :each | each fileName ].
	aList	column
		title: 'Size' translated;
		matchParent;
		evaluated: [ :each | each compressedSize ].
	aList	column
		title: 'Last Modified' translated;
		matchParent;
		evaluated: [ :each |
				String streamContents: [:s | 
					each lastModTime printYMDOn: s.
					s nextPut: Character space.
					each lastModTime printHMSOn: s ] ].
	^ aList.
]

{ #category : #'gt-extension' }
XdFile >> gtManifestFor: aView [
	<gtView>
	^ (self manifest gtContentFor: aView)
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
