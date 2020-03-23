Trait {
	#name : #TXdNavigatorStepIndex,
	#instVars : [
		'index'
	],
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #asserting }
TXdNavigatorStepIndex >> assertIndex: anInteger [
	self
		assert: [ anInteger isInteger ]
		description: [ 'Index must be an integer value' ].
	self
		assert: [ anInteger > 0 ]
		description: [ 'Index must be a positive integer value' ]
]

{ #category : #defaults }
TXdNavigatorStepIndex >> defaultIndexValue [
	^ 1
]

{ #category : #defaults }
TXdNavigatorStepIndex >> defaultName [
	<return: #String>
	^ self explicitRequirement
]

{ #category : #accessing }
TXdNavigatorStepIndex >> inCollection: aCollection ifAbsent: aBlock [
	^ aCollection size < self index
		ifTrue: aBlock 
		ifFalse: [ aCollection at: self index ]
]

{ #category : #accessing }
TXdNavigatorStepIndex >> index [
	<return: #Integer>
	^ index ifNil: [ self defaultIndexValue ]
]

{ #category : #accessing }
TXdNavigatorStepIndex >> index: anInteger [
	self assertIndex: anInteger.
	index := anInteger
]

{ #category : #accessing }
TXdNavigatorStepIndex >> name [
	^ self index = self defaultIndexValue
		ifTrue: [ 'Main ', self defaultName ] 
		ifFalse: [ self defaultName, ' at: ', self index asString ]
]
