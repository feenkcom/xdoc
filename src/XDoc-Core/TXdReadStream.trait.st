Trait {
	#name : #TXdReadStream,
	#category : #'XDoc-Core-Utility'
}

{ #category : #'private - streams' }
TXdReadStream >> readStream [
	"Return a binary read stream"
	^ self explicitRequirement
]

{ #category : #'api - streams' }
TXdReadStream >> readStreamDo: aBlock [
	"Iterate over a binary read stream"
	| aStream |
	aStream := self readStream.
	^ [ aBlock value: aStream ]
		ensure: [ aStream close ]
]
