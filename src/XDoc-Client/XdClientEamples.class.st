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
	| aClient |
	aClient := XdClient new.
	^ aClient
]

{ #category : #server }
XdClientEamples >> delegate [
	<gtExample>
	delegate ifNotNil: [ :aDelegate | ^ aDelegate ].
	delegate := ZnDispatcherDelegate new.
	delegate 
		map: self xdocPath
		to: [ :aRequest :aResponse |
			aResponse entity: documentsExamples documentWithFigureEntity ].
	^ delegate
]

{ #category : #downloader }
XdClientEamples >> downloadXDoc [
	<gtExample>
	| anXdFile |
	self startServer.
	anXdFile := self client download: self xdocPublicUrl.
	self assert: anXdFile notNil.
	self assert: anXdFile manifest documents size equals: 2.
	^ anXdFile
]

{ #category : #initialization }
XdClientEamples >> initialize [
	super initialize.
	zincExamples := GtZnServerExamples new.
	documentsExamples := XdDocumentsExamples new.
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

{ #category : #downloader }
XdClientEamples >> xdocPath [
	<gtExample>
	^ '/', ('/' join: self xdocPathSegments)
]

{ #category : #downloader }
XdClientEamples >> xdocPathSegments [
	<gtExample>
	^ #( 'cdn' '1' 'documenter-figure.xdoc' )
]

{ #category : #downloader }
XdClientEamples >> xdocPublicUrl [
	<gtExample>
	^ zincExamples serverUrl withPathSegments: (self xdocPathSegments allButLast: 1)
]

{ #category : #downloader }
XdClientEamples >> xdocUrl [
	<gtExample>
	self server.
	^ zincExamples serverUrl withPathSegments: self xdocPathSegments
	
]
