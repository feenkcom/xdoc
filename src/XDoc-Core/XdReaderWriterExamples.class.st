Class {
	#name : #XdReaderWriterExamples,
	#superclass : #Object,
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
	aReference := XdBytesReference new.
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
	aReference file: self file.
	self assert: aReference file equals: self file.
	self assert: aReference exists.
	^ aReference
]

{ #category : #accessing }
XdReaderWriterExamples >> file [
	<gtExample>
	^ FileLocator image
]

{ #category : #'basic objects' }
XdReaderWriterExamples >> fileReference [
	<gtExample>
	| aReference |
	aReference := XdFileReference new.
	self assert: aReference file isNil.
	self assert: aReference exists not.
	^ aReference
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
	"^^^ manifest was document before, I think manifest is better name"
	self assert: aXdReadFile manifest title equals: self documentTitle.
	self
		assert: aXdReadFile manifest description
		equals: self documentDescription.
	self
		assert: aXdReadFile manifest authorName
		equals: self documentAuthorName.
	self assert: aXdReadFile fileReference notNil.
	"^^^ maybe we want also in-memory bytes (instead of disk files)
	then it could be called aXdFile reference (this could be XdFileReference or XdBytesReference)"
	self assert: aXdReadFile exists.
	"^^^ means reference (file or bytes) exists, it should be delegated to the Xd... 
	if we follow this idea"
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
	"^^^ manifest was document before, I think manifest is better name"
	self assert: aXdFile manifest title equals: self documentTitle.
	self
		assert: aXdFile manifest description
		equals: self documentDescription.
	self
		assert: aXdFile manifest authorName
		equals: self documentAuthorName.
	self assert: aXdFile fileReference notNil.
	"^^^ maybe we want also in-memory bytes (instead of disk files)
	then it could be called aXdFile reference (this could be XdFileReference or XdBytesReference)"
	self assert: aXdFile exists.
	"^^^ means reference (file or bytes) exists, it should be delegated to the Xd... 
	if we follow this idea"
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
