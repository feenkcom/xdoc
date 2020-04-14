Trait {
	#name : #TXdShareActionsAccess,
	#instVars : [
		'actions'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Traits'
}

{ #category : #accessing }
TXdShareActionsAccess >> actions [
	^ actions
]

{ #category : #accessing }
TXdShareActionsAccess >> actions: aXdShareAction [
	self 
		assert: [ aXdShareAction isNotNil ]
		description: [ 'Share actions must be non-nil' ].
	actions := aXdShareAction
]

{ #category : #defaults }
TXdShareActionsAccess >> defaultActions [
	^ XdShareActions null
]

{ #category : #initialization }
TXdShareActionsAccess >> initializeActions [
	actions := self defaultActions
]
