Trait {
	#name : #TXdNavigatorAllStepsExtension,
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #accessing }
TXdNavigatorAllStepsExtension >> allSteps [
	<return: #Array of: #XdNavigatorProtoStep>
	^ self explicitRequirement
]

{ #category : #'gt-extension' }
TXdNavigatorAllStepsExtension >> gtStepsFor: aView [
	<gtView>
	self nextStep ifNil: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Steps';
		items: [ self allSteps ];
		column: 'Name' item: #name
]
