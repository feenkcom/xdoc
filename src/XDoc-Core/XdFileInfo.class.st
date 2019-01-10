Class {
	#name : #XdFileInfo,
	#superclass : #Object,
	#instVars : [
		'manifest',
		'fileName',
		'pathSegment'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdFileInfo >> fileName [
	^ fileName
]

{ #category : #accessing }
XdFileInfo >> fileName: anObject [
	fileName := anObject
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
