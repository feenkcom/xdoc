Extension { #name : 'XdFileInfo' }

{ #category : '*XDoc-Client' }
XdFileInfo >> client [
	^ self 
		optionAt: self class clientOptionName 
		ifAbsentPut: [ XdClient new ]
]

{ #category : '*XDoc-Client' }
XdFileInfo >> client: anXdClient [
	self 
		assert: [ anXdClient isNotNil ] 
		description: [ 'XDoc client must be non-nil' ].
	^ self 
		optionAt: self class clientOptionName 
		put: anXdClient
]

{ #category : '*XDoc-Client' }
XdFileInfo >> downloadXDoc [
	<return: #XdFile>
	^ self client downloadXDocUsingFileInfo: self
]

{ #category : '*XDoc-Client' }
XdFileInfo >> xdoc [
	<return: #XdFile>
	^ self 
		optionAt: self class xdocOptionName 
		ifAbsentPut: [ self downloadXDoc ]
]
