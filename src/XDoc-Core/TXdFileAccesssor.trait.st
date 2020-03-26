Trait {
	#name : #TXdFileAccesssor,
	#instVars : [
		'xdFile'
	],
	#category : #'XDoc-Core-Utility'
}

{ #category : #accessing }
TXdFileAccesssor >> xdFile [
	<return: #XdFile>
	^ xdFile
]

{ #category : #accessing }
TXdFileAccesssor >> xdFile: aXdFile [ 
	self 
		assert: [ aXdFile isNotNil ] 
		description: [ 'XDoc file must be non-nil' ].
	xdFile := aXdFile
]
