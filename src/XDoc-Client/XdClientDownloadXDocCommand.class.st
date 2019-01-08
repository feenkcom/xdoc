Class {
	#name : #XdClientDownloadXDocCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'url',
		'xdFile'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdClientDownloadXDocCommand >> execute [
	self ensureUrl.
	self ensureXDocBytes.
	self ensureXdFile.
	^ self xdFile
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
