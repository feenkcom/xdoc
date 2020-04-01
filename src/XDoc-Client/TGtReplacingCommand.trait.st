Trait {
	#name : #TGtReplacingCommand,
	#category : #'XDoc-Client-Decorated Command Builder'
}

{ #category : #testing }
TGtReplacingCommand >> shouldReplace: aCommand [
	<return: #Boolean>
	^ self class = aCommand class
]
