Extension { #name : #ZipDirectoryMember }

{ #category : #'*XDoc-Core' }
ZipDirectoryMember >> gtLocalFileName: aString [
	| name |
	name := (aString endsWith: '/')
		ifTrue: [ aString ]
		ifFalse: [ aString copyWith: $/ ].
	super localFileName: name.
]
