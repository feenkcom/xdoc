Trait {
	#name : #TXdShareInformationHolderAccess,
	#instVars : [
		'informationHolder'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Traits'
}

{ #category : #defaults }
TXdShareInformationHolderAccess >> defaultInformationHolder [
	^ XdShareInformationHolder new
]

{ #category : #accessing }
TXdShareInformationHolderAccess >> information [
	^ informationHolder information
]

{ #category : #accessing }
TXdShareInformationHolderAccess >> information: anObject [
	informationHolder information: anObject
]

{ #category : #accessing }
TXdShareInformationHolderAccess >> informationHolder [
	^ informationHolder
]

{ #category : #initialization }
TXdShareInformationHolderAccess >> initializeInformationHolder [
	informationHolder := self defaultInformationHolder.
]
