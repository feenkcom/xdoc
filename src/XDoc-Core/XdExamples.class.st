Class {
	#name : #XdExamples,
	#superclass : #Object,
	#traits : 'TXdManifestJsonMapping + TXdConstants',
	#classTraits : 'TXdManifestJsonMapping classTrait + TXdConstants classTrait',
	#category : #'XDoc-Core-Examples'
}

{ #category : #'basic objects' }
XdExamples >> attachment [  
	<gtExample>
	
	| anAttachment |

	anAttachment := self emptyAttachment.
	anAttachment fileName: self textFileName.
	anAttachment fileSize: 42.
	anAttachment id: 12.
	self assert: anAttachment id equals: 12.
	self assert: anAttachment fileName equals: self textFileName.
	self assert: anAttachment fileSize equals: 42.
	^ anAttachment.
	
]

{ #category : #'writing - in progress' }
XdExamples >> basicDocumentInProgress [
	<gtExample>
	| aWriter |
	aWriter := self inMemoryWriter.
	aWriter
		title: self documentTitle;
		description: self documentDescription;
		authorName: self documentAuthorName.
	self assert: aWriter manifest notNil.
	self assert: aWriter manifest title equals: self documentTitle.
	self
		assert: aWriter manifest description
		equals: self documentDescription.
	self
		assert: aWriter manifest author
		equals: self documentAuthorName.
	^ aWriter
]

{ #category : #accessing }
XdExamples >> bytes [
	<gtExample>
	^ #[ 1 2 3 4 ]
]

{ #category : #'basic objects' }
XdExamples >> bytesStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := XdStreamingStrategy bytes.
	self assert: aReference bytes isNil.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #'basic objects' }
XdExamples >> document [  
	<gtExample>
	
	| aDocument |

	aDocument := self emptyDocument.
	aDocument type: XdType text.
	aDocument components: { self emptyComponent }.
	self assert: aDocument type equals: XdTextType .
	self assert: aDocument components size equals: 1.
	^ aDocument.
	
]

{ #category : #accessing }
XdExamples >> documentAuthorName [
	<gtExample>
	^ 'Alison Fernandez'
]

{ #category : #accessing }
XdExamples >> documentDescription [
	<gtExample>
	^ 'Description of a document'
]

{ #category : #accessing }
XdExamples >> documentTitle [
	<gtExample>
	^ 'Title of a document'
]

{ #category : #'basic objects' }
XdExamples >> emptyAttachment [  
	<gtExample>
	
	| anAttachment |

	anAttachment := XdAttachment new.
	self assert: anAttachment id isNil.
	self assert: anAttachment fileName isNil.
	self assert: anAttachment fileSize equals: 0.
	^ anAttachment.
	
]

{ #category : #'basic objects' }
XdExamples >> emptyComponent [  
	<gtExample>
	
	| aComponent |

	aComponent := XdComponent new.
	self assert: aComponent link isNil.
	^ aComponent.
	
]

{ #category : #'basic objects' }
XdExamples >> emptyDocument [ 
	<gtExample>
	
	| aDocument |

	aDocument := XdDocument new.
	self assert: aDocument type equals: XdUndefinedType.
	self assert: aDocument components isEmpty.
	^ aDocument.
	
]

{ #category : #'basic objects' }
XdExamples >> emptyFile [
	<gtExample>
	| aXdFile |
	aXdFile := XdFile empty.
	self assert: aXdFile notNil.
	self assert: aXdFile exists not.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest documents size equals: 0.
	self assert: aXdFile manifest attachments size equals: 0.
	self assert: aXdFile streamingStrategy notNil.
	self assert: aXdFile streamingStrategy exists not.
	self assert: aXdFile manifest title equals: ''.
	self assert: aXdFile manifest description equals: ''.
	self assert: aXdFile manifest author equals: ''.
	^ aXdFile
	
]

{ #category : #'basic objects' }
XdExamples >> emptyManifest [
	<gtExample>
	| aManifest |
	aManifest := XdManifest new.
	self assert: aManifest title equals: ''.
	self assert: aManifest description equals: ''.
	self assert: aManifest author equals: ''.
	^ aManifest
]

{ #category : #'json mapping' }
XdExamples >> emptyManifestJsonString [
	<gtExample>
	| aJsonString |
	aJsonString := self json writeManifest: self emptyManifest.
	self assert: aJsonString 
		equals: '{"title":"","description":"","author":"","attachments":[],"documents":[]}'.
	^ aJsonString
]

{ #category : #'basic objects' }
XdExamples >> existingBytesStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := self bytesStreamingStrategy.
	aReference bytes: self bytes.
	self assert: aReference bytes equals: self bytes.
	self assert: aReference exists.
	^ aReference
]

{ #category : #'basic objects' }
XdExamples >> existingFileStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := self fileStreamingStrategy.
	aReference file: self fileLocator.
	self assert: aReference file equals: self fileLocator.
	self assert: aReference exists.
	^ aReference
]

{ #category : #tools }
XdExamples >> file [
	<gtExample>
	| aFile |
	aFile := XdFile new.
	self assert: aFile manifest notNil.
	self assert: aFile streamingStrategy notNil.
	self assert: aFile exists not.
	^ aFile
]

{ #category : #accessing }
XdExamples >> fileLocator [
	<gtExample>
	^ FileLocator image
]

{ #category : #'basic objects' }
XdExamples >> fileStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := XdStreamingStrategy file.
	self assert: aReference file isNil.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #tools }
XdExamples >> inMemoryWriter [
	<gtExample>
	| aWriter |
	aWriter := self writer.
	aWriter streamingStrategy: XdStreamingStrategy bytes.
	self assert: aWriter streamingStrategy notNil.
	self assert: aWriter streamingStrategy exists not.
	^ aWriter
]

{ #category : #accessing }
XdExamples >> json [
	^ XdManifestJsonMapping
]

{ #category : #'basic objects' }
XdExamples >> manifest [
	<gtExample>
	| aManifest |
	aManifest := self emptyManifest.
	aManifest title: self documentTitle.
	aManifest description: self documentDescription.
	aManifest author: self documentAuthorName.
	self assert: aManifest title equals: self documentTitle.
	self assert: aManifest description equals: self documentDescription.
	self assert: aManifest author equals: self documentAuthorName.
	^ aManifest
]

{ #category : #'json mapping' }
XdExamples >> manifestJsonString [
	<gtExample>
	| aJsonString |
	aJsonString := self json writeManifest: self manifest.
	self 
		assert: aJsonString 
		equals: '{"title":"', self documentTitle, 
			'","description":"', self documentDescription,
			'","author":"', self documentAuthorName,
			'","attachments":[],"documents":[]}'.
	^ aJsonString
]

{ #category : #'json mapping' }
XdExamples >> manifestJsonWithOneAttachmentString [
	<gtExample>
	| aJsonString |
	aJsonString := self json writeManifest: self manifestWithOneAttachment.
	self 
		assert: aJsonString 
		equals: '{"title":"', self documentTitle, 
			'","description":"', self documentDescription,
			'","author":"', self documentAuthorName,
			'","attachments":[{"id":12,"filename":"', self textFileName, '","size":42}],',
			'"documents":[{"type":"undefined","components":[]}]}'.
	^ aJsonString
]

{ #category : #'basic objects' }
XdExamples >> manifestWithOneAttachment [
	<gtExample>
	| aManifest |
	aManifest := self manifest.
	aManifest documents: { self emptyDocument }.
	aManifest attachments: { self attachment }.
	^ aManifest
]

{ #category : #navigating }
XdExamples >> navigateTextDocument_MainAttachment [
	<gtExample>
	| anXdFile aResult |
	anXdFile := self writeTextDocument.
	aResult := anXdFile navigator
		mainDocument;
		mainAttachment;
		find.
	self assert: aResult isNotNil.
	self assert: aResult class equals: XdAttachment.
	^ aResult
]

{ #category : #navigating }
XdExamples >> navigateTextDocument_MainAttachment_Stream [
	<gtExample>
	| anXdFile aResult aString |
	anXdFile := self writeTextDocument.
	aResult := anXdFile navigator
		mainDocumentAttachment;
		stringReadStream;
		find.
	self assert: aResult isNotNil.
	self assert: aResult class equals: XdAttachmentStringReadStream.
	aString := aResult readStreamDo: [ :aStream | aStream contents ].
	self assert: aString equals: self textFileContent.
	^ aResult
]

{ #category : #navigating }
XdExamples >> navigateTextDocument_MainComponent [
	<gtExample>
	| anXdFile aResult |
	anXdFile := self writeTextDocument.
	aResult := anXdFile navigator
		mainDocument;
		mainComponent;
		find.
	self assert: aResult isNotNil.
	self assert: aResult class equals: XdComponent.
	^ aResult
]

{ #category : #navigating }
XdExamples >> navigateTextDocument_MainComponent_attachment [
	<gtExample>
	| anXdFile aResult |
	anXdFile := self writeTextDocument.
	aResult := anXdFile navigator
		mainDocument;
		mainComponent;
		componentAttachment;
		find.
	self assert: aResult isNotNil.
	self assert: aResult class equals: XdAttachment.
	^ aResult
]

{ #category : #navigating }
XdExamples >> navigateTextDocument_MainDocument [
	<gtExample>
	| anXdFile aResult |
	anXdFile := self writeTextDocument.
	aResult := anXdFile navigator
		mainDocument;
		find.
	self assert: aResult isNotNil.
	self assert: aResult class equals: XdDocument.
	self assert: aResult type equals: XdTextType.
	^ aResult
]

{ #category : #navigating }
XdExamples >> navigateTextDocument_MainDocumentAttachment [
	<gtExample>
	| anXdFile aResult |
	anXdFile := self writeTextDocument.
	aResult := anXdFile navigator
		mainDocumentAttachment;
		find.
	self assert: aResult isNotNil.
	self assert: aResult class equals: XdAttachment.
	^ aResult
]

{ #category : #tools }
XdExamples >> navigator [
	<gtExample>
	| aNavigator |
	aNavigator := XdNavigator new.
	"some assertions here"
	^ aNavigator
]

{ #category : #'basic objects' }
XdExamples >> nullStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := XdStreamingStrategy null.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #reading }
XdExamples >> readBasicDocument [
	<gtExample>
	| aWrittenXdFile aReader aXdReadFile aFormatVersion |
	aWrittenXdFile := self writeBasicDocument.
	aReader := self reader.
	aXdReadFile := aReader
		streamingStrategy: aWrittenXdFile streamingStrategy;
		read.
	self assert: aXdReadFile notNil.
	self assert: aXdReadFile manifest notNil.
	self assert: aXdReadFile manifest title equals: self documentTitle.
	self
		assert: aXdReadFile manifest description
		equals: self documentDescription.
	self
		assert: aXdReadFile manifest author
		equals: self documentAuthorName.
	self assert: aXdReadFile streamingStrategy notNil.
	self assert: aXdReadFile exists.
	"Ensure format version is included"
	aFormatVersion := aReader readFormatVersionIn: aXdReadFile streamingStrategy zip.
	self assert: aFormatVersion notNil.
	self assert: aFormatVersion equals: self constants formatVersionNumber.
	^ aXdReadFile
]

{ #category : #reading }
XdExamples >> readBrokenFile [
	<gtExample>
	| theErrors aReader aXdFile |
	theErrors := OrderedCollection new.
	aReader := self reader.
	aXdFile := aReader
		streamingStrategy: (XdStreamingStrategy bytes: self bytes);
		onError: [ :anError | theErrors add: anError. self emptyFile ];
		read.
	self assert: aXdFile notNil.
	self assert: aXdFile exists not.
	self assert: theErrors size equals: 1.
	^ aXdFile
	
]

{ #category : #reading }
XdExamples >> readBrokenFileAndRaiseErrorByDefault [
	<gtExample>
	| theErrors aReader aXdFile |
	theErrors := OrderedCollection new.
	aReader := self reader.
	[ aXdFile := aReader
		streamingStrategy: (XdStreamingStrategy bytes: self bytes);
		read.
	] on: Error do: [ :anError | theErrors add: anError ].
	self assert: aXdFile isNil.
	self assert: theErrors size equals: 1.
	^ theErrors first
	
]

{ #category : #reading }
XdExamples >> readTextDocument [
	<gtExample>
	| aWrittenXdFile aReader aXdReadFile aZip aTextFile |
	aWrittenXdFile := self writeTextDocument.
	aReader := self reader.
	aXdReadFile := aReader
		streamingStrategy: aWrittenXdFile streamingStrategy;
		read.
	self assert: aXdReadFile notNil.
	self assert: aXdReadFile manifest notNil.
	self assert: aXdReadFile manifest documents size equals: 1.
	self
		assert: aXdReadFile manifest documents first type
		equals: XdType text.
	self
		assert: aXdReadFile manifest documents first components size
		equals: 1.
	self
		assert: aXdReadFile manifest documents first components first link
		equals: '1'.
	self assert: aXdReadFile manifest attachments size equals: 1.
	self assert: aXdReadFile manifest attachments first id equals: '1'.
	self
		assert: aXdReadFile manifest attachments first fileName
		equals: self textFileName.
	self
		assert: aXdReadFile manifest attachments first fileSize
		equals: self textFileContent size.
	self assert: aXdReadFile streamingStrategy notNil.
	self assert: aXdReadFile exists.
	aZip := aXdReadFile streamingStrategy zip.
	self assert: aZip members size equals: 3.
	aTextFile := aZip memberNamed: self textFileName.
	self assert: aTextFile notNil.
	self assert: aTextFile contents asByteArray utf8Decoded equals: self textFileContent.
	^ aXdReadFile
	
]

{ #category : #tools }
XdExamples >> reader [
	<gtExample>
	| aReader |
	aReader := XdReader new.
	self assert: aReader streamingStrategy isNotNil.
	self assert: aReader streamingStrategy exists not.
	self assert: aReader errorHandler isNotNil.
	^ aReader
]

{ #category : #accessing }
XdExamples >> textFileContent [
	<gtExample>
	^ 'UNICODE příliš žluťoučký kůň úpěl ďábelské ódy'
]

{ #category : #accessing }
XdExamples >> textFileName [
	<gtExample>
	^ 'text-document.txt'
]

{ #category : #writing }
XdExamples >> writeBasicDocument [
	<gtExample>
	| aWriter aXdFile |
	aWriter := self basicDocumentInProgress.
	aXdFile := aWriter write.
	self assert: aXdFile notNil.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest title equals: self documentTitle.
	self
		assert: aXdFile manifest description
		equals: self documentDescription.
	self
		assert: aXdFile manifest author
		equals: self documentAuthorName.
	self assert: aXdFile streamingStrategy notNil.
	self assert: aXdFile exists.
	^ aXdFile
]

{ #category : #writing }
XdExamples >> writeBiggerFollowedBySmallerContentSizeIntoTheSameFile [
	<gtExample>
	"Let's first write a file with a large content and 
	then rewrite the same file with a smaller content"
	| aFileReference aWriter aXdWrittenFile aFileSize |
	aFileReference := FileReference newTempFilePrefix: self className, '-' suffix: self constants xdocExtension.
	[ 
		aWriter := self writerWithLargeContent.
		aWriter streamingStrategy: (XdStreamingStrategy file: aFileReference).
		self assert: aFileReference exists not.
		aXdWrittenFile := aWriter write.
		self assert: aFileReference exists.
		aFileSize := aFileReference size.
		self reader
			streamingStrategy: (XdStreamingStrategy file: aFileReference);
			read.
		
		"Let's write the smaller file content."
		aWriter := self writerWithSmallContent.
		aWriter streamingStrategy: (XdStreamingStrategy file: aFileReference).
		aXdWrittenFile := aWriter write.
		self assert: aFileReference exists.
		"The newly written file should be smaller"
		self assert: aFileReference size < aFileSize.
		self reader
			streamingStrategy: aXdWrittenFile streamingStrategy;
			read.
	] ensure: [ 
		aFileReference exists ifTrue: [ 
			aFileReference binaryReadStreamDo: [ :aStream | 
				aXdWrittenFile streamingStrategy: (XdStreamingStrategy bytes: aStream contents) ].
			aFileReference ensureDelete ].
	].
		
	^ aXdWrittenFile
]

{ #category : #writing }
XdExamples >> writeTextDocument [
	<gtExample>
	| aWriter aXdFile aMembers |
	aWriter := self writeTextDocumentInProgress.
	aXdFile := aWriter write.
	self assert: aXdFile notNil.
	self assert: aXdFile exists.
	aMembers := aXdFile streamingStrategy zip members.
	self assert: aMembers size equals: 3.
	self assert: aMembers first fileName equals: self textFileName.
	self assert: aMembers first isTextFile.
	self assert: aMembers first gtContents equals: self textFileContent.
	self assert: aMembers second fileName equals: self constants manifestFileName.
	self assert: aMembers second isTextFile.
	self assert: aMembers second gtContents isString.
	self assert: aMembers third fileName equals: self constants versionFileName.
	self assert: aMembers third isTextFile.
	self assert: aMembers third gtContents isString.
	^ aXdFile
]

{ #category : #'writing - in progress' }
XdExamples >> writeTextDocumentInProgress [
	<gtExample>
	| aWriter |
	aWriter := self basicDocumentInProgress.
	aWriter
		text;
		attachment: self textFileName text: self textFileContent.
	self assert: aWriter manifest notNil.
	self assert: aWriter manifest numberOfDocuments equals: 1.
	self
		assert: aWriter manifest documents first type
		equals: XdType text.
	self
		assert: aWriter manifest documents first numberOfComponents
		equals: 1.
	self
		assert: aWriter manifest documents first components first link
		equals: '1'.
	self assert: aWriter manifest numberOfAttachments equals: 1.
	self assert: aWriter manifest attachments first id equals: '1'.
	self
		assert: aWriter manifest attachments first fileName
		equals: self textFileName.
	self
		assert: aWriter manifest attachments first fileSize
		equals: self textFileContent size.
	self assert: aWriter streamingStrategy notNil.
	self assert: aWriter streamingStrategy exists not.
	^ aWriter
]

{ #category : #tools }
XdExamples >> writer [
	<gtExample>
	| aWriter |
	aWriter := XdWriter new.
	self assert: aWriter streamingStrategy isNotNil.
	self assert: aWriter streamingStrategy exists not.
	^ aWriter
]

{ #category : #writing }
XdExamples >> writerWithLargeContent [
	<gtExample>
	^ self inMemoryWriter
		text;
		attachment: 'large-lorem-ipsum.txt' text: (String loremIpsum: 4000)
]

{ #category : #writing }
XdExamples >> writerWithSmallContent [
	<gtExample>
	^ self inMemoryWriter
		text;
		attachment: self textFileName text: self textFileContent
]
