Extension { #name : #GtPlayBook }

{ #category : #'*XDoc-Core' }
GtPlayBook >> storePlayBookInto: aXdFile [ 
	aXdFile writer
		authorName: Author name;
		playbook: self;
		write
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
