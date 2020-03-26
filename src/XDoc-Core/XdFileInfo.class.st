Class {
	#name : #XdFileInfo,
	#superclass : #XdObject,
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

{ #category : #accessing }
XdFileInfo >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		items: [ {
			'Title' -> self title.
			'Author' -> self author.
			'Description' -> self description.
			'File name' -> self fileName.
			'Created on' -> self createdOn.
			'XDoc url' -> self xdocUrl} ];
		column: 'Property' format: [:assoc | assoc key];
		column: 'Value' format: [:assoc | assoc value asString ];
		send: #value
]

{ #category : #accessing }
XdFileInfo >> gtDisplayOn: stream [
	stream nextPutAll: self title
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
