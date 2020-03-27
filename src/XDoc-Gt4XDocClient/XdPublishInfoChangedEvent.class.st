Class {
	#name : #XdPublishInfoChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'info'
	],
	#category : #'XDoc-Gt4XDocClient-Publish'
}

{ #category : #accessing }
XdPublishInfoChangedEvent >> info [
	<return: #XdPublishInfo>
	^ info
]

{ #category : #accessing }
XdPublishInfoChangedEvent >> info: aXdPublishInfo [
	self 
		assert: [ aXdPublishInfo notNil ] 
		description: [ 'Publish information must be non-nil' ].
	info := aXdPublishInfo
]
