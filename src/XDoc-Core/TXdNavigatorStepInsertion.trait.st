Trait {
	#name : #TXdNavigatorStepInsertion,
	#instVars : [
		'nextStep'
	],
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #'adding steps' }
TXdNavigatorStepInsertion >> insertStep: aXdNavigatorStep [
	aXdNavigatorStep nextStep: self nextStep.
	self nextStep: aXdNavigatorStep
]

{ #category : #accessing }
TXdNavigatorStepInsertion >> nextStep [
	<return: #XdNavigatorStep>
	^ nextStep
]

{ #category : #accessing }
TXdNavigatorStepInsertion >> nextStep: aXdNavigatorStep [
	self 
		assert: [ aXdNavigatorStep isNotNil ]
		description: [ 'Navigator next step must be non-nil' ].
	nextStep := aXdNavigatorStep
]
