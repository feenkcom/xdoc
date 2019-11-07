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

{ #category : #public }
XdFile class >> fromFileReference: aFileReference [ 
	<return: #XdFile>
	^ XdReader new
		streamingStrategy: (XdStreamingStrategy file: aFileReference);
		read
]

{ #category : #testing }
XdFile >> exists [
	<return: #Boolean>
	^ self streamingStrategy exists
]

{ #category : #'gt-extension' }
XdFile >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live';
		priority: 0;
		stencil: [ self toolInPharo ];
		actionButtonIcon: BrGlamorousIcons open action: [ self openInPharo ]
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
	manifest := XdManifest empty.
	streamingStrategy := XdStreamingStrategy null.
]

{ #category : #accessing }
XdFile >> mainDocument [
	<return: #XdDocument>
	^ self manifest mainDocument
]

{ #category : #accessing }
XdFile >> mainFileReference [
	<return: #FileReference>
	| aXdDocument theAttachments |
	aXdDocument := self mainDocument.
	theAttachments := self manifest attachmentsForDocument: aXdDocument.
	^ self streamingStrategy 
		detectFileReference: [ :eachFileReference | 
			eachFileReference basename = theAttachments first fileName ]
		ifFound: [ :aFileReference | aFileReference ] 
		ifNone: [ self error: 'File reference must be found' ]
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
XdFile >> memberNamed: aFileName [ 
	<return: #ArchiveMember>
	^ self streamingStrategy memberNamed: aFileName
]

{ #category : #actions }
XdFile >> open [
	^ self inspect
]

{ #category : #actions }
XdFile >> openInPharo [
	"Document type should decide how to open (be displayed) in Pharo"
	self manifest documents ifEmpty: [ ^ self ].
	^ self manifest mainDocument openXdFileInPharo: self
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
XdFile >> toolInPharo [
	"Document type should decide which tool to use  in Pharo"
	self manifest documents ifEmpty: [ ^ nil ].
	^ self manifest mainDocument toolForXdFileInPharo: self
]

{ #category : #actions }
XdFile >> writer [
	^ XdWriter new
			streamingStrategy: self streamingStrategy
]
