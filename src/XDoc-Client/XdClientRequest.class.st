Class {
	#name : #XdClientRequest,
	#superclass : #BrRequest,
	#category : #'XDoc-Client-Documents - Brick'
}

{ #category : #initialization }
XdClientRequest >> responseClass [
	^ XdClientChanged
]
