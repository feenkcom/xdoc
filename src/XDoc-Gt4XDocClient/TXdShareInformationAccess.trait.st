Trait {
	#name : #TXdShareInformationAccess,
	#instVars : [
		'information'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Traits'
}

{ #category : #defaults }
TXdShareInformationAccess >> defaultInformation [
	^ XdShareInformation null
]

{ #category : #accessing }
TXdShareInformationAccess >> information [
	^ information ifNil: [ information := self defaultInformation ]
]

{ #category : #accessing }
TXdShareInformationAccess >> information: anObject [
	information := anObject
]
