Class {
	#name : #XdClientDownloadListCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'list'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdClientDownloadListCommand >> execute [
	| aResponse |
	aResponse := ZnClient new
		url: self listUrl;
		signalProgress: self signalProgress;
		get;
		response.
	aResponse isSuccess
		ifFalse: [ ^ self list ].
	self list: (XdManifestJsonMapping readFileInfos: aResponse contents).
	^ self list
]

{ #category : #initialization }
XdClientDownloadListCommand >> initialize [
	super initialize.
	list := #()
]

{ #category : #accessing }
XdClientDownloadListCommand >> list [
	^ list
]

{ #category : #accessing }
XdClientDownloadListCommand >> list: anObject [
	list := anObject
]

{ #category : #accessing }
XdClientDownloadListCommand >> listUrl [
	<return: #ZnUrl>
	^ self client serverUrl
		/ XdConstants cdnPathSegments
		/ XdConstants listFileName
]
