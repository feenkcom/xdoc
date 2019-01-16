Class {
	#name : #XdPublishInfoModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'info'
	],
	#category : #'XDoc-Client-Brick'
}

{ #category : #accessing }
XdPublishInfoModel >> info [
	<return: #OldXdPublishInfo>
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

{ #category : #notifying }
XdPublishInfoModel >> notifyInfoChanged [
	self dispatchEvent: (XdPublishInfoChangedEvent new info: self info)
]

{ #category : #hooks }
XdPublishInfoModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	self 
		when: XdPublishInfoRequest 
		reply: [ XdPublishInfoChangedEvent new info: self info ]
]

{ #category : #hooks }
XdPublishInfoModel >> onInfoChanged [
	self notifyInfoChanged.
]
