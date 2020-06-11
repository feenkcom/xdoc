Class {
	#name : #XdWriter,
	#superclass : #XdStreamHolder,
	#traits : 'TXdManifestJsonMapping',
	#classTraits : 'TXdManifestJsonMapping classTrait',
	#instVars : [
		'manifest',
		'zip',
		'idGenerator'
	],
	#category : #'XDoc-Core-Tools - Writer'
}

{ #category : #'private - writing' }
XdWriter >> addComponentWithAttachment: anAttachment [
	| aComponent aDocument |
	aComponent := XdComponent new.
	aComponent link: anAttachment id.
	aDocument := self manifest documents last.
	aDocument components: (aDocument components copyWith: aComponent).
]

{ #category : #'private - writing' }
XdWriter >> addPreviewWithAttachment: anAttachment [
	self
		assert: [ anAttachment isNotNil ]
		description: [ 'Preview attachment must be non-nil' ].
	self documentType: XdPreviewType.
	self addComponentWithAttachment: anAttachment
]

{ #category : #'api - writing' }
XdWriter >> attachment: aRelativeFileName stream: aStream size: aSize [
	| anAttachment |
	self 
		assert: [ self manifest documents notEmpty ]
		description: [ 'A document must be defined before adding attachments' ].
	anAttachment := XdAttachment new.
	anAttachment id: idGenerator nextId.
	anAttachment fileName: aRelativeFileName.
	anAttachment fileSize: aSize.
	self addComponentWithAttachment: anAttachment.
	self manifest attachments: (self manifest attachments copyWith: anAttachment).

	"add file"
	zip gtAddStream: aStream as: aRelativeFileName
]

{ #category : #'api - writing' }
XdWriter >> attachment: aFileNameString text: aContentString [
	| anAttachment aComponent aDocument |
	self 
		assert: [ self manifest documents notEmpty ]
		description: [ 'A document must be defined before adding attachments' ].
	self 
		assert: [ aFileNameString notNil and: [ aFileNameString size isZero not ] ]
		description: [ 'Attachment filename must be non-nil and non-empty' ].	

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
	zip gtAddString: aContentString as: aFileNameString
]

{ #category : #'api - writing' }
XdWriter >> authorName: aString [
	self manifest author: aString.
]

{ #category : #'api - writing' }
XdWriter >> description: aString [
	self manifest description: aString.
]

{ #category : #'api - writing' }
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

{ #category : #'api - writing' }
XdWriter >> preview [
	self 
		previewThat: [ :eachAttachment | 
			| aMimeType | 
			aMimeType := GtFileUtility mimeTypeOfFileName: eachAttachment fileName.
			XdPreviewType matchesMimeType: aMimeType ]
		ifNone: [ "ignore" ]
]

{ #category : #'api - writing' }
XdWriter >> previewThat: aOneArgBlock ifNone: aNoneBlock [
	self manifest attachments
		detect: aOneArgBlock 
		ifFound: [ :anAttachment | 
			self addPreviewWithAttachment: anAttachment ] 
		ifNone: aNoneBlock
]

{ #category : #'api - writing' }
XdWriter >> reuseOrAddAttachment: aRelativeFileName stream: aStream size: aSize [
	self 
		assert: [ self manifest documents notEmpty ]
		description: [ 'A document must be defined before adding attachments' ].
	self manifest attachments 
		detect: [ :eachAttachment | (eachAttachment fileName = aRelativeFileName) and: [ 
				eachAttachment fileSize = aSize ] ]
		ifFound: [ :anAttachment | self addComponentWithAttachment: anAttachment ]
		ifNone: [ 
			self attachment: aRelativeFileName stream: aStream size: aSize.
		]
]

{ #category : #'api - writing' }
XdWriter >> text [
	self documentType: XdType text
]

{ #category : #'api - writing' }
XdWriter >> title: aString [
	self manifest title: aString.
]

{ #category : #'api - writing' }
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
		gtAddString: (self json writeManifest: self manifest)
		as: self constants manifestFileName.
	zip 
		gtAddString: self constants formatVersionString
		as: self constants versionFileName.
	zip writeTo: aWriteStream.
]

{ #category : #'private - accessing' }
XdWriter >> zip [
	<return: #ZipArchive>
	^ zip
]
