Trait {
	#name : #TXdCommandVisitor,
	#category : #'XDoc-Client-Responses'
}

{ #category : #visiting }
TXdCommandVisitor >> visitXdClientPublishXDocCommand: aCommand [
	^ self explicitRequirement
]
