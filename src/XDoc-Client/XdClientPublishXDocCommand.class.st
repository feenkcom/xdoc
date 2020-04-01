Class {
	#name : #XdClientPublishXDocCommand,
	#superclass : #XdClientCommand,
	#instVars : [
		'xdoc',
		'response'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #execution }
XdClientPublishXDocCommand >> execute [
	self response: (self zincClient
		url: self postUrl;
		entity: self xdocEntity;
		post;
		response).
	
]

{ #category : #testing }
XdClientPublishXDocCommand >> isSuccess [
	<return: #Boolean>
	^ self response ifNotNil: #isSuccess ifNil: false
]

{ #category : #accessing }
XdClientPublishXDocCommand >> postUrl [
	<return: #ZnUrl>
	^ self client serverUrl withPathSegments: XdConstants xdocsPathSegments
]

{ #category : #accessing }
XdClientPublishXDocCommand >> publicUrl [
	<return: #ZnUrl>
	^ self response location asZnUrl
]

{ #category : #actions }
XdClientPublishXDocCommand >> publicUrlToClipboard [
	| aPublishedUrl |
	self response isSuccess ifFalse: [
		^ self responseToClipboard ].
	aPublishedUrl := self response location.
	aPublishedUrl ifNil: [ ^ self inform: 'An HTML file was not published' ].
	Clipboard clipboardText: aPublishedUrl asString.
   self inform: aPublishedUrl asString, ' was published and the URL was copied to a clipboard'.
]

{ #category : #accessing }
XdClientPublishXDocCommand >> response [
	^ response
]

{ #category : #accessing }
XdClientPublishXDocCommand >> response: anObject [
	response := anObject
]

{ #category : #actions }
XdClientPublishXDocCommand >> responseToClipboard [
	| aString |
	self response ifNil: [ ^ self inform: 'A server response is undefined' ].
	Sensor shiftPressed ifTrue: [ 
		"Debugging purpose"
		self response inspect.
		^ self ].
	aString := self response printString.
	Clipboard clipboardText: aString.
   self inform: aString , ' error occurred'.
]

{ #category : #accessing }
XdClientPublishXDocCommand >> xdoc [
	<return: #XdFile>
	^ xdoc
]

{ #category : #accessing }
XdClientPublishXDocCommand >> xdoc: aXdFile [ 
	xdoc := aXdFile
]

{ #category : #private }
XdClientPublishXDocCommand >> xdocBytes [
	<return: #ByteArray>
	self flag: 'XDoc API proposeal [feenkcom/gtoolkit#888]'.
	"^ self xdoc reader bytes"
	^ self xdoc streamingStrategy bytes
]

{ #category : #accessing }
XdClientPublishXDocCommand >> xdocEntity [
	<return: #ZnEntity>
	^ ZnEntity bytes: self xdocBytes
]
