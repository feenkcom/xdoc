Class {
	#name : #XdClient,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'serverUrl'
	],
	#category : #'XDoc-Client-Core'
}

{ #category : #public }
XdClient class >> downloadFileInfo: aZnUrlString thenDo: aBlock [
	<return: #XdFileInfo>
	| aFileInfo |
	aFileInfo := self new downloadFileInfo: aZnUrlString asZnUrl.
	aFileInfo ifNotNil: [ aBlock value: aFileInfo ].
	^ aFileInfo
]

{ #category : #public }
XdClient class >> downloadXDoc: aZnUrlString thenDo: aBlock [
	<return: #XdFile>
	| aXdFile |
	aXdFile := self new downloadXDoc: aZnUrlString asZnUrl.
	aXdFile ifNotNil: [ aBlock value: aXdFile ].
	^ aXdFile
]

{ #category : #accessing }
XdClient class >> gtDocumentsFor: aView [
	^ self new gtDocumentsFor: aView
]

{ #category : #actions }
XdClient >> downloadFileInfo: aZnUrl [ 
	"Download an XDoc file info from a public server"
	<return: #XdFileInfo>
	^ XdClientDownloadFileInfoCommand new
		client: self;
		url: aZnUrl;
		execute;
		fileInfo
]

{ #category : #actions }
XdClient >> downloadList [
	<return: #Array of: #XdFileInfo>
	^ XdClientDownloadListCommand new
		client: self;
		execute;
		list
]

{ #category : #actions }
XdClient >> downloadXDoc: aZnUrl [ 
	<return: #XdFile>
	"Download an XDoc file from a public server"
	^ XdClientDownloadXDocCommand new
		client: self;
		url: aZnUrl;
		execute;
		xdFile
]

{ #category : #actions }
XdClient >> downloadXDocUsingFileInfo: aXdFileInfo [ 
	<return: #XdFile>
	"Download an XDoc file from a public server"
	^ XdClientDownloadXDocCommand new
		client: self;
		url: aXdFileInfo xdocUrl;
		fileInfo: aXdFileInfo;
		execute;
		xdFile
]

{ #category : #'gt-extension' }
XdClient >> gtDocumentsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Published Documents';
		items: [ self downloadList ];
		column: 'Author' item: [ :aFileInfo | aFileInfo author ];
		column: 'Title' item: [ :aFileInfo | aFileInfo title ]
		
]

{ #category : #initialization }
XdClient >> initialize [
	super initialize.
	serverUrl := XdClientSettings xdServerUrl.
]

{ #category : #actions }
XdClient >> publish: aXdFile [ 
	"Publish an XDoc file to a public server"
	^ XdClientPublishXDocCommand new
		client: self;
		xdoc: aXdFile;
		execute;
		publicUrlToClipboard;
		publicUrl
]

{ #category : #accessing }
XdClient >> serverUrl [
	<return: #ZnUrl>
	^ serverUrl
]

{ #category : #accessing }
XdClient >> serverUrl: aZnUrl [
	self 
		assert: [ aZnUrl notNil ]
		description: [ 'Server URL must be non-nil' ].
	serverUrl := aZnUrl
]
