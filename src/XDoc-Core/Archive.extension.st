Extension { #name : #Archive }

{ #category : #'*XDoc-Core' }
Archive >> gtAddDirectoryNamed: aDirectoryName [
	| newMember |
	newMember := ZipDirectoryMember new 
		gtLocalFileName:  aDirectoryName.
	self addMember: newMember.
	^ newMember
]

{ #category : #'*XDoc-Core' }
Archive >> gtAddStream: aReadStream as: aFileName [
	| newMember |
	newMember := self memberClass gtNewFromStream: aReadStream named: aFileName.
	self addMember: newMember.
	newMember localFileName: aFileName.
	^newMember
]

{ #category : #'*XDoc-Core' }
Archive >> gtAddString: aString as: aFileName [
	| aMember |
	aMember := self addString: aString utf8Encoded as: aFileName.
	aMember isTextFile: true.
	^ aMember
]
