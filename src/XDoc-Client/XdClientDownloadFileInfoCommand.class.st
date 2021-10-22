Class {
	#name : #XdClientDownloadFileInfoCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'url',
		'fileInfo'
	],
	#category : 'XDoc-Client-Commands'
}

{ #category : #private }
XdClientDownloadFileInfoCommand >> ensureFileInfo [
	| anIdPathSegment aRootUrl aInfoUrl aResponse segments hasRealm|
	(XdUtility pathSegmentsInCdnPath: self url pathSegments) ifFalse: [ ^ self ].
	self url pathSegments size > XdConstants cdnPathSegments size ifFalse: [ ^ self ].
	segments := self url pathSegments.
	hasRealm := segments size = 3.
	
	anIdPathSegment := self url pathSegments at: XdConstants cdnPathSegments size + (hasRealm ifTrue: [2] ifFalse:[1]).
	aRootUrl := (self url copy clearPath addPathSegments: XdConstants cdnPathSegments) "/ anIdPathSegment".
	aInfoUrl := aRootUrl.
	hasRealm ifTrue: [aInfoUrl := aInfoUrl/segments first].
	
	aInfoUrl := aInfoUrl / anIdPathSegment / XdConstants xdocInfoFileName.
	aResponse := ZnClient new
		url: aInfoUrl;
		get;
		response.
	aResponse isSuccess ifFalse: [ ^ self ].
	self fileInfo: (XdManifestJsonMapping readFileInfo: aResponse contents)
]

{ #category : #execution }
XdClientDownloadFileInfoCommand >> execute [
	self ensureFileInfo.
	self updateXDocUrl.
	^ self fileInfo
]

{ #category : #accessing }
XdClientDownloadFileInfoCommand >> fileInfo [
	^ fileInfo
]

{ #category : #accessing }
XdClientDownloadFileInfoCommand >> fileInfo: aXdFileInfo [ 
	fileInfo := aXdFileInfo
]

{ #category : #private }
XdClientDownloadFileInfoCommand >> updateXDocUrl [
	| aXDocUrl spaceName |
	self fileInfo ifNil: [ ^ self ].
	aXDocUrl := self client serverUrl 
		/ XdConstants cdnPathSegments .
	self fileInfo hasRealm ifTrue:[
		aXDocUrl := aXDocUrl / self fileInfo realm].
	aXDocUrl := aXDocUrl 
		/ self fileInfo pathSegment 
		/ self fileInfo fileName.
		
	
	self fileInfo xdocUrl: aXDocUrl
]

{ #category : #accessing }
XdClientDownloadFileInfoCommand >> url [
	^ url
]

{ #category : #accessing }
XdClientDownloadFileInfoCommand >> url: anObject [
	url := anObject
]
