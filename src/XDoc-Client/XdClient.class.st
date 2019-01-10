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
XdClient class >> download: aZnUrlString thenDo: aBlock [
	| aXdFile |
	aXdFile := self new download: aZnUrlString asZnUrl.
	aXdFile ifNotNil: [ aBlock value: aXdFile ].
	^ aXdFile
]

{ #category : #actions }
XdClient >> download: aZnUrl [ 
	"Download an XDoc file from a public server"
	^ XdClientDownloadXDocCommand new
		client: self;
		url: aZnUrl;
		execute;
		xdFile
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
