Trait {
	#name : #TXdClientXDocIdInstance,
	#instVars : [
		'xdocId'
	],
	#category : 'XDoc-Client-Traits'
}

{ #category : #accessing }
TXdClientXDocIdInstance >> client [ 
	<return: #XdClient>
	^ self explicitRequirement
]

{ #category : #accessing }
TXdClientXDocIdInstance >> xdocId [
	<return: #String>
	^ xdocId
]

{ #category : #accessing }
TXdClientXDocIdInstance >> xdocId: anIdString [
	self 
		assert: [ anIdString notNil ] 
		description: [ 'XDoc ID must be non-nil' ].
	xdocId := anIdString
]

{ #category : #'accessing - computed' }
TXdClientXDocIdInstance >> xdocUrl [
	<return: #ZnUrl>
	^ self client serverUrl / XdConstants xdocPathSegments / self xdocId
]
