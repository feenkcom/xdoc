Class {
	#name : #XdManifestJsonMapping,
	#superclass : #Object,
	#traits : 'XdBasicJsonMappingTrait',
	#classTraits : 'XdBasicJsonMappingTrait classTrait',
	#category : #'XDoc-Core-Json'
}

{ #category : #mapping }
XdManifestJsonMapping class >> attachmentMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdAttachment do: [ :mapping |
	      mapping mapAccessor: #id.
	      mapping mapAccessor: #fileName to: #filename.
	      mapping mapAccessor: #fileSize to: #size.].
]

{ #category : #'mapping - document' }
XdManifestJsonMapping class >> collectionOfAttachmentsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfAttachments customDo: [ :mapping |
			mapping listOfElementSchema: XdAttachment ].
	self attachmentMappingFor: aNeoJSONMapper.
]

{ #category : #mapping }
XdManifestJsonMapping class >> collectionOfComponentsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfComponents customDo: [ :mapping |
			mapping listOfElementSchema: XdComponent ].
	self componentMappingFor: aNeoJSONMapper.

]

{ #category : #'mapping - document' }
XdManifestJsonMapping class >> collectionOfDocumentsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfDocuments customDo: [ :mapping |
			mapping listOfElementSchema: XdDocument ].
	self documentMappingFor: aNeoJSONMapper.
]

{ #category : #mapping }
XdManifestJsonMapping class >> collectionOfFileInfoMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfFileInfo customDo: [ :mapping |
			mapping listOfElementSchema: XdFileInfo ].
	self fileInfoMappingFor: aNeoJSONMapper.

]

{ #category : #mapping }
XdManifestJsonMapping class >> componentMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdComponent do: [ :mapping |
	      mapping mapAccessor: #link.].
]

{ #category : #'mapping - document' }
XdManifestJsonMapping class >> documentMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdDocument do: [ :mapping |
	      (mapping mapAccessor: #type) valueSchema: #DocumentType.
	      (mapping mapAccessor: #components) valueSchema: #CollectionOfComponents.].
	self
		documentTypeMappingFor: aNeoJSONMapper; 
		collectionOfComponentsMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - document' }
XdManifestJsonMapping class >> documentTypeMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #DocumentType customDo: [ :mapping |
			mapping 
				encoder: [ :anXdType | anXdType typeString ];
				decoder: [ :aStringOrNil | 
					aStringOrNil ifNotNil: [ :aString | XdType typeFromString: aString ] ] ].
]

{ #category : #mapping }
XdManifestJsonMapping class >> fileInfoMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdFileInfo do: [ :mapping |
	      mapping mapAccessor: #pathSegment.
			mapping mapAccessor: #fileName. 
			(mapping mapAccessor: #manifest) valueSchema: XdManifest.
			].
	self manifestMappingFor: aNeoJSONMapper.
]

{ #category : #mapping }
XdManifestJsonMapping class >> manifestMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdManifest do: [ :mapping |
	      mapping mapAccessor: #title.
	      mapping mapAccessor: #description.
			mapping mapAccessor: #author. 
			(mapping mapAccessor: #attachments) valueSchema: #CollectionOfAttachments.
			(mapping mapAccessor: #documents) valueSchema: #CollectionOfDocuments.
			].
	self collectionOfAttachmentsMappingFor: aNeoJSONMapper.	
	self collectionOfDocumentsMappingFor: aNeoJSONMapper.	

]

{ #category : #reading }
XdManifestJsonMapping class >> read: aJsonSchema withMapping: aMessageSymbol on: aReadStream [ 
	"Read a JSON string using json schema and return an object.
	The messageSymbol variable is a message to configure mapping between JSON and objects."
	| reader |
	reader := (NeoJSONReader on: aReadStream).
	self perform: aMessageSymbol with: reader.
	^ reader nextAs: aJsonSchema
]

{ #category : #reading }
XdManifestJsonMapping class >> readFileInfo: aJsonFileInfo [
	^ self read: XdFileInfo withMapping: #fileInfoMappingFor: on: aJsonFileInfo readStream
]

{ #category : #reading }
XdManifestJsonMapping class >> readFileInfos: aJsonCollectionOfFileInfo [
	^ self 
		read: #CollectionOfFileInfo 
		withMapping: #collectionOfFileInfoMappingFor: 
		on: aJsonCollectionOfFileInfo readStream
]

{ #category : #reading }
XdManifestJsonMapping class >> readManifest: aJsonManifest [
	^ self read: XdManifest withMapping: #manifestMappingFor: on: aJsonManifest readStream
]

{ #category : #writing }
XdManifestJsonMapping class >> write: aXdObject mappedTo: mappingSymbol [ 
	"Return a JSON string representation of the XD object."
	<return: #String>
	^ self write: aXdObject mappedTo: mappingSymbol prettyPrint: false
]

{ #category : #writing }
XdManifestJsonMapping class >> write: aXdObject mappedTo: aMappingSymbol prettyPrint: aBoolean [
	"Return a JSON string representation of the XD object."
	<return: #String>
	^ String streamContents: [ :aStream | | aJsonWriter |
		aJsonWriter := (NeoJSONWriter on: aStream)
			prettyPrint: aBoolean;
			yourself.
		self perform: aMappingSymbol with: aJsonWriter.
		aJsonWriter nextPut: aXdObject ].
]

{ #category : #writing }
XdManifestJsonMapping class >> writeFileInfo: aXdFileInfo [
	^ self write: aXdFileInfo mappedTo: #fileInfoMappingFor:
]

{ #category : #writing }
XdManifestJsonMapping class >> writeFileInfos: aCollectionOfXdFileInfo [
	^ self 
		write: aCollectionOfXdFileInfo 
		as: #CollectionOfFileInfo 
		mappedTo: #collectionOfFileInfoMappingFor:
]

{ #category : #writing }
XdManifestJsonMapping class >> writeManifest: aXdManifest [
	^ self write: aXdManifest mappedTo: #manifestMappingFor:
]
