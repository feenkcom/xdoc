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

{ #category : #'documents - ui' }
XdClientEamples >> basicList [
	<gtExample>
	| anElement |
	anElement := XdDocumentsElement new.
	anElement constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
	self assert: anElement client notNil.
	^ anElement
]

{ #category : #'documents - ui' }
XdClientEamples >> basicListWithLook [
	<gtExample>
	| anElement aLook |
	anElement := self basicList.
	aLook := XdDocumentsLook new.
	anElement look: aLook.
	self assert: aLook client equals: anElement client.
	self assert: anElement hasChildren description: 'Element must have children installed by the look'.
	^ anElement
]

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
		map: self listFilePath
		to: [ :aRequest :aResponse |
			aResponse entity: (ZnEntity json: self listJsonContent) ];
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
	aXdFileInfo := self client downloadFileInfo: self xdocPublicUrl.
	self assert: aXdFileInfo notNil.
	self assert: aXdFileInfo manifest documents size equals: 2.
	self assert: aXdFileInfo pathSegment equals: self xdocPathSegment.
	self assert: aXdFileInfo fileName equals: self xdocFileName.
	self assert: aXdFileInfo xdocUrl equals: self xdocUrl.
	^ aXdFileInfo
]

{ #category : #'documents - list' }
XdClientEamples >> downloadList [
	<gtExample>
	| aCollectionOfXdFileInfo |
	aCollectionOfXdFileInfo := self client downloadList.
	self assert: aCollectionOfXdFileInfo notNil.
	self assert: aCollectionOfXdFileInfo size equals: 1.
	self assert: aCollectionOfXdFileInfo first manifest documents size equals: 2.
	self assert: aCollectionOfXdFileInfo first pathSegment equals: self xdocPathSegment.
	self assert: aCollectionOfXdFileInfo first fileName equals: 'xdoc-file.xdoc'.
	self assert: aCollectionOfXdFileInfo first xdocUrl isNil.
	^ aCollectionOfXdFileInfo
]

{ #category : #downloading }
XdClientEamples >> downloadXDoc [
	<gtExample>
	| anXdFile |
	anXdFile := self client downloadXDoc: self xdocPublicUrl.
	self assert: anXdFile notNil.
	self assert: anXdFile manifest documents size equals: 2.
	^ anXdFile
]

{ #category : #downloading }
XdClientEamples >> downloadXDocUsingFileInfo [
	<gtExample>
	| anXdFile |
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

{ #category : #'documents - list' }
XdClientEamples >> listFilePath [
	<gtExample>
	^ '/', ('/' join: (XdConstants cdnPathSegments copyWith: XdConstants listFileName))
]

{ #category : #'documents - list' }
XdClientEamples >> listJsonContent [
	<gtExample>
	^ '[{"pathSegment":"1","fileName":"xdoc-file.xdoc","manifest":{"title":"","description":"","author":"","attachments":[{"id":"1","filename":"index.pillar","size":146},{"id":"2","filename":"gt-logo.png","size":8192},{"id":"3","filename":"index.html","size":245},{"id":"4","filename":"index.css","size":183}],"documents":[{"type":"documenter","components":[{"link":"1"},{"link":"2"}]},{"type":"html","components":[{"link":"3"},{"link":"4"},{"link":"2"}]}]}}]'
]

{ #category : #'documents - ui' }
XdClientEamples >> listWithLook [
	<gtExample>
	| anElement |
	anElement := self basicListWithLook.
	anElement client: self client.
	^ anElement
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

{ #category : #server }
XdClientEamples >> serverUrl [
	<gtExample>
	self startServer.
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
	^ self serverUrl withPathSegments: self xdocPathSegments
	
]
