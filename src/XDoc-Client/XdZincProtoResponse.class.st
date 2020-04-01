Class {
	#name : #XdZincProtoResponse,
	#superclass : #Object,
	#category : #'XDoc-Client-Responses'
}

{ #category : #testing }
XdZincProtoResponse >> isResponse [
	<return: #Boolean>
	^ self subclassResponsibility
]
