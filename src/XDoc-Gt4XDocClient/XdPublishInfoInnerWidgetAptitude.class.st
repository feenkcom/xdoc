Class {
	#name : #XdPublishInfoInnerWidgetAptitude,
	#superclass : #BrAptitude,
	#category : #'XDoc-Gt4XDocClient-Publish'
}

{ #category : #initialization }
XdPublishInfoInnerWidgetAptitude >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget margin)
		with: [ BlInsets
				top: 5
				left: 0
				bottom: 5
				right: 0 ]
]
