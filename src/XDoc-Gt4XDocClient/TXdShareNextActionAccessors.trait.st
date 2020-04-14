Trait {
	#name : #TXdShareNextActionAccessors,
	#instVars : [
		'nextAction',
		'nextActionLabel'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Traits'
}

{ #category : #defaults }
TXdShareNextActionAccessors >> defaultNextAction [
	^ [ :aButton | "do nothing" ]
]

{ #category : #defaults }
TXdShareNextActionAccessors >> defaultNextActionLabel [
	^ 'Next'
]

{ #category : #accessing }
TXdShareNextActionAccessors >> nextAction [
	^ nextAction ifNil: [ nextAction := self defaultNextAction ]
]

{ #category : #accessing }
TXdShareNextActionAccessors >> nextAction: anObject [
	nextAction := anObject
]

{ #category : #accessing }
TXdShareNextActionAccessors >> nextActionLabel [
	^ nextActionLabel ifNil: [ nextActionLabel := self defaultNextActionLabel ]
]

{ #category : #accessing }
TXdShareNextActionAccessors >> nextActionLabel: anObject [
	nextActionLabel := anObject
]
