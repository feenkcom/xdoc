Class {
	#name : #XdProtoResponse,
	#superclass : #Object,
	#category : #'XDoc-Client-Answers'
}

{ #category : #testing }
XdProtoResponse >> isResponse [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #accessing }
XdProtoResponse >> rawResponse [
	<return: #Object>
	^ self subclassResponsibility
]
