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
GtPlayBook >> playBookNameFrom: eachXdocFile [
	| anXdFile |
	anXdFile := self xdocFileFrom: eachXdocFile.
	^ anXdFile manifest title 
		ifEmpty: [ eachXdocFile basename asRopedText ]
		ifNotEmpty: #asRopedText.
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> readPlayBookFrom: eachFile [
	| aPlayBookMember aXdFile aJsonString aPlayBook |
	aXdFile := self xdocFileFrom: eachFile.
	aPlayBookMember := aXdFile streamingStrategy zip members
		detect:
			[ :aMember | aMember fileName endsWith: XdConstants playBookExtension ].
	aJsonString := aPlayBookMember contents asByteArray utf8Decoded.
	aPlayBook := XdPlayBookJsonMapping readPlayBook: aJsonString.
	aPlayBook subscribeExternalTools.
	^ aPlayBook
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> storePlayBookInto: aXdFile [ 
	| aText aTitle aDescription |
	aText := String streamContents: [ :aStream |
		self pages do: [ :eachPage | 
			eachPage snippets do: [ :eachSnippet |
				eachSnippet isUserSnippet ifTrue: [ 
					aStream nextPutAll: eachSnippet text asString; cr ] ] ] ].
	aTitle := aText first: (aText size min: 20).
	aTitle := aTitle replace: [ :eachCharacter | 
		eachCharacter isSeparator ifTrue: [ Character space ] ifFalse: [ eachCharacter ] ]. 
	aDescription := aText first: (aText size min: 100).

	aXdFile writer
		authorName: Author name;
		title: aTitle;
		description: aDescription;
		playbook: self;
		write
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> xdocFileFrom: eachFile [
	^ XdReader new
		streamingStrategy: (XdStreamingStrategy file: eachFile);
		read
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> xdocPagesToPersist [
	<return: #Array of: #GtPlayPage>
	^ self pages select: #shouldBePersisted
]

{ #category : #'*XDoc-Core' }
GtPlayBook >> xdocPlayBookListElement [
	| aFileReference aList allXdocFiles |
	aFileReference := FileLocator localDirectory / 'xdocs'.
	aFileReference ensureCreateDirectory.
	allXdocFiles := aFileReference filesMatching: '*.', XdConstants xdocExtension.
	allXdocFiles sort: [ :a :b | a modificationTime > b modificationTime ].
	aList := BrSimpleList new.
	aList 
		stencil: [ :eachXdocFile :index |
			BlTextElement new
				text: (self playBookNameFrom: eachXdocFile);
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 5);
				when: BlClickEvent do: [ :anEvent  |
					anEvent consumed: true.
					aList selectOne: index.
					GtInspector openOnPlayBook: (self readPlayBookFrom: eachXdocFile) ] ];
		display: allXdocFiles;
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
