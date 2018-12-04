Extension { #name : #ZipArchiveMember }

{ #category : #'*XDoc-Core' }
ZipArchiveMember class >> gtNewFromStream: aFileName [
	^ GtZipStreamMember gtNewFromStream: aFileName
]

{ #category : #'*XDoc-Core' }
ZipArchiveMember class >> gtNewFromStream: aString named: aFileName [
	^XdZipStreamMember newFrom: aString named: aFileName
]
