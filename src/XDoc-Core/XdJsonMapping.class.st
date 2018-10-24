Class {
	#name : #XdJsonMapping,
	#superclass : #Object,
	#classVars : [
		'OldXdAttachment'
	],
	#category : #'XDoc-Core-Json'
}

{ #category : #mapping }
XdJsonMapping class >> attachmentMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdAttachment do: [ :mapping |
	      mapping mapAccessor: #id.
	      mapping mapAccessor: #fileName to: #filename.
	      mapping mapAccessor: #fileSize to: #size.].
]

{ #category : #'mapping - document' }
XdJsonMapping class >> collectionOfAttachmentsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfAttachments customDo: [ :mapping |
			mapping listOfElementSchema: XdAttachment ].
	self attachmentMappingFor: aNeoJSONMapper.
]

{ #category : #mapping }
XdJsonMapping class >> collectionOfComponentsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfComponents customDo: [ :mapping |
			mapping listOfElementSchema: XdComponent ].
	self componentMappingFor: aNeoJSONMapper.

]

{ #category : #'mapping - document' }
XdJsonMapping class >> collectionOfDocumentsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfDocuments customDo: [ :mapping |
			mapping listOfElementSchema: XdDocument ].
	self documentMappingFor: aNeoJSONMapper.
]

{ #category : #mapping }
XdJsonMapping class >> componentMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdComponent do: [ :mapping |
	      mapping mapAccessor: #id.].
]

{ #category : #'mapping - document' }
XdJsonMapping class >> documentMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdDocument do: [ :mapping |
	      (mapping mapAccessor: #type) valueSchema: #DocumentType.
	      (mapping mapAccessor: #components) valueSchema: #CollectionOfComponents.].
	self
		documentTypeMappingFor: aNeoJSONMapper; 
		collectionOfComponentsMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - document' }
XdJsonMapping class >> documentTypeMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #DocumentType customDo: [ :mapping |
			mapping 
				encoder: [ :aXdDocumentType | aXdDocumentType typeString ];
				decoder: [ :aStringOrNil | 
					aStringOrNil ifNotNil: [ :aString | XdDocumentType typeFromString: aString ] ] ].
]

{ #category : #mapping }
XdJsonMapping class >> manifestMappingFor: aNeoJSONMapper [
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
XdJsonMapping class >> read: aJsonSchema withMapping: aMessageSymbol on: aReadStream [ 
	"Read a JSON string using json schema and return an object.
	The messageSymbol variable is a message to configure mapping between JSON and objects."
	| reader |
	reader := (NeoJSONReader on: aReadStream).
	self perform: aMessageSymbol with: reader.
	^ reader nextAs: aJsonSchema
]

{ #category : #reading }
XdJsonMapping class >> readManifest: aJsonManifest [
	^ self read: XdManifest withMapping: #manifestMappingFor: on: aJsonManifest readStream
]

{ #category : #writing }
XdJsonMapping class >> write: aXdObject mappedTo: mappingSymbol [ 
	"Return a JSON string representation of the XD object."
	<return: #String>
	^ self write: aXdObject mappedTo: mappingSymbol prettyPrint: false
]

{ #category : #writing }
XdJsonMapping class >> write: aXdObject mappedTo: aMappingSymbol prettyPrint: aBoolean [
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
XdJsonMapping class >> writeManifest: aXdManifest [
	^ self write: aXdManifest mappedTo: #manifestMappingFor:
]
