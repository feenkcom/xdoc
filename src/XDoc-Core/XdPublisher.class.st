Class {
	#name : #XdPublisher,
	#superclass : #Object,
	#instVars : [
		'info',
		'outputDirectory',
		'postBuilder',
		'publishedDocument'
	],
	#category : #'XDoc-Core-Publisher'
}

{ #category : #accessing }
XdPublisher >> info [
	^ info
]

{ #category : #accessing }
XdPublisher >> info: anObject [
	info := anObject
]

{ #category : #initialization }
XdPublisher >> initialize [
	super initialize.
	info := XdPublishInfo empty.
	postBuilder := XdPostBuilder new restApi: XdRestApi newDefault.
	outputDirectory := FileReference newTempFilePrefix: 'feenk-xd-' suffix: '-export-dir'.
	
]

{ #category : #accessing }
XdPublisher >> outputDirectory [
	^ outputDirectory ensureCreateDirectory; yourself
]

{ #category : #accessing }
XdPublisher >> outputDirectory: anObject [
	outputDirectory := anObject
]

{ #category : #accessing }
XdPublisher >> postBuilder [
	<return: #XdPostBuilder>
	^ postBuilder
]

{ #category : #'api - actions' }
XdPublisher >> prepare [
	self prepareCommonInformation.
]

{ #category : #'api - actions' }
XdPublisher >> prepareCommonInformation [
	self postBuilder 
		title: self info title asString; 
		authorName: self info author asString; 
		description: self info description asString.
]

{ #category : #'api - accessing' }
XdPublisher >> publicUrl [
	"Return public URL to an exported HTML root file or XDoc file if the HTML file does not exists."
	<return: #ZnUrl or: nil>
	self publishedDocument ifNil: [ ^ nil ].
	^ self publishedDocument htmlRootUrl ifNil: [ self publishedDocument xdocUrl ].
]

{ #category : #'api - actions' }
XdPublisher >> publicUrlToClipboard [
	| aPublishedUrl |
	aPublishedUrl := self publicUrl.
	aPublishedUrl ifNil: [ ^ self inform: 'An HTML file was not published' ].
	Clipboard clipboardText: aPublishedUrl asString.
   self inform: aPublishedUrl asString, ' was published and the url was copied to clipboard'.
]

{ #category : #'api - actions' }
XdPublisher >> publish [
	^ self subclassResponsibility
]

{ #category : #'api - accessing' }
XdPublisher >> publishedDocument [
	<return: #OldXdDocument or: nil>
	^ publishedDocument
]
