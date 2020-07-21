Class {
	#name : #XdFile,
	#superclass : #XdProtoFile,
	#traits : 'TXdStreamingStrategyAccesssor',
	#classTraits : 'TXdStreamingStrategyAccesssor classTrait',
	#instVars : [
		'manifest',
		'publicUrl',
		'publicationDate'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #'instance creation' }
XdFile class >> empty [
	^ self new
]

{ #category : #public }
XdFile class >> fromBytes: aByteArray [ 
	<return: #XdFile>
	^ XdReader new
		streamingStrategy: (XdStreamingStrategy bytes: aByteArray);
		read
]

{ #category : #public }
XdFile class >> fromFileReference: aFileReference [ 
	<return: #XdFile>
	^ XdReader new
		streamingStrategy: (XdStreamingStrategy file: aFileReference);
		read
]

{ #category : #factory }
XdFile class >> null [
	^ XdNullFile default
]

{ #category : #'api - manifest' }
XdFile >> author [
	<return: #String>
	^ self manifest author
]

{ #category : #'api - manifest' }
XdFile >> description [
	<return: #String>
	^ self manifest description
]

{ #category : #testing }
XdFile >> exists [
	<return: #Boolean>
	^ self streamingStrategy exists
]

{ #category : #'api - streaming' }
XdFile >> extract [
	"Prepare the document for reading and editing"
	self streamingStrategy open
]

{ #category : #'api - testing' }
XdFile >> hasAuthor [
	<return: #Boolean>
	^ self author isNotNil and: [ self author isNotEmpty ]
]

{ #category : #'api - testing' }
XdFile >> hasDescription [
	<return: #Boolean>
	^ self description isNotNil and: [ self description isNotEmpty ]
]

{ #category : #'api - testing' }
XdFile >> hasPublicUrl [
	<return: #Boolean>
	^ self publicUrl isNotNil
]

{ #category : #'api - testing' }
XdFile >> hasPublicationDate [
	^ self publicationDate isNotNil
]

{ #category : #'api - testing' }
XdFile >> hasTitle [
	<return: #Boolean>
	^ self title isNotNil and: [ self title isNotEmpty ]
]

{ #category : #enumerating }
XdFile >> htmlMembers [
	<return: #Array of: #ArchiveMember>
	| anXdAttachments |
	anXdAttachments := self manifest htmlAttachments.
	^ self streamingStrategy zip members select: [ :eachMember |
		anXdAttachments anySatisfy: [ :eachAttachment | 
			eachAttachment fileName = eachMember fileName ] ]
]

{ #category : #initialization }
XdFile >> initialize [
	super initialize.
	manifest := XdManifest empty.
]

{ #category : #accessing }
XdFile >> mainDocument [
	<return: #XdDocument>
	^ self manifest mainDocument
]

{ #category : #accessing }
XdFile >> mainFileReference [
	<return: #FileReference>
	| aXdDocument theAttachments |
	aXdDocument := self mainDocument.
	theAttachments := self manifest attachmentsForDocument: aXdDocument.
	^ self streamingStrategy 
		detectFileReference: [ :eachFileReference | 
			eachFileReference basename = theAttachments first fileName ]
		ifFound: [ :aFileReference | aFileReference ] 
		ifNone: [ self error: 'File reference must be found' ]
]

{ #category : #accessing }
XdFile >> manifest [
	<return: #XdManifest>
	^ manifest
]

{ #category : #accessing }
XdFile >> manifest: aXdManifest [
	self 
		assert: [ aXdManifest notNil ] 
		description: [ 'Manifest must be non-nil' ].
	manifest := aXdManifest
]

{ #category : #accessing }
XdFile >> memberNamed: aFileName [ 
	<return: #ArchiveMember>
	^ self streamingStrategy memberNamed: aFileName
]

{ #category : #actions }
XdFile >> navigator [
	^ XdNavigator new xdFile: self
]

{ #category : #actions }
XdFile >> open [
	^ self inspect
]

{ #category : #'api - accessing' }
XdFile >> publicUrl [
	^ publicUrl
]

{ #category : #'api - accessing' }
XdFile >> publicUrl: aZnUrl [
	publicUrl := aZnUrl asZnUrl
]

{ #category : #'api - accessing' }
XdFile >> publicationDate [
	^ publicationDate
]

{ #category : #'api - accessing' }
XdFile >> publicationDate: aCreationTime [
	publicationDate := aCreationTime asDateAndTime
]

{ #category : #'api - manifest' }
XdFile >> title [
	<return: #String>
	^ self manifest title
]

{ #category : #accessing }
XdFile >> titleAndAuthor [
	<return: #String>
	| aTitle anAuthor |
	aTitle := self manifest title ifEmpty: [ 'Empty document title' ].
	anAuthor := self manifest author ifEmpty: [ 'unknown author' ].
	^ aTitle, ' by ', anAuthor
]

{ #category : #actions }
XdFile >> writer [
	^ XdWriter new
			streamingStrategy: self streamingStrategy
]
