Trait {
	#name : #TXdCommandVisitor,
	#category : #'XDoc-Client-Answers - Builder'
}

{ #category : #visiting }
TXdCommandVisitor >> visitXdAuthenticationCommand: aCommand [
	^ aCommand command accept: self
]

{ #category : #visiting }
TXdCommandVisitor >> visitXdClientDeleteXDocIdCommand: aCommand [
	^ self explicitRequirement
]

{ #category : #visiting }
TXdCommandVisitor >> visitXdClientPublishXDocCommand: aCommand [
	^ self explicitRequirement
]

{ #category : #visiting }
TXdCommandVisitor >> visitXdClientUpdateXDocCommand: aCommand [
	^ self explicitRequirement
]

{ #category : #visiting }
TXdCommandVisitor >> visitXdTaskItCommand: aCommand [
	^ self explicitRequirement
]
