Class {
	#name : #XdFileInfo,
	#superclass : #XdObject,
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#instVars : [
		'manifest',
		'fileName',
		'pathSegment',
		'xdocUrl',
		'createdOn',
		'previewUrl'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #'as yet unclassified' }
XdFileInfo class >> clientOptionName [
	^ #client
]

{ #category : #'as yet unclassified' }
XdFileInfo class >> xdocOptionName [
	^ #xdoc
]

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

{ #category : #accessing }
XdFileInfo >> gtDisplayOn: stream [
	stream nextPutAll: self title
]

{ #category : #accessing }
XdFileInfo >> hasRealm [
	self xdocUrl ifNotNil: [
		^ self xdocUrl asZnUrl segments size = 3].
	^ false
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

{ #category : #accessing }
XdFileInfo >> previewUrl [
	^ previewUrl
]

{ #category : #accessing }
XdFileInfo >> previewUrl: anObject [
	previewUrl := anObject
]

{ #category : #accessing }
XdFileInfo >> realm [
	| computedRealm segments |
	computedRealm := ''.
	self xdocUrl ifNotNil: [
		segments := self xdocUrl asZnUrl segments.
		segments size = 3 ifTrue:[ 
			computedRealm := segments first]. 
		].
	^ computedRealm.
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
