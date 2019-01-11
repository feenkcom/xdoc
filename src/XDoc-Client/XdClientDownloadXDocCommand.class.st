Class {
	#name : #XdClientDownloadXDocCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'url',
		'xdFile',
		'fileInfo'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #private }
XdClientDownloadXDocCommand >> ensureFileInfo [
	self fileInfo ifNotNil: [ ^ self ].
	self fileInfo: (XdClientDownloadFileInfoCommand new
		client: self client;
		url: self url;
		execute;
		fileInfo)
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> ensureXDocUrl [
	| aXDocUrl |
	self fileInfo ifNil: [ ^ self ].
	self fileInfo xdocUrl ifNotNil: [ ^ self ].
	aXDocUrl := self client serverUrl 
		/ XdConstants cdnPathSegments 
		/ self fileInfo pathSegment 
		/ self fileInfo fileName.
	self fileInfo xdocUrl: aXDocUrl
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> ensureXdFile [
	| aResponse |
	self fileInfo ifNil: [ ^ self ].
	self ensureXDocUrl.
	aResponse := ZnClient new
		url: self fileInfo xdocUrl;
		get;
		response.
	aResponse isSuccess ifFalse: [ ^ self ].
	self xdFile: (XdFile fromBytes: aResponse contents)
]

{ #category : #execution }
XdClientDownloadXDocCommand >> execute [
	self ensureFileInfo.
	self ensureXdFile.
	^ self xdFile
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> fileInfo [
	^ fileInfo
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> fileInfo: aXdFileInfo [ 
	fileInfo := aXdFileInfo
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> url [
	^ url
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> url: anObject [
	url := anObject
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> xdFile [
	^ xdFile
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> xdFile: anObject [
	xdFile := anObject
]
