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
XdClientDownloadXDocCommand >> ensureXDocUrl [
	| anIdPathSegment aRootUrl aInfoUrl aResponse |
	(self url pathSegments beginsWith: XdConstants cdnPathSegments) ifFalse: [ ^ self ].
	self url pathSegments size > XdConstants cdnPathSegments size ifFalse: [ ^ self ].
	anIdPathSegment := self url pathSegments at: XdConstants cdnPathSegments size + 1.
	aRootUrl := (self url copy clearPath addPathSegments: XdConstants cdnPathSegments) / anIdPathSegment.
	aInfoUrl := aRootUrl / XdConstants xdocInfoFileName.
	aResponse := ZnClient new
		url: aInfoUrl;
		get;
		response.
	aResponse isSuccess ifFalse: [ ^ self ].
	self fileInfo: (XdManifestJsonMapping readFileInfo: aResponse contents)
]

{ #category : #accessing }
XdClientDownloadXDocCommand >> ensureXdFile [
	| aXdUrl aResponse |
	self fileInfo ifNil: [ ^ self ].
	aXdUrl := self client serverUrl / XdConstants cdnPathSegments / self fileInfo pathSegment / self fileInfo fileName.
	aResponse := ZnClient new
		url: aXdUrl;
		get;
		response.
	aResponse isSuccess ifFalse: [ ^ self ].
	self xdFile: (XdFile fromBytes: aResponse contents)
]

{ #category : #execution }
XdClientDownloadXDocCommand >> execute [
	self ensureXDocUrl.
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
