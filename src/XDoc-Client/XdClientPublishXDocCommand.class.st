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
	self response: (ZnClient new
		url: self postUrl;
		entity: self xdocEntity;
		post;
		response).
	
]

{ #category : #accessing }
XdClientPublishXDocCommand >> postUrl [
	<return: #ZnUrl>
	^ self client serverUrl withPathSegments: #( 'api' 'xdoc' 'post' )
]

{ #category : #accessing }
XdClientPublishXDocCommand >> publicUrl [
	<return: #ZnUrl>
	^ self response location asZnUrl
]

{ #category : #accessing }
XdClientPublishXDocCommand >> publicUrlToClipboard [
	| aPublishedUrl |
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
	^ self xdoc streamingStrategy bytes
]

{ #category : #accessing }
XdClientPublishXDocCommand >> xdocEntity [
	<return: #ZnEntity>
	^ ZnEntity bytes: self xdocBytes
]
