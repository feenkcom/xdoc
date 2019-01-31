Class {
	#name : #XdGlamorousDocumentsLook,
	#superclass : #XdDocumentsLook,
	#category : #'XDoc-Client-Documents - Brick'
}

{ #category : #initialization }
XdGlamorousDocumentsLook >> initializeList [
	super initializeList.
	list constraintsDo: [ :c | c padding: (BlInsets top: 10) ].
]
