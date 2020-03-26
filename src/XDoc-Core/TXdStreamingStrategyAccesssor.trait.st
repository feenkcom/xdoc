Trait {
	#name : #TXdStreamingStrategyAccesssor,
	#instVars : [
		'streamingStrategy'
	],
	#category : #'XDoc-Core-Utility'
}

{ #category : #initialization }
TXdStreamingStrategyAccesssor >> defaultStreamingStrategy [
	^ XdStreamingStrategy null
]

{ #category : #accessing }
TXdStreamingStrategyAccesssor >> streamingStrategy [
	<return: #XdStreamingStrategy>
	^ streamingStrategy ifNil: [ streamingStrategy := self defaultStreamingStrategy ]
]

{ #category : #accessing }
TXdStreamingStrategyAccesssor >> streamingStrategy: aXdStreamingStrategy [
	self 
		assert: [ aXdStreamingStrategy notNil ] 
		description: [ 'Streaming strategy must be non-nil' ].
	streamingStrategy := aXdStreamingStrategy
]
