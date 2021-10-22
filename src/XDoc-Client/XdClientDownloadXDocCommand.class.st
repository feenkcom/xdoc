Class {
	#name : #XdClientDownloadXDocCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'url',
		'xdFile',
		'fileInfo'
	],
	#category : 'XDoc-Client-Commands'
}

{ #category : #private }
XdClientDownloadXDocCommand >> downloadFile [
	<return: #FileReference>
	| aBasename |
	aBasename := self fileInfo xdocUrl asZnUrl lastPathSegment.
	^ XdClientUtility 
		notExistingFileIn: XdClientSettings downloadDirectory
		basename: aBasename
]

{ #category : #private }
XdClientDownloadXDocCommand >> ensureFileInfo [
	self fileInfo ifNotNil: [ ^ self ].
	self fileInfo: (XdClientDownloadFileInfoCommand new
		client: self client;
		url: self url;
		execute;
		fileInfo)
]

{ #category : #private }
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

{ #category : #private }
XdClientDownloadXDocCommand >> ensureXdFile [
	| aResponse aFile |
	self fileInfo ifNil: [ ^ self ].
	self ensureXDocUrl.
	aFile := self downloadFile.
	aResponse := ZnClient new
		url: self fileInfo xdocUrl;
		downloadTo: aFile;
		response.
	aResponse isSuccess ifFalse: [ ^ self ].
	self xdFile: (XdFile fromFileReference: aFile).
	self fileInfo previewUrl ifNotNil: [
		self xdFile publicUrl: self fileInfo previewUrl ].
	self fileInfo createdOn ifNotNil: [
		self xdFile publicationDate: self fileInfo createdOn ].
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
XdClientDownloadXDocCommand >> xdFile: anXdFile [
	xdFile := anXdFile
]
