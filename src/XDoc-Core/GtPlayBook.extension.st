Extension { #name : #GtPlayBook }

{ #category : #'*XDoc-Core' }
GtPlayBook >> storePlayBookInto: aXdFile [ 
	aXdFile writer
		authorName: Author name;
		playbook: self;
		write
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> xdocPagesToPersist [
	<return: #Array of: #GtPlayPage>
	^ self pages select: #shouldBePersisted
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> xdocPlayBookList [
	<playBookHandler>
	self addPlayPage: XdXdocListPlayPage new
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> xdocSaving [
	<playBookHandler>
	| anXdocPlaybookHandler aFileReference |
	aFileReference := FileLocator localDirectory / 'xdocs' / (UUID new asString, '.xdoc').
	aFileReference parent ensureCreateDirectory. 
	anXdocPlaybookHandler := XdFile new.
	anXdocPlaybookHandler streamingStrategy: (XdStreamingStrategy file: aFileReference).
	self 
		subscribe: GtPageSnippetAnnouncement 
		do: [ :anAnnuncement | self storePlayBookInto: anXdocPlaybookHandler ]
]
