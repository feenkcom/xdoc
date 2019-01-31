Class {
	#name : #XdReaderWriterExamples,
	#superclass : #Object,
	#traits : 'XdManifestJsonMappingTrait + XdConstantsTrait',
	#classTraits : 'XdManifestJsonMappingTrait classTrait + XdConstantsTrait classTrait',
	#category : #'XDoc-Core-Examples'
}

{ #category : #'basic objects' }
XdReaderWriterExamples >> attachment [  
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

{ #category : #accessing }
XdReaderWriterExamples >> bytes [
	<gtExample>
	^ #[ 1 2 3 4 ]
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> bytesStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := XdStreamingStrategy bytes.
	self assert: aReference bytes isNil.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> document [  
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
XdReaderWriterExamples >> documentAuthorName [
	<gtExample>
	^ 'Alison Fernandez'
]

{ #category : #accessing }
XdReaderWriterExamples >> documentDescription [
	<gtExample>
	^ 'Description of a document'
]

{ #category : #accessing }
XdReaderWriterExamples >> documentTitle [
	<gtExample>
	^ 'Title of a document'
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> emptyAttachment [  
	<gtExample>
	
	| anAttachment |

	anAttachment := XdAttachment new.
	self assert: anAttachment id isNil.
	self assert: anAttachment fileName isNil.
	self assert: anAttachment fileSize equals: 0.
	^ anAttachment.
	
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> emptyComponent [  
	<gtExample>
	
	| aComponent |

	aComponent := XdComponent new.
	self assert: aComponent link isNil.
	^ aComponent.
	
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> emptyDocument [ 
	<gtExample>
	
	| aDocument |

	aDocument := XdDocument new.
	self assert: aDocument type equals: XdUndefinedType.
	self assert: aDocument components isEmpty.
	^ aDocument.
	
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> emptyFile [
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
XdReaderWriterExamples >> emptyManifest [
	<gtExample>
	| aManifest |
	aManifest := XdManifest new.
	self assert: aManifest title equals: ''.
	self assert: aManifest description equals: ''.
	self assert: aManifest author equals: ''.
	^ aManifest
]

{ #category : #'json mapping' }
XdReaderWriterExamples >> emptyManifestJsonString [
	<gtExample>
	| aJsonString |
	aJsonString := self json writeManifest: self emptyManifest.
	self assert: aJsonString 
		equals: '{"title":"","description":"","author":"","attachments":[],"documents":[]}'.
	^ aJsonString
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> existingBytesStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := self bytesStreamingStrategy.
	aReference bytes: self bytes.
	self assert: aReference bytes equals: self bytes.
	self assert: aReference exists.
	^ aReference
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> existingFileStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := self fileStreamingStrategy.
	aReference file: self fileLocator.
	self assert: aReference file equals: self fileLocator.
	self assert: aReference exists.
	^ aReference
]

{ #category : #'reader / writer' }
XdReaderWriterExamples >> file [
	<gtExample>
	| aFile |
	aFile := XdFile new.
	self assert: aFile manifest notNil.
	self assert: aFile streamingStrategy notNil.
	^ aFile
]

{ #category : #accessing }
XdReaderWriterExamples >> fileLocator [
	<gtExample>
	^ FileLocator image
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> fileStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := XdStreamingStrategy file.
	self assert: aReference file isNil.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #'reader / writer' }
XdReaderWriterExamples >> inMemoryWriter [
	<gtExample>
	| aWriter |
	aWriter := self writer.
	aWriter streamingStrategy: XdStreamingStrategy bytes.
	self assert: aWriter streamingStrategy notNil.
	^ aWriter
]

{ #category : #accessing }
XdReaderWriterExamples >> json [
	^ XdManifestJsonMapping
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> manifest [
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
XdReaderWriterExamples >> manifestJsonString [
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
XdReaderWriterExamples >> manifestJsonWithOneAttachmentString [
	<gtExample>
	| aJsonString |
	aJsonString := self json writeManifest: self manifestWithOneAttachment.
	self 
		assert: aJsonString 
		equals: '{"title":"', self documentTitle, 
			'","description":"', self documentDescription,
			'","author":"', self documentAuthorName,
			'","attachments":[{"id":12,"filename":"', self textFileName, '","size":42,"is_primary":false}],',
			'"documents":[{"type":"undefined","components":[]}]}'.
	^ aJsonString
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> manifestWithOneAttachment [
	<gtExample>
	| aManifest |
	aManifest := self manifest.
	aManifest documents: { self emptyDocument }.
	aManifest attachments: { self attachment }.
	^ aManifest
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> nullStreamingStrategy [
	<gtExample>
	| aReference |
	aReference := XdStreamingStrategy null.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #reading }
XdReaderWriterExamples >> readBasicDocument [
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
XdReaderWriterExamples >> readBrokenFile [
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
XdReaderWriterExamples >> readBrokenFileAndRaiseErrorByDefault [
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
XdReaderWriterExamples >> readTextDocument [
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

{ #category : #'reader / writer' }
XdReaderWriterExamples >> reader [
	<gtExample>
	| aReader |
	aReader := XdReader new.
	"some assertions here"
	^ aReader
]

{ #category : #accessing }
XdReaderWriterExamples >> textFileContent [
	<gtExample>
	^ 'UNICODE příliš žluťoučký kůň úpěl ďábelské ódy'
]

{ #category : #accessing }
XdReaderWriterExamples >> textFileName [
	<gtExample>
	^ 'text-document.txt'
]

{ #category : #writing }
XdReaderWriterExamples >> writeBasicDocument [
	<gtExample>
	| aWriter aXdFile |
	aWriter := self writer.
	aXdFile := aWriter
		title: self documentTitle;
		description: self documentDescription;
		authorName: self documentAuthorName;
		write.
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
XdReaderWriterExamples >> writeTextDocument [
	<gtExample>
	| aWriter aXdFile aMembers |
	aWriter := self writer.
	aXdFile := aWriter
		text;
		attachment: self textFileName text: self textFileContent;
		write.
	self assert: aXdFile notNil.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest documents size equals: 1.
	self
		assert: aXdFile manifest documents first type
		equals: XdType text.
	self
		assert: aXdFile manifest documents first components size
		equals: 1.
	self
		assert: aXdFile manifest documents first components first link
		equals: '1'.
	self assert: aXdFile manifest attachments size equals: 1.
	self assert: aXdFile manifest attachments first id equals: '1'.
	self
		assert: aXdFile manifest attachments first fileName
		equals: self textFileName.
	self
		assert: aXdFile manifest attachments first fileSize
		equals: self textFileContent size.
	self assert: aXdFile streamingStrategy notNil.
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

{ #category : #'reader / writer' }
XdReaderWriterExamples >> writer [
	<gtExample>
	| aWriter |
	aWriter := XdWriter new.
	"some assertions here"
	^ aWriter
]
