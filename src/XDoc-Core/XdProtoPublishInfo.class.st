Class {
	#name : #XdProtoPublishInfo,
	#superclass : #Object,
	#category : #'XDoc-Core-Publisher'
}

{ #category : #'api - accessing' }
XdProtoPublishInfo >> author [
	"Return a document author"
	<return: #BlRope>
	^ self subclassResponsibility
]

{ #category : #'api - accessing' }
XdProtoPublishInfo >> description [
	"Return a document description"
	<return: #BlRope>
	^ self subclassResponsibility
]

{ #category : #'api - actions' }
XdProtoPublishInfo >> publish [
	"Publish an information"
	self subclassResponsibility
]

{ #category : #'api - accessing' }
XdProtoPublishInfo >> title [
	"Return a document title"
	<return: #BlRope>
	^ self subclassResponsibility
]
