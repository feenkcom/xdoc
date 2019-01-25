Class {
	#name : #XdGlamorousDocumentsLook,
	#superclass : #XdDocumentsLook,
	#category : #'XDoc-Client-Documents - Brick'
}

{ #category : #initialization }
XdGlamorousDocumentsLook >> initializeList [
	super initializeList.
	list addEventHandler: GtInspectorListToSelectHandler new.
	list constraintsDo: [ :c | c padding: (BlInsets top: 10) ].
]
