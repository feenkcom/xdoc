Class {
	#name : #XdWriter,
	#superclass : #Object,
	#traits : 'XdManifestJsonMappingTrait + XdConstantsTrait',
	#classTraits : 'XdManifestJsonMappingTrait classTrait + XdConstantsTrait classTrait',
	#instVars : [
		'manifest',
		'zip',
		'idGenerator',
		'streamingStrategy'
	],
	#category : #'XDoc-Core-Writer'
}

{ #category : #writing }
XdWriter >> attachment: aFileNameString text: aContentString [
	| anAttachment aComponent aDocument |
	self 
		assert: [ self manifest documents notEmpty ]
		description: [ 'A document must be defined before adding attachments' ].
	anAttachment := XdAttachment new.
	anAttachment id: idGenerator nextId.
	anAttachment fileName: aFileNameString.
	anAttachment fileSize: aContentString size.
	aComponent := XdComponent new.
	aComponent link: anAttachment id.
	aDocument := self manifest documents last.
	aDocument components: (aDocument components copyWith: aComponent).
	self manifest attachments: (self manifest attachments copyWith: anAttachment).

	"add file"
	zip addString: aContentString utf8Encoded as: aFileNameString
]

{ #category : #writing }
XdWriter >> authorName: aString [
	self manifest author: aString.
]

{ #category : #writing }
XdWriter >> description: aString [
	self manifest description: aString.
]

{ #category : #writing }
XdWriter >> documentType: aXdDocumentType [
	| aDocument |
	self 
		assert: [ aXdDocumentType notNil ]
		description: [ 'Document type must be non-nil' ].
	aDocument := XdDocument new.
	aDocument type: aXdDocumentType.
	self manifest documents: (self manifest documents copyWith: aDocument).
]

{ #category : #initialization }
XdWriter >> initialize [
	super initialize.
	manifest := XdManifest new.
	zip := ZipArchive new.
	idGenerator := XdSequenceNumberGenerator new.
	streamingStrategy := XdStreamingStrategy bytes.
]

{ #category : #accessing }
XdWriter >> json [
	^ XdManifestJsonMapping
]

{ #category : #accessing }
XdWriter >> manifest [
	<return: #XdManifest>
	^ manifest
]

{ #category : #accessing }
XdWriter >> manifest: aXdManifest [
	self 
		assert: [ aXdManifest notNil ] 
		description: [ 'Manifest must be non-nil' ].
	manifest := aXdManifest
]

{ #category : #accessing }
XdWriter >> streamingStrategy: aXdStreamingStrategy [ 
	self 
		assert: [ aXdStreamingStrategy notNil ] 
		description: [ 'Streaming strategy must be non-nil' ].
	streamingStrategy := aXdStreamingStrategy
]

{ #category : #writing }
XdWriter >> text [
	self documentType: XdType text
]

{ #category : #writing }
XdWriter >> title: aString [
	self manifest title: aString.
]

{ #category : #writing }
XdWriter >> write [
	<return: #XdFile>

	streamingStrategy writeStreamDo: [ :aWriteStream | self writeTo: aWriteStream ].
	^ XdFile new
		manifest: self manifest;
		streamingStrategy: streamingStrategy.
]

{ #category : #'private - writing' }
XdWriter >> writeTo: aWriteStream [
	zip 
		addString: (self json writeManifest: self manifest) utf8Encoded
		as: self constants manifestFileName.
	zip writeTo: aWriteStream.
]
