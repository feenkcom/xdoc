Class {
	#name : #XdPublishInfoModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'info'
	],
	#category : #'XDoc-Client-Publish - Brick'
}

{ #category : #accessing }
XdPublishInfoModel >> info [
	<return: #XdPublishInfo>
	^ info
]

{ #category : #accessing }
XdPublishInfoModel >> info: aXdPublishInfo [
	self 
		assert: [ aXdPublishInfo notNil ] 
		description: [ 'Publish information must be non-nil' ].
	info := aXdPublishInfo.
	self onInfoChanged.
]

{ #category : #initialization }
XdPublishInfoModel >> initialize [
	super initialize.
	info := XdEmptyPublishInfo uniqueInstance.

]

{ #category : #hooks }
XdPublishInfoModel >> initializeListeners [
	super initializeListeners.

	self 
		when: XdPublishInfoRequest 
		reply: [ XdPublishInfoChangedEvent new info: self info ]
]

{ #category : #notifying }
XdPublishInfoModel >> notifyInfoChanged [
	self dispatchEvent: (XdPublishInfoChangedEvent new info: self info)
]

{ #category : #hooks }
XdPublishInfoModel >> onInfoChanged [
	self notifyInfoChanged.
]
