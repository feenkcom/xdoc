Extension { #name : #ZipArchiveMember }

{ #category : #'*XDoc-Core' }
ZipArchiveMember >> gtBytes [
	<return: #ByteArray>
	| aStream |
	aStream := (ByteArray new: self uncompressedSize) writeStream.
	self extractTo: aStream.
	^ aStream contents
]

{ #category : #'*XDoc-Core' }
ZipArchiveMember >> gtContents [
	<return: #String or: #ByteArray>
	"Answer my contents as a string."
	^ self isTextFile 
		ifFalse: [ self gtBytes ] 
		ifTrue: [ self gtBytes utf8Decoded ]
]

{ #category : #'*XDoc-Core' }
ZipArchiveMember class >> gtNewFromStream: aReadStream named: aFileName [
	^ XdZipStreamMember newFrom: aReadStream named: aFileName
]
