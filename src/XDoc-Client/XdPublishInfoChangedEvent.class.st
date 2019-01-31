Class {
	#name : #XdPublishInfoChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'info'
	],
	#category : #'XDoc-Client-Publish - Brick'
}

{ #category : #accessing }
XdPublishInfoChangedEvent >> info [
	<return: #OldXdPublishInfo>
	^ info
]

{ #category : #accessing }
XdPublishInfoChangedEvent >> info: aXdPublishInfo [
	self 
		assert: [ aXdPublishInfo notNil ] 
		description: [ 'Publish information must be non-nil' ].
	info := aXdPublishInfo
]
