Class {
	#name : #XdClientRequest,
	#superclass : #BrRequest,
	#category : #'XDoc-Gt4XDocClient-Documents'
}

{ #category : #initialization }
XdClientRequest >> responseClass [
	^ XdClientChanged
]
