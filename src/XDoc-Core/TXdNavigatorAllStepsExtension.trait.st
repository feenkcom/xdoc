Trait {
	#name : #TXdNavigatorAllStepsExtension,
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #accessing }
TXdNavigatorAllStepsExtension >> allSteps [
	<return: #Array of: #XdNavigatorProtoStep>
	^ self explicitRequirement
]
