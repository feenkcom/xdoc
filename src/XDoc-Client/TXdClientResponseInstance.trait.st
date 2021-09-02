Trait {
	#name : 'TXdClientResponseInstance',
	#instVars : [
		'response'
	],
	#category : 'XDoc-Client-Traits'
}

{ #category : 'accessing' }
TXdClientResponseInstance >> response [
	<return: #ZnResponse>
	^ response
]

{ #category : 'accessing' }
TXdClientResponseInstance >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ]
		description: [ 'Zinc response must be non-nil' ].
	response := aZnResponse
]
