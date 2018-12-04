Extension { #name : #ZipArchiveMember }

{ #category : #'*XDoc-Core' }
ZipArchiveMember class >> gtNewFromStream: aFileName [
	^ GtZipStreamMember gtNewFromStream: aFileName
]

{ #category : #'*XDoc-Core' }
ZipArchiveMember class >> gtNewFromStream: aString named: aFileName [
	^ GtZipStreamMember newFrom: aString named: aFileName
]
