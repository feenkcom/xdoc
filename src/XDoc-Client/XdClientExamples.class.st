Class {
	#name : #XdClientExamples,
	#superclass : #Object,
	#instVars : [
		'zincExamples',
		'documentsExamples',
		'delegate'
	],
	#category : #'XDoc-Client-Examples'
}

{ #category : #server }
XdClientExamples >> basicAuthenticator [
	<gtExample>
	^ ZnBasicAuthenticator
		username: self joeDoeUsername
		password: self joeDoePassword
]

{ #category : #'action - delete from URL' }
XdClientExamples >> basicIdFromUrlCommand [
	<gtExample>
	| anUrlFromUrlCommand |
	anUrlFromUrlCommand := XdClientXDocIdFromURLCommand new.
	anUrlFromUrlCommand client: self client.
	self assert: anUrlFromUrlCommand client isNotNil.
	^ anUrlFromUrlCommand
]

{ #category : #server }
XdClientExamples >> basicRealmAuthenticator [
	<gtExample>
	^ ZnBasicAuthenticator
		username: self joeDoeUsername
		password: self joeDoePassword
		realm:'myrealm'
]

{ #category : #server }
XdClientExamples >> bearerAuthenticator [
	<gtExample>
	^ XdBearerExampleAuthenticator
		token: self joeDoeBearerToken
]

{ #category : #server }
XdClientExamples >> cleanServerBasicAuthenticator [
	<gtExample>
	| aServer anAuthenticator |
	aServer := self startServer.
	anAuthenticator := self basicAuthenticator.
	aServer authenticator: nil.
	self assert: aServer authenticator isNil.
	^ aServer
]

{ #category : #client }
XdClientExamples >> client [
	<gtExample>
	| aClient anUrl |
	aClient := XdClient new.
	anUrl := self serverUrl.
	aClient serverUrl: anUrl.
	self assert: aClient serverUrl equals: anUrl.
	^ aClient
]

{ #category : #client }
XdClientExamples >> clientWithBasicAuthentication [
	<gtExample>
	| aClient anUrl |
	aClient := XdClient new.
	anUrl := self serverUrl.
	aClient serverUrl: anUrl.
	aClient username: self joeDoeUsername password: self joeDoePassword.
	self assert: aClient serverUrl equals: anUrl.
	self assert: aClient decoratingCommandBuilder commands size equals: 1.
	^ aClient
]

{ #category : #client }
XdClientExamples >> clientWithBasicRealmAuthentication [
	<gtExample>
	| aClient anUrl |
	aClient := XdClient new.
	anUrl := self serverUrl.
	aClient serverUrl: anUrl.
	aClient username: self joeDoeUsername password: self joeDoePassword realm: self joeDoeRealm.
	self assert: aClient serverUrl equals: anUrl.
	self assert: aClient decoratingCommandBuilder commands size equals: 1.
	^ aClient
]

{ #category : #client }
XdClientExamples >> clientWithBearerAuthentication [
	<gtExample>
	| aClient anUrl |
	aClient := XdClient new.
	anUrl := self serverUrl.
	aClient serverUrl: anUrl.
	aClient bearerToken: self joeDoeBearerToken.
	self assert: aClient serverUrl equals: anUrl.
	self assert: aClient decoratingCommandBuilder commands size equals: 1.
	^ aClient
]

{ #category : #server }
XdClientExamples >> delegate [
	<gtExample>
	delegate ifNotNil: [ :aDelegate | ^ aDelegate ].
	delegate := ZnDispatcherDelegate new.
	delegate 
		map: self deletePathString
		to: [ :aRequest :aResponse |
			aResponse entity: (ZnEntity textCRLF: 'OK') ];
		map: self listFilePath
		to: [ :aRequest :aResponse |
			aResponse entity: (ZnEntity json: self listJsonContent) ];
		map: self infoFilePath
		to: [ :aRequest :aResponse |
			aResponse entity: (ZnEntity json: self infoJsonContent) ];
		map: self xdocPathString
		to: [ :aRequest :aResponse |
			aResponse entity: documentsExamples documentWithFigureEntity ];
		map: self publishPath
		to: [ :aRequest :aResponse | self publishedResponse ].
	^ delegate
]

{ #category : #'action - delete' }
XdClientExamples >> deletePath [
	<gtExample>
	^ ZnUrl new / XdConstants xdocPathSegments / '1'
]

{ #category : #'action - delete' }
XdClientExamples >> deletePathString [
	<gtExample>
	^ self deletePath asString
]

{ #category : #'action - delete' }
XdClientExamples >> deleteXDocId [
	<gtExample>
	| aResponse |
	aResponse := self client deleteId: self xdocIdSegment.
	self assert: aResponse notNil.
	^ aResponse
]

{ #category : #'action - delete from URL' }
XdClientExamples >> deleteXDocUrl [
	<gtExample>
	| aDeleteResponse |
	aDeleteResponse := self client deleteUrl: self xdocIdSegment.
	self assert: aDeleteResponse notNil.
	^ aDeleteResponse
]

{ #category : #'action - download xdoc' }
XdClientExamples >> downloadFileInfo [
	<gtExample>
	| aXdFileInfo |
	aXdFileInfo := self client downloadFileInfo: self xdocPublicUrl.
	self assert: aXdFileInfo notNil.
	self assert: aXdFileInfo manifest documents size equals: 2.
	self assert: aXdFileInfo pathSegment equals: self xdocIdSegment.
	self assert: aXdFileInfo fileName equals: self xdocFileName.
	self assert: aXdFileInfo xdocUrl equals: self xdocUrl.
	^ aXdFileInfo
]

{ #category : #'action - download list' }
XdClientExamples >> downloadList [
	<gtExample>
	<noTest>
	| aCollectionOfXdFileInfo |
	aCollectionOfXdFileInfo := self client downloadList.
	self assert: aCollectionOfXdFileInfo notNil.
	self assert: aCollectionOfXdFileInfo size equals: 1.
	self assert: aCollectionOfXdFileInfo first manifest documents size equals: 2.
	self assert: aCollectionOfXdFileInfo first pathSegment equals: self xdocIdSegment.
	self assert: aCollectionOfXdFileInfo first fileName equals: 'xdoc-file.xdoc'.
	self assert: aCollectionOfXdFileInfo first xdocUrl isNil.
	^ aCollectionOfXdFileInfo
]

{ #category : #'action - download xdoc' }
XdClientExamples >> downloadXDoc [
	<gtExample>
	| anXdFile |
	anXdFile := self client downloadXDoc: self xdocPublicUrl.
	self assert: anXdFile notNil.
	self assert: anXdFile manifest documents size equals: 2.
	^ anXdFile
]

{ #category : #'action - download xdoc' }
XdClientExamples >> downloadXDocUsingFileInfo [
	<gtExample>
	| anXdFile |
	anXdFile := self client downloadXDocUsingFileInfo: self downloadFileInfo.
	self assert: anXdFile notNil.
	self assert: anXdFile manifest documents size equals: 2.
	^ anXdFile
]

{ #category : #'action - download xdoc' }
XdClientExamples >> fileInfo [
	<gtExample>
	^ XdFileInfo new
		manifest: documentsExamples documentWithFigureXDoc manifest;
		pathSegment: self xdocIdSegment;
		fileName: self xdocFileName
]

{ #category : #'action - download xdoc' }
XdClientExamples >> infoFilePath [
	<gtExample>
	^ '/', ('/' join: (XdConstants cdnPathSegments asOrderedCollection
			add: self xdocIdSegment;
			add: XdConstants xdocInfoFileName;
			yourself))
]

{ #category : #'action - download xdoc' }
XdClientExamples >> infoJsonContent [
	<gtExample>
	^ XdManifestJsonMapping writeFileInfo: self fileInfo
]

{ #category : #initialization }
XdClientExamples >> initialize [
	super initialize.
	zincExamples := GtZnServerExamples new.
	documentsExamples := XdDocumentsExamples new.
]

{ #category : #server }
XdClientExamples >> joeDoeBearerToken [
	^ 'hsdhjsd235agsggd6326shsln9ygvak'
]

{ #category : #server }
XdClientExamples >> joeDoePassword [
	^ 'Joe Doe''s secret password'
]

{ #category : #accessing }
XdClientExamples >> joeDoeRealm [
	^ 'myrealm'
]

{ #category : #server }
XdClientExamples >> joeDoeUsername [
	^ 'JoeDoe'
]

{ #category : #'action - download list' }
XdClientExamples >> listFilePath [
	<gtExample>
	^ '/', ('/' join: ({'space'} copyWith: XdConstants listFileName))
]

{ #category : #'action - download list' }
XdClientExamples >> listJsonContent [
	<gtExample>
	^ '[{"path_segment":"space/1","fileName":"xdoc-file.xdoc","manifest":{"title":"","description":"","author":"","attachments":[{"id":"1","filename":"index.pillar","size":146},{"id":"2","filename":"gt-logo.png","size":8192},{"id":"3","filename":"index.html","size":245},{"id":"4","filename":"index.css","size":183}],"documents":[{"type":"documenter","components":[{"link":"1"},{"link":"2"}]},{"type":"html","components":[{"link":"3"},{"link":"4"},{"link":"2"}]}]}}]'
]

{ #category : #'action - publish' }
XdClientExamples >> publishPath [
	<gtExample>
	^ (ZnUrl new / XdConstants xdocsPathSegments) asString
]

{ #category : #'action - publish' }
XdClientExamples >> publishXDoc [
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

{ #category : #'action - publish' }
XdClientExamples >> publishXDoc_AuthenticatedServer_Authenticated [
	<gtExample>
	| anXdResponse aClient |
	self setServerBasicAuthenticator.
	aClient := self clientWithBasicAuthentication.
	anXdResponse := aClient publish: documentsExamples documentWithFigureXDoc.
	self assert: anXdResponse isNotNil.
	self assert: anXdResponse isSuccess.
	self assert: anXdResponse isError not.
	self assert: anXdResponse isAuthenticationRequired not.
	self assert: anXdResponse class equals: XdSuccessfullyPublishedAnswer.
	self assert: anXdResponse command class equals: XdClientPublishXDocCommand.
	self assert: anXdResponse response class equals: XdZincResponse.
	^ anXdResponse
]

{ #category : #'action - publish' }
XdClientExamples >> publishXDoc_AuthenticatedServer_Denied [
	<gtExample>
	| aClient anXdResponse |
	self setServerBasicAuthenticator.
	aClient := self client.
	anXdResponse := aClient publish: documentsExamples documentWithFigureXDoc.
	self assert: anXdResponse notNil.
	self assert: anXdResponse isSuccess not.
	self assert: anXdResponse isError.
	self assert: anXdResponse isAuthenticationRequired.
	self assert: anXdResponse class equals: XdAuthenticationRequiredAnswer.
	self assert: anXdResponse command class equals: XdClientPublishXDocCommand.
	self assert: anXdResponse response class equals: XdZincResponse.
	^ anXdResponse
]

{ #category : #'action - publish' }
XdClientExamples >> publishXDoc_RealmAuthenticatedServer_Authenticated [
	<gtExample>
	| anXdResponse aClient |
	self setServerBasicRealmAuthenticator.
	aClient := self clientWithBasicRealmAuthentication.
	anXdResponse := aClient publish: documentsExamples documentWithFigureXDoc.
	self assert: anXdResponse isNotNil.
	self assert: anXdResponse isSuccess.
	self assert: anXdResponse isError not.
	self assert: anXdResponse isAuthenticationRequired not.
	self assert: anXdResponse class equals: XdSuccessfullyPublishedAnswer.
	self assert: anXdResponse command class equals: XdClientPublishXDocCommand.
	self assert: anXdResponse response class equals: XdZincResponse.
	^ anXdResponse
]

{ #category : #'action - publish' }
XdClientExamples >> publishedResponse [
	<gtExample>
	^ ZnResponse created: (zincExamples serverUrl / 'space' / '1') asString
]

{ #category : #server }
XdClientExamples >> serverUrl [
	<gtExample>
	self startServer.
	^ zincExamples serverUrl
]

{ #category : #server }
XdClientExamples >> setServerBasicAuthenticator [
	<gtExample>
	| aServer anAuthenticator |
	aServer := self startServer.
	anAuthenticator := self basicAuthenticator.
	aServer authenticator: anAuthenticator.
	self assert: aServer authenticator equals: anAuthenticator.
	^ aServer
]

{ #category : #server }
XdClientExamples >> setServerBasicRealmAuthenticator [
	<gtExample>
	| aServer anAuthenticator |
	aServer := self startServer.
	anAuthenticator := self basicRealmAuthenticator.
	aServer authenticator: anAuthenticator.
	self assert: aServer authenticator equals: anAuthenticator.
	^ aServer
]

{ #category : #server }
XdClientExamples >> setServerBearerAuthenticator [
	<gtExample>
	| aServer anAuthenticator |
	aServer := self startServer.
	anAuthenticator := self bearerAuthenticator.
	aServer authenticator: anAuthenticator.
	self assert: aServer authenticator equals: anAuthenticator.
	^ aServer
]

{ #category : #server }
XdClientExamples >> startServer [
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
XdClientExamples >> stopServer [
	^ zincExamples stopServer
]

{ #category : #'action - update' }
XdClientExamples >> updateXDoc_AuthenticatedServer_BasicAuthenticated [
	<gtExample>
	| anXdResponse aClient |
	self setServerBasicAuthenticator.
	aClient := self clientWithBasicAuthentication.
	anXdResponse := aClient update: documentsExamples documentWithFigureXDoc url: (self serverUrl / 'space' / '1').
	self assert: anXdResponse isNotNil.
	self assert: anXdResponse isSuccess.
	self assert: anXdResponse isError not.
	self assert: anXdResponse isAuthenticationRequired not.
	self assert: anXdResponse class equals: XdSuccessfullyUpdatedAnswer.
	self assert: anXdResponse command class equals: XdClientUpdateXDocCommand.
	self assert: anXdResponse response class equals: XdZincResponse.
	^ anXdResponse
]

{ #category : #'action - update' }
XdClientExamples >> updateXDoc_AuthenticatedServer_BearerAuthenticated [
	<gtExample>
	| anXdResponse aClient |
	self setServerBearerAuthenticator.
	aClient := self clientWithBearerAuthentication.
	anXdResponse := aClient update: documentsExamples documentWithFigureXDoc url: (self serverUrl / 'space' / '1').
	self assert: anXdResponse isNotNil.
	self assert: anXdResponse isSuccess.
	self assert: anXdResponse isError not.
	self assert: anXdResponse isAuthenticationRequired not.
	self assert: anXdResponse class equals: XdSuccessfullyUpdatedAnswer.
	self assert: anXdResponse command class equals: XdClientUpdateXDocCommand.
	self assert: anXdResponse response class equals: XdZincResponse.
	^ anXdResponse
]

{ #category : #'action - delete from URL' }
XdClientExamples >> xDocIdFromUrl [
	<gtExample>
	| aPublishCommand anUrlFromUrlCommand aPublishedUrl anId |
	aPublishCommand := self publishXDoc.
	aPublishedUrl := aPublishCommand publicUrl.
	anUrlFromUrlCommand := self basicIdFromUrlCommand.
	anId := anUrlFromUrlCommand
		url: aPublishedUrl;
		execute;
		id.
	self assert: anId isNotNil.
	self assert: anId equals: 1 asString.
	^ anUrlFromUrlCommand
]

{ #category : #'action - download xdoc' }
XdClientExamples >> xdocFileName [
	<gtExample>
	^ 'documenter-figure.xdoc'
]

{ #category : #'action - download xdoc' }
XdClientExamples >> xdocIdSegment [
	<gtExample>
	^ 'space/1'
]

{ #category : #'action - download xdoc' }
XdClientExamples >> xdocPathSegments [
	<gtExample>
	^ XdConstants cdnPathSegments, { 
		'space' .
		'1' . 
		self xdocFileName }
]

{ #category : #'action - download xdoc' }
XdClientExamples >> xdocPathString [
	<gtExample>
	^ (ZnUrl new / self xdocPathSegments) asString
]

{ #category : #'action - download xdoc' }
XdClientExamples >> xdocPublicUrl [
	<gtExample>
	^ self serverUrl / (self xdocPathSegments)
]

{ #category : #'action - download xdoc' }
XdClientExamples >> xdocUrl [
	<gtExample>
	^ self serverUrl withPathSegments: self xdocPathSegments
	
]
