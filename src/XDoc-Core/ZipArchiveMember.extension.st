Extension { #name : #ZipArchiveMember }

{ #category : #'*XDoc-Core' }
ZipArchiveMember class >> gtNewFromStream: aReadStream named: aFileName [
	^ XdZipStreamMember newFrom: aReadStream named: aFileName
]
