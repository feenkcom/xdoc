Extension { #name : #GtPlayBook }

{ #category : #'*XDoc-Core' }
GtPlayBook >> gtActionXdocFor: anAction [
	<gtAction>
	^ anAction explicit 
		category: #playground;
		stencil: [ | button |
			button := BrDropdown new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				in: [ :aDropdown | aDropdown toggle: [ 
						BrButton new
							look: BrGlamorousButtonWithIconLook;
							icon: BrGlamorousIcons menu asElement;
							label: 'XDoc' translated;
							action: [ aDropdown toggle ] ] ];
				popup: [ self xdocPlayBookListElement ];
				look: (BrDropdownExamples new roundLook) ]
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> readPlayBookFrom: eachFile [
	| aPlayBookMember aXdFile aJsonString aPlayBook |
	aXdFile := XdFile new
		streamingStrategy: (XdStreamingStrategy file: eachFile).
	aPlayBookMember := aXdFile streamingStrategy zip members
		detect: [ :aMember | aMember fileName endsWith: XdConstants playBookExtension ].
	aJsonString := aPlayBookMember contents asByteArray utf8Decoded.
	aPlayBook := XdPlayBookJsonMapping readPlayBook: aJsonString.
	^ aPlayBook
]

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
GtPlayBook >> xdocPlayBookListElement [
	| aFileReference aList |
	aFileReference := FileLocator localDirectory / 'xdocs'.
	aFileReference ensureCreateDirectory.
	aList := BrSimpleList new.
	aList 
		stencil: [ :each :index |
			BlTextElement new
				text: each basename asRopedText;
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 5);
				when: BlClickEvent do: [ :anEvent  |
					anEvent consumed: true.
					aList selectOne: index.
					GtInspector openOnPlayBook: (self readPlayBookFrom: each) ] ];
		display: aFileReference allFiles;
		constraintsDo: [ :c | 
			c padding: (BlInsets top: 10).
			c vertical exact: 200.
			c horizontal exact: 200 ].
	^ aList
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> xdocSaving [
	<playBookHandler>
	| anXdocPlaybookHandler aFileReference |
	aFileReference := FileLocator localDirectory / 'xdocs' / 
		(XdUtility fileNameFromDateAndTime: DateAndTime now).
	aFileReference parent ensureCreateDirectory. 
	anXdocPlaybookHandler := XdFile new.
	anXdocPlaybookHandler streamingStrategy: (XdStreamingStrategy file: aFileReference).
	self 
		subscribe: GtPageSnippetAnnouncement 
		do: [ :anAnnuncement | self storePlayBookInto: anXdocPlaybookHandler ]
]
