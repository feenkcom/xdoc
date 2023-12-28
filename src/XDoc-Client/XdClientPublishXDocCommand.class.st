Class {
	#name : #XdClientPublishXDocCommand,
	#superclass : #XdClientCreateXDocCommand,
	#instVars : [
		'spaceName',
		'spaceId',
		'createDate'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #visitor }
XdClientPublishXDocCommand >> accept: aVisitor [
	^ aVisitor visitXdClientPublishXDocCommand: self
]

{ #category : #accessing }
XdClientPublishXDocCommand >> createDate: aDate [
	createDate := aDate
]

{ #category : #execution }
XdClientPublishXDocCommand >> execute [
	| znClient |
	znClient := self zincClient
		url: self postUrl;
		entity: self xdocEntity.
	spaceId ifNotNil: [znClient queryAt: 'space_id' put: spaceId ].
	createDate ifNotNil: [znClient headerAt: 'X-Lepiter-CreatedOn' put: createDate asString ].
	self response:(znClient post; response).
	
]

{ #category : #testing }
XdClientPublishXDocCommand >> isSuccess [
	<return: #Boolean>
	^ self response ifNotNil: #isSuccess ifNil: false
]

{ #category : #accessing }
XdClientPublishXDocCommand >> postUrl [
	<return: #ZnUrl>
	^ self client serverUrl asZnUrl withPathSegments: XdConstants xdocsPathSegments
]

{ #category : #printing }
XdClientPublishXDocCommand >> printOn: aStream [
	(self response isNotNil and: [ self response isSuccess ]) 
		 ifTrue: [ aStream 
			nextPutAll: 'Successfully published at ';
			print: self publicUrl.
			^ self ].
	aStream nextPutAll: 'Publish XDoc document'.
	self client ifNotNil: [
		aStream nextPutAll: ' at '; print: self client serverUrl ].
	self response ifNotNil: [ 
		aStream nextPutAll: ' (failure)' ]
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

{ #category : #actions }
XdClientPublishXDocCommand >> responseToClipboard [
	| aString |
	self response ifNil: [ ^ self inform: 'A server response is undefined' ].
	aString := self response printString.
	Clipboard clipboardText: aString.
   self inform: aString , ' error occurred'.
]

{ #category : #accessing }
XdClientPublishXDocCommand >> spaceId: aSpaceId [
	spaceId := aSpaceId
]

{ #category : #accessing }
XdClientPublishXDocCommand >> spaceName: aSpaceName [
	spaceName := aSpaceName
]
