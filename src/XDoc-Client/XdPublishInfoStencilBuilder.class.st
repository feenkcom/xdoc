Class {
	#name : #XdPublishInfoStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'info'
	],
	#category : #'XDoc-Client-Brick'
}

{ #category : #'api - instantiation' }
XdPublishInfoStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
			viewModel: (XdPublishInfoModel new info: self info);
			look: XdPublishInfoLook;
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent. ]
]

{ #category : #accessing }
XdPublishInfoStencilBuilder >> info [
	<return: #XdPublishInfo>
	^ info
]

{ #category : #accessing }
XdPublishInfoStencilBuilder >> info: aXdPublishInfo [
	self 
		assert: [ aXdPublishInfo notNil ] 
		description: [ 'Publish information must be non-nil' ].
	info := aXdPublishInfo
]

{ #category : #initialization }
XdPublishInfoStencilBuilder >> initialize [
	super initialize.
	info := XdEmptyPublishInfo uniqueInstance.
]
