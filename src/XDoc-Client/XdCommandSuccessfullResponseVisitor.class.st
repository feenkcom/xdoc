Class {
	#name : #XdCommandSuccessfullResponseVisitor,
	#superclass : #Object,
	#traits : 'TXdCommandVisitor + TGtUniqueInstance',
	#classTraits : 'TXdCommandVisitor classTrait + TGtUniqueInstance classTrait',
	#category : #'XDoc-Client-Responses'
}

{ #category : #visiting }
XdCommandSuccessfullResponseVisitor >> visitXdClientPublishXDocCommand: aCommand [
	^ XdSuccessfullyPublishedResponse
]
