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
	<gtView>
	^ (self new gtDocumentsFor: aView)
			priority: -2
]

{ #category : #accessing }
XdClient class >> null [
	^ XdNullClient uniqueInstance
]

{ #category : #actions }
XdClient >> async [
	<return: #XdAsyncClient>
	^ XdAsyncClient new client: self
]

{ #category : #actions }
XdClient >> deleteXDocId: anId [
	<return: #ZnResponse>
	"Delete an XDoc file from a public server"
	^ XdClientDeleteXDocIdCommand new
		client: self;
		xdocId: anId;
		execute;
		response
]

{ #category : #'accesing - computed' }
XdClient >> documents [
	<return: #Array of: #XdFileInfo>
	^ self downloadList
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
		signalProgress: self signalProgress;
		execute;
		list
]

{ #category : #actions }
XdClient >> downloadPreviewImageUsingFileInfo: aXdFileInfo [
	<return: #Form>

	^ XdClientDownloadPreviewImageCommand new
		client: self;
		fileInfo: aXdFileInfo;
		signalProgress: self signalProgress;
		execute
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

{ #category : #accessing }
XdClient >> gtDocumentListFor: aView [
	<gtView>
	^ aView columnedList
		title: 'List';
		items: [ self documents ];
		column: 'Title' do: [:aColumn | aColumn item: [ :doc | doc title] ];
		column: 'Author' do: [:aColumn | aColumn item: [ :doc | doc author] ];
		column: 'Created on' do: [:aColumn | aColumn item: [ :doc | doc createdOn asLocalStringYMDHM] ]
]

{ #category : #'gt-extension' }
XdClient >> gtDocumentsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Documents';
		stencil: [ 
			XdDocumentsElement new 
				look: XdGlamorousDocumentsGridLook;
				client: self ]
]

{ #category : #initialization }
XdClient >> initialize [
	super initialize.
	serverUrl := XdClientSettings xdServerUrl.
]

{ #category : #actions }
XdClient >> openFileReference: aFileReference [
	aFileReference exists ifFalse: [ ^ self ].
	XdClientOpenXDocCommand new 
		client: self;
		fileReference: aFileReference;
		execute
]

{ #category : #actions }
XdClient >> publish: aXdFile [ 
	"Publish an XDoc file to a public server"
	| aCommand |
	aCommand := XdClientPublishXDocCommand new
		client: self;
		xdoc: aXdFile;
		execute.
	^ aCommand isSuccess
		ifTrue: [ aCommand 
			publicUrlToClipboard;
			publicUrl ]
		ifFalse: [ 
			aCommand responseToClipboard ]
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

{ #category : #accessing }
XdClient >> signalProgress [
	<return: #Boolean>
	^ BlSignalProgress enabled
]
