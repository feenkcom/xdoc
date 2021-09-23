Class {
	#name : 'XdPlaygroundSettings',
	#superclass : 'Object',
	#classInstVars : [
		'directory'
	],
	#category : 'XDoc-Store-Model'
}

{ #category : 'defaults' }
XdPlaygroundSettings class >> defaultDirectory [ 
	| aDirectory |
	aDirectory := FileLocator localDirectory / 'xdocs'.
	aDirectory ensureCreateDirectory.
	^ aDirectory
]

{ #category : 'accessing' }
XdPlaygroundSettings class >> directory [
	directory ifNil: [ directory := self defaultDirectory ].
	"If directory is set but does not exist, try to re-load one from settings and then a default directory"
	directory exists ifFalse: [ self initializeSettings ].
	directory exists ifFalse: [ directory := self defaultDirectory ].
	self 
		assert: [ directory exists ]
		description: [ 'The directory with playgrounds must exist' ].
	^ directory
]

{ #category : 'accessing' }
XdPlaygroundSettings class >> directory: aFileReference [
	self 
		assert: [ aFileReference asFileReference exists ] 
		description: [ 'The directory with playgrounds must exist' ].
	directory := aFileReference
]

{ #category : 'initialization' }
XdPlaygroundSettings class >> initializeSettings [
	Smalltalk 
		at: #SystemSettingsPersistence 
		ifPresent: [ :aClass | | aTree theNodes | 
			aTree := aClass default settingTree.
			theNodes := aTree deeplySelect: [ :node | node receiverPackage name beginsWith: 'GToolkit-Playground' ].
			aClass updateSettingNodes: theNodes ]
]

{ #category : 'accessing' }
XdPlaygroundSettings class >> playBooks [
	<return: #Array of: #GtPlayBook>
	"Used PlayBooks must be subscribed to external tools: #subscribeExternalTools"
	^ #()
]

{ #category : 'settings' }
XdPlaygroundSettings class >> storedPlaygroundsDirectoryOn: aBuilder [ 
	<systemsettings>
	
	(aBuilder setting: #xdStoredPlaygroundsDirectory)
		parent: #xdoc;
		target: self;
		type: #Directory;
		description: 'Local directory with stored Playgrounds in XDoc format';
		label: 'Directory with stored Playgrounds'

]

{ #category : 'settings' }
XdPlaygroundSettings class >> xdStoredPlaygroundsDirectory [
	"This method is used by settings only. Do not use it in your code."
	<return: #AbstractFileReference>
	^ directory
]

{ #category : 'settings' }
XdPlaygroundSettings class >> xdStoredPlaygroundsDirectory: anAbstractFileReference [
	"This method is used by settings only. Do not use it in your code."
	directory := anAbstractFileReference
]

{ #category : 'accessing' }
XdPlaygroundSettings class >> xdocFileReferences [
	<return: #Array of: #FileReference>
	| allXdocFiles |
	allXdocFiles := self directory filesMatching: '*.' , XdConstants xdocExtension.
	allXdocFiles sort: [ :a :b | a modificationTime > b modificationTime ].
	^ allXdocFiles
]

{ #category : 'accessing' }
XdPlaygroundSettings class >> xdocFiles [
	<return: #Array of: #XdFile>
	^ self xdocFileReferences 
		collect: [ :eachFile | 
			XdUtility xdocFileFromFileReference: eachFile ]
		thenSelect: [ :eachFile | eachFile exists ]
]
