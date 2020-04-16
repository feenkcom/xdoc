Class {
	#name : #XdClient,
	#superclass : #XdProtoClient,
	#traits : 'TGtReplacingCommandHolder',
	#classTraits : 'TGtReplacingCommandHolder classTrait',
	#instVars : [
		'serverUrl',
		'signalProgress'
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

{ #category : #'gt-extension' }
XdClient class >> gtDocumentsFor: aView [
	<gtView>
	^ (self new gtDocumentsFor: aView)
			priority: -2
]

{ #category : #accessing }
XdClient class >> null [
	^ XdNullClient uniqueInstance
]

{ #category : #'private - results' }
XdClient >> answerFromCommand: aCommand [
	<return: #XdCommandAnswer>
	^ XdCommandAnswerBuilder new
		commandChain: aCommand;
		build
]

{ #category : #'actions - reading' }
XdClient >> async [
	<return: #XdAsyncClient>
	^ XdAsyncClient new client: self
]

{ #category : #'accessing - options - authentication' }
XdClient >> authentication: aXdAuthenticationCommand [
	self replacingCommand: aXdAuthenticationCommand
]

{ #category : #'execution - decorating commands' }
XdClient >> basicExecuteCommand: aCommand [
	^ self decoratingCommandBuilder execute: aCommand
]

{ #category : #'accessing - options - decorating commands' }
XdClient >> decoratingCommandBuilder [
	^ self 
		optionAt: self class decoratingCommandBuilderOptionName 
		ifAbsentPut: [ self newDecoratingCommandBuilder ]
]

{ #category : #'actions - modifying' }
XdClient >> deleteId: anId [
	<return: #XdCommandAnswer>
	"Delete an XDoc file from a public server"
	| aCommand |
	aCommand := XdClientDeleteXDocIdCommand new
		client: self;
		xdocId: anId.
	^ self executeCommand: aCommand.
]

{ #category : #'actions - modifying' }
XdClient >> deleteUrl: anUrl [
	<return: #ZnResponse>
	"Delete an XDoc file from a public server"
	| anId |
	anId := XdClientXDocIdFromURLCommand new
		client: self;
		url: anUrl asZnUrl;
		execute;
		id.
	^ self deleteId: anId
]

{ #category : #'accessing - computed' }
XdClient >> documents [
	<return: #Array of: #XdFileInfo>
	^ self downloadList
]

{ #category : #'actions - reading' }
XdClient >> downloadFileInfo: aZnUrl [ 
	"Download an XDoc file info from a public server"
	<return: #XdFileInfo>
	^ XdClientDownloadFileInfoCommand new
		client: self;
		url: aZnUrl;
		execute;
		fileInfo
]

{ #category : #'actions - reading' }
XdClient >> downloadList [
	<return: #Array of: #XdFileInfo>
	^ XdClientDownloadListCommand new
		client: self;
		signalProgress: self signalProgress;
		execute;
		list
]

{ #category : #'actions - reading' }
XdClient >> downloadPreviewImageUsingFileInfo: aXdFileInfo [
	<return: #Form>

	^ XdClientDownloadPreviewImageCommand new
		client: self;
		fileInfo: aXdFileInfo;
		signalProgress: self signalProgress;
		execute
]

{ #category : #'actions - reading' }
XdClient >> downloadXDoc: aZnUrl [ 
	<return: #XdFile>
	"Download an XDoc file from a public server"
	^ XdClientDownloadXDocCommand new
		client: self;
		url: aZnUrl;
		execute;
		xdFile
]

{ #category : #'actions - reading' }
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

{ #category : #'execution - decorating commands' }
XdClient >> executeCommand: aCommand [
	<return: #XdCommandAnswer>
	^ [ 
		| anExecutedCommand |
		anExecutedCommand := self basicExecuteCommand: aCommand.
		self answerFromCommand: anExecutedCommand
		]
	on: Error 
	do: [ :anException | 
		XdExceptionAnswer new exception: anException ]
]

{ #category : #'gt-extension' }
XdClient >> gtDocumentListFor: aView [
	<gtView>
	^ aView columnedList
		title: 'List';
		items: [ self documents ];
		column: 'Title' do: [:aColumn | aColumn item: [ :doc | doc title] ];
		column: 'Author' do: [:aColumn | aColumn item: [ :doc | doc author] ];
		column: 'Created on' do: [:aColumn | aColumn item: [ :doc | 
			doc createdOn 
				ifNotNil: #asLocalStringYMDHM
				ifNil: [ '' ] ] ]
]

{ #category : #initialization }
XdClient >> initialize [
	super initialize.
	serverUrl := XdClientSettings xdServerUrl.
	signalProgress := false.
]

{ #category : #'actions - modifying' }
XdClient >> publish: aXdFile [ 
	"Publish an XDoc file to a public server"
	<return: #XdCommandAnswer>
	| aCommand |
	aCommand := XdClientPublishXDocCommand new
		client: self;
		xdoc: aXdFile.
	^ self executeCommand: aCommand.
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
	^ signalProgress
]

{ #category : #'actions - modifying' }
XdClient >> update: aXdFile id: anId [
	"Update an XDoc file at a public server"
	<return: #XdCommandAnswer>
	| aCommand |
	aCommand := XdClientUpdateXDocCommand new
		client: self;
		xdoc: aXdFile;
		xdocId: anId.
	^ self executeCommand: aCommand.
]

{ #category : #'actions - modifying' }
XdClient >> update: aXdFile url: aZnUrl [
	"Update an XDoc file at a public server"
	<return: #XdCommandAnswer>
	| anId |
	anId := XdClientXDocIdFromURLCommand new
		client: self;
		url: aZnUrl asZnUrl;
		execute;
		id.
	^ self update: aXdFile id: anId
]

{ #category : #'accessing - options - authentication' }
XdClient >> username: aUsername password: aPassword [
	self authentication: (XdBasicAuthenticationCommand new
		username: aUsername; 
		password: aPassword)
]
