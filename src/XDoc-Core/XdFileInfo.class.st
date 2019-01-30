Class {
	#name : #XdFileInfo,
	#superclass : #Object,
	#instVars : [
		'manifest',
		'fileName',
		'pathSegment',
		'xdocUrl',
		'createdOn'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #'accessing - manifest' }
XdFileInfo >> author [
	^ self manifest author
]

{ #category : #accessing }
XdFileInfo >> createdOn [
	^ createdOn
]

{ #category : #accessing }
XdFileInfo >> createdOn: creationTime [
	createdOn := creationTime
]

{ #category : #'accessing - manifest' }
XdFileInfo >> description [
	^ self manifest description
]

{ #category : #accessing }
XdFileInfo >> fileName [
	^ fileName
]

{ #category : #accessing }
XdFileInfo >> fileName: anObject [
	fileName := anObject
]

{ #category : #initialization }
XdFileInfo >> initialize [
	super initialize.
	manifest := XdManifest empty.
]

{ #category : #accessing }
XdFileInfo >> manifest [
	^ manifest
]

{ #category : #accessing }
XdFileInfo >> manifest: anObject [
	manifest := anObject
]

{ #category : #accessing }
XdFileInfo >> pathSegment [
	^ pathSegment
]

{ #category : #accessing }
XdFileInfo >> pathSegment: anObject [
	pathSegment := anObject
]

{ #category : #'accessing - manifest' }
XdFileInfo >> title [
	^ self manifest title
]

{ #category : #accessing }
XdFileInfo >> titleAndAuthor [
	<return: #String>
	| aTitle anAuthor |
	aTitle := self manifest title ifEmpty: [ 'Empty document title' ].
	anAuthor := self manifest author ifEmpty: [ 'unknown author' ].
	^ aTitle, ' by ', anAuthor
]

{ #category : #accessing }
XdFileInfo >> xdocUrl [
	^ xdocUrl
]

{ #category : #accessing }
XdFileInfo >> xdocUrl: aZnUrl [
	xdocUrl := aZnUrl
]
