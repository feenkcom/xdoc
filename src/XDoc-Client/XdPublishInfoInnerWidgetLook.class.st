Class {
	#name : #XdPublishInfoInnerWidgetLook,
	#superclass : #BrLook,
	#category : #'XDoc-Client-Publish - Brick'
}

{ #category : #initialization }
XdPublishInfoInnerWidgetLook >> initializeLook [
	super initializeLook.
	self widget 
		constraintsDo: [ :c | 
			c margin: (BlInsets top: 5 left: 0 bottom: 5 right: 0) ]
]
