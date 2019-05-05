Class {
	#name : #XdPublishInfoInnerWidgetLook,
	#superclass : #BrLook,
	#category : #'XDoc-Client-Publish - Brick'
}

{ #category : #initialization }
XdPublishInfoInnerWidgetLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget margin)
				asBrLookPropertyChangeWithValue: [ BlInsets
						top: 5
						left: 0
						bottom: 5
						right: 0 ])
]
