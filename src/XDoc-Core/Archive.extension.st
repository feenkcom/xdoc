Extension { #name : #Archive }

{ #category : #'*XDoc-Core' }
Archive >> gtAddStream: aReadStream as: aFileName [
	| newMember |
	newMember := self memberClass gtNewFromStream: aReadStream named: aFileName.
	self addMember: newMember.
	newMember localFileName: aFileName.
	^newMember
]
