Class {
	#name : #XdPlayBookPublisher,
	#superclass : #XdPublisher,
	#traits : 'OldXdPlayBookJsonMappingTrait',
	#classTraits : 'OldXdPlayBookJsonMappingTrait classTrait',
	#category : #'XDoc-Core-Publisher'
}

{ #category : #'api - actions' }
XdPlayBookPublisher >> prepare [
	super prepare.
	self preparePlayBook.
	self prepareHtml.
]

{ #category : #'api - actions' }
XdPlayBookPublisher >> prepareHtml [
	XdPlayBookToHtmlWriter new publisher: self; write.
]

{ #category : #'api - actions' }
XdPlayBookPublisher >> preparePlayBook [
	| aWriter aPlayBookFileReference aXdFile |

	aWriter := XdWriter new.
	aPlayBookFileReference := (FileSystem disk workingDirectory / 'ioana') ensureCreateFile.
	aXdFile := aWriter
		streamingStrategy: (XdStreamingStrategy file: aPlayBookFileReference);
		playbook: self info book;
		write.

	"aJsonString := self playBookJsonMapper writePlayBook: self info book.
	postBuilder
		playBook;
		attachmentNamed: 'main.' , GtFilePlayBookTypeResolver mainExtension text: aJsonString"
]

{ #category : #'api - actions' }
XdPlayBookPublisher >> publish [
	^ publishedDocument := self postBuilder publish
]
