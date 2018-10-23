Class {
	#name : #XdReaderWriterExamples,
	#superclass : #Object,
	#traits : 'XdJsonMappingTrait',
	#classTraits : 'XdJsonMappingTrait classTrait',
	#category : #'XDoc-Core-Examples'
}

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
	self assert: aJsonString equals: '{"title":"","description":"","author":""}'.
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
			'","author":"', self documentAuthorName, '"}'.
	^ aJsonString
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
		assert: aXdFile manifest documents first components first id
		equals: 1.
	self assert: aXdFile manifest attachments size equals: 1.
	self assert: aXdFile manifest attachments first link equals: 1.
	self
		assert: aXdFile manifest attachments first fileName
		equals: self textFileName.
	self
		assert: aXdFile manifest attachments first fileSize
		equals: self textFileContent size.
	self assert: aXdFile reference notNil.
	self assert: aXdFile exists.
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
