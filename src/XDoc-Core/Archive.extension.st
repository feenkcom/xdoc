Extension { #name : #Archive }

{ #category : #'*XDoc-Core' }
Archive >> gtAddStream: aReadStream as: aFileName [
	| newMember |
	newMember := self memberClass newFromStream: aReadStream named: aFileName.
	self addMember: newMember.
	newMember localFileName: aFileName.
	^newMember
]
