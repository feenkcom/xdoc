Class {
	#name : #XdReaderWriterExamples,
	#superclass : #Object,
	#traits : 'XdManifestJsonMappingTrait',
	#classTraits : 'XdManifestJsonMappingTrait classTrait',
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
XdReaderWriterExamples >> bytesReference [
	<gtExample>
	| aReference |
	aReference := XdReference bytes.
	self assert: aReference bytes isNil.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> document [  
	<gtExample>
	
	| aDocument |

	aDocument := self emptyDocument.
	aDocument type: XdTextType.
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
XdReaderWriterExamples >> emptyReference [
	<gtExample>
	| aReference |
	aReference := XdReference empty.
	self assert: aReference exists not.
	^ aReference
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> existingBytesReference [
	<gtExample>
	| aReference |
	aReference := self bytesReference.
	aReference bytes: self bytes.
	self assert: aReference bytes equals: self bytes.
	self assert: aReference exists.
	^ aReference
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> existingFileReference [
	<gtExample>
	| aReference |
	aReference := self fileReference.
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
	self assert: aFile reference notNil.
	^ aFile
]

{ #category : #accessing }
XdReaderWriterExamples >> fileLocator [
	<gtExample>
	^ FileLocator image
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> fileReference [
	<gtExample>
	| aReference |
	aReference := XdReference file.
	self assert: aReference file isNil.
	self assert: aReference exists not.
	^ aReference
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
			'","attachments":[{"id":12,"filename":"', self textFileName, '","size":42}],',
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

{ #category : #playbook }
XdReaderWriterExamples >> playbook [
	<gtExample>
	
	| aPlaybook |
	aPlaybook := GtPlayBook newDefault.
	aPlaybook pages first snippets first sourceCode: '1+2'.
	^ aPlaybook.
]

{ #category : #playbook }
XdReaderWriterExamples >> playbookFileReference [
	<gtExample>
	
	^ FileLocator workingDirectory / 'playbook.xdoc'.
]

{ #category : #reading }
XdReaderWriterExamples >> readBasicDocument [
	<gtExample>
	| aWrittenXdFile aReader aXdReadFile |
	aWrittenXdFile := self writeBasicDocument.
	aReader := self reader.
	aXdReadFile := aReader
		reference: aWrittenXdFile reference;
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
	self assert: aXdReadFile reference notNil.
	self assert: aXdReadFile exists.
	^ aXdReadFile
]

{ #category : #reading }
XdReaderWriterExamples >> readTextDocument [
	<gtExample>
	| aWrittenXdFile aReader aXdReadFile aZip aTextFile |
	aWrittenXdFile := self writeTextDocument.
	aReader := self reader.
	aXdReadFile := aReader
		reference: aWrittenXdFile reference;
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
	self assert: aXdReadFile reference notNil.
	self assert: aXdReadFile exists.
	aZip := aXdReadFile reference zip.
	self assert: aZip members size equals: 2.
	aTextFile := aZip members detect: [ :eachMember | 
		eachMember fileName = self textFileName ].
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
	self assert: aXdFile reference notNil.
	self assert: aXdFile exists.
	^ aXdFile
]

{ #category : #writing }
XdReaderWriterExamples >> writePlaybookDocument [

	<gtExample>
	| aWriter aXdFile |
	aWriter := self writer.
	aXdFile := aWriter
		reference: XdReference bytes;
		playbook: self playbook;
		write.
	self assert: aXdFile notNil.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest documents size equals: 1.
	self
		assert: aXdFile manifest documents first type
		equals: XdType playbook.
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
		equals: 'main.playbook'.
	self
		assert: aXdFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdFile reference notNil.
	self assert: aXdFile exists.
	self assert: aXdFile reference zip members size equals: 2.
	^ aXdFile
]

{ #category : #writing }
XdReaderWriterExamples >> writePlaybookDocumentToFile [

	<gtExample>
	| aWriter aXdFile |
	aWriter := self writer.
	aXdFile := aWriter
		reference: ( XdReference file: self playbookFileReference );
		playbook: self playbook;
		write.
	self assert: aXdFile notNil.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest documents size equals: 1.
	self
		assert: aXdFile manifest documents first type
		equals: XdType playbook.
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
		equals: 'main.playbook'.
	self
		assert: aXdFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdFile reference notNil.
	self assert: aXdFile exists.
	self assert: aXdFile reference zip members size equals: 2.
	^ aXdFile
]

{ #category : #writing }
XdReaderWriterExamples >> writeTextDocument [
	<gtExample>
	| aWriter aXdFile |
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
	self assert: aXdFile reference notNil.
	self assert: aXdFile exists.
	self assert: aXdFile reference zip members size equals: 2.
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
