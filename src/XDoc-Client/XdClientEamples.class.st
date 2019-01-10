Class {
	#name : #XdClientEamples,
	#superclass : #Object,
	#instVars : [
		'zincExamples',
		'documentsExamples',
		'delegate'
	],
	#category : #'XDoc-Client-Examples'
}

{ #category : #client }
XdClientEamples >> client [
	<gtExample>
	| aClient anUrl |
	aClient := XdClient new.
	anUrl := self serverUrl.
	aClient serverUrl: anUrl.
	self assert: aClient serverUrl equals: anUrl.
	^ aClient
]

{ #category : #server }
XdClientEamples >> delegate [
	<gtExample>
	delegate ifNotNil: [ :aDelegate | ^ aDelegate ].
	delegate := ZnDispatcherDelegate new.
	delegate 
		map: self infoFilePath
		to: [ :aRequest :aResponse |
			aResponse entity: (ZnEntity json: self infoJsonContent) ];
		map: self xdocPath
		to: [ :aRequest :aResponse |
			aResponse entity: documentsExamples documentWithFigureEntity ];
		map: self publishPath
		to: [ :aRequest :aResponse | self publishedResponse ].
	^ delegate
]

{ #category : #downloading }
XdClientEamples >> downloadFileInfo [
	<gtExample>
	| aXdFileInfo |
	self startServer.
	aXdFileInfo := self client downloadFileInfo: self xdocPublicUrl.
	self assert: aXdFileInfo notNil.
	self assert: aXdFileInfo manifest documents size equals: 2.
	self assert: aXdFileInfo pathSegment equals: self xdocPathSegment.
	self assert: aXdFileInfo fileName equals: self xdocFileName.
	self assert: aXdFileInfo xdocUrl equals: self xdocUrl.
	^ aXdFileInfo
]

{ #category : #downloading }
XdClientEamples >> downloadXDoc [
	<gtExample>
	| anXdFile |
	self startServer.
	anXdFile := self client downloadXDoc: self xdocPublicUrl.
	self assert: anXdFile notNil.
	self assert: anXdFile manifest documents size equals: 2.
	^ anXdFile
]

{ #category : #downloading }
XdClientEamples >> downloadXDocUsingFileInfo [
	<gtExample>
	| anXdFile |
	self startServer.
	anXdFile := self client downloadXDocUsingFileInfo: self downloadFileInfo.
	self assert: anXdFile notNil.
	self assert: anXdFile manifest documents size equals: 2.
	^ anXdFile
]

{ #category : #downloading }
XdClientEamples >> fileInfo [
	<gtExample>
	^ XdFileInfo new
		manifest: documentsExamples documentWithFigureXDoc manifest;
		pathSegment: self xdocPathSegment;
		fileName: self xdocFileName
]

{ #category : #downloading }
XdClientEamples >> infoFilePath [
	<gtExample>
	^ '/', ('/' join: (XdConstants cdnPathSegments asOrderedCollection
			add: self xdocPathSegment;
			add: XdConstants xdocInfoFileName;
			yourself))
]

{ #category : #downloading }
XdClientEamples >> infoJsonContent [
	<gtExample>
	^ XdManifestJsonMapping writeFileInfo: self fileInfo
]

{ #category : #initialization }
XdClientEamples >> initialize [
	super initialize.
	zincExamples := GtZnServerExamples new.
	documentsExamples := XdDocumentsExamples new.
]

{ #category : #publishing }
XdClientEamples >> publishPath [
	<gtExample>
	^ '/', ( '/' join: #( 'api' 'xdoc' 'post' ) )
]

{ #category : #publishing }
XdClientEamples >> publishXDoc [
	<gtExample>
	| aCommand |
	self startServer.
	aCommand := XdClientPublishXDocCommand new
		client: self client;
		xdoc: documentsExamples documentWithFigureXDoc;
		execute.
	self assert: aCommand notNil.
	self assert: aCommand response isSuccess.
	self assert: aCommand publicUrl notNil.
	^ aCommand
]

{ #category : #publishing }
XdClientEamples >> publishedResponse [
	<gtExample>
	^ ZnResponse created: (zincExamples serverUrl / '1') asString
]

{ #category : #client }
XdClientEamples >> serverUrl [
	<gtExample>
	^ zincExamples serverUrl
]

{ #category : #server }
XdClientEamples >> startServer [
	<gtExample>
	<after: #stopServer>
	| aServer |
	aServer := zincExamples server.
	self assert: aServer isListening.
	aServer delegate = self delegate ifFalse: [ 
		aServer delegate: self delegate ].
	self assert: aServer delegate equals: self delegate.
	^ aServer
]

{ #category : #server }
XdClientEamples >> stopServer [
	^ zincExamples stopServer
]

{ #category : #downloading }
XdClientEamples >> xdocFileName [
	<gtExample>
	^ 'documenter-figure.xdoc'
]

{ #category : #downloading }
XdClientEamples >> xdocPath [
	<gtExample>
	^ '/', ('/' join: self xdocPathSegments)
]

{ #category : #downloading }
XdClientEamples >> xdocPathSegment [
	<gtExample>
	^ '1'
]

{ #category : #downloading }
XdClientEamples >> xdocPathSegments [
	<gtExample>
	^ XdConstants cdnPathSegments, {  
		self xdocPathSegment . 
		self xdocFileName }
]

{ #category : #downloading }
XdClientEamples >> xdocPublicUrl [
	<gtExample>
	^ zincExamples serverUrl withPathSegments: (self xdocPathSegments allButLast: 1)
]

{ #category : #downloading }
XdClientEamples >> xdocUrl [
	<gtExample>
	self startServer.
	^ zincExamples serverUrl withPathSegments: self xdocPathSegments
	
]
