Trait {
	#name : #TGtUniqueInstance,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Core-Utility'
}

{ #category : #cleanup }
TGtUniqueInstance classSide >> cleanUniqueInstance [
	uniqueInstance := nil
]

{ #category : #cleanup }
TGtUniqueInstance classSide >> cleanUp [
	self cleanUniqueInstance
]

{ #category : #accessing }
TGtUniqueInstance classSide >> default [
	^ self uniqueInstance
]

{ #category : #accessing }
TGtUniqueInstance classSide >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]
