Class {
	#name : #XdPlayBookJsonMapping,
	#superclass : #Object,
	#traits : 'XdBasicJsonMappingTrait',
	#classTraits : 'XdBasicJsonMappingTrait classTrait',
	#category : #'XDoc-Core-Json'
}

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> codeSnippet: aCodeSnippetClass mappingFor: aNeoJSONMapper [
	self 
		codeSnippet: aCodeSnippetClass 
		property: #source_code 
		mappingFor: aNeoJSONMapper
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> codeSnippet: aCodeSnippetClass property: aSymbol mappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: aCodeSnippetClass do: [ :mapping |
	      (mapping mapAccessor: #sourceCode to: aSymbol) ].
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> collectionOfPagesMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfPages customDo: [ :mapping |
	      mapping listOfElementSchema: GtPlayPage ].
	self playPageMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> collectionOfSnippetsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfSnippets customDo: [ :mapping |
	      mapping reader: [ :jsonReader |
				jsonReader listClass streamContents: [ :stream |
					jsonReader parseListDo: [ | element |
						element := jsonReader nextAs: #SnippetTypeAndValue.
						stream nextPut: element ] ] ].
			mapping writer: [ :jsonWriter :list | 
		jsonWriter writeListStreamingDo: [ :listWriter |
			list do: [ :each | 
				each isUserSnippet ifTrue: [
					listWriter writeElement: each as: #SnippetTypeAndValue ] ] ] ] ].
	self snippetTypeNameAndValueMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> pharoSnippetMappingFor: aNeoJSONMapper [
	self 
		codeSnippet: GtPharoSnippet 
		mappingFor: aNeoJSONMapper
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> playBookMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: GtPlayBook do: [ :mapping |
			(mapping
				mapProperty: #pages 
				getter: [ :aPlayBook | aPlayBook xdocPagesToPersist ]
				setter: [ :aPlayBook :thePages | aPlayBook pages: thePages ]) 
					valueSchema: #CollectionOfPages ].
	self collectionOfPagesMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> playPageMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: GtPlayPage do: [ :mapping |
	      (mapping mapAccessor: #snippets) valueSchema: #CollectionOfSnippets ].
	self collectionOfSnippetsMappingFor: aNeoJSONMapper.
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> readPharoSnippet: aJsonString [
	^ self 
		read: GtPharoSnippet 
		withMapping: #pharoSnippetMappingFor: 
		from: aJsonString readStream
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> readPlayBook: aJsonString [
	^ self 
		read: GtPlayBook
		withMapping: #playBookMappingFor: 
		from: aJsonString readStream
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> readPlayPage: aJsonString [
	^ self 
		read: GtPlayPage 
		withMapping: #playPageMappingFor: 
		from: aJsonString readStream
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> readUrlSnippet: aJsonString [
	^ self 
		read: GtUrlSnippet 
		withMapping: #urlSnippetMappingFor: 
		from: aJsonString readStream
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> snippetTypeNameAndValueMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #SnippetTypeAndValue customDo: [ :mapping |
	      mapping reader: [ :jsonReader | | aGtSnippet | 
					jsonReader parseMapKeysDo: [ :aKey | | anElementSchema |
						anElementSchema := GtSnippet availableSnippetClasses 
							detect: [ :each | each typeName = aKey ].
						self assert: anElementSchema isUserSnippet.
						self assert: aGtSnippet isNil.
						aGtSnippet := jsonReader nextAs: anElementSchema ].
					aGtSnippet ].
			mapping writer: [ :jsonWriter :object | 
				object class isUserSnippet ifTrue: [ 
					jsonWriter writeMapStreamingDo: [ :mapWriter | 
						mapWriter writeKey: object typeName value: object ] ] ] ].
	GtSnippet availableSnippetClasses do: [ :eachSnippetClass | 
		| aMessage |
		aMessage := eachSnippetClass name.
		(aMessage beginsWith: 'Gt') ifTrue: [ aMessage := aMessage allButFirst: 2 ].
		aMessage at: 1 put: (aMessage first asLowercase).
		aMessage := aMessage, 'MappingFor:'.
		self perform: aMessage asSymbol with: aNeoJSONMapper ]
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> urlSnippetMappingFor: aNeoJSONMapper [
	self 
		codeSnippet: GtUrlSnippet 
		property: #url
		mappingFor: aNeoJSONMapper.
	aNeoJSONMapper
		for: GtUrlSnippet do: [ :mapping |
	      (mapping mapAccessor: #responseVariableName to: #variable) ].
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> writePharoSnippet: aGtPharoSnippet [
	^ self 
		write: aGtPharoSnippet 
		mappedTo: #pharoSnippetMappingFor:
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> writePlayBook: aGtPlayBook [
	^ self 
		write: aGtPlayBook 
		mappedTo: #playBookMappingFor:
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> writePlayPage: aGtPlayPage [
	^ self 
		write: aGtPlayPage 
		mappedTo: #playPageMappingFor:
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> writeUrlSnippet: aGtUrlSnippet [
	^ self 
		write: aGtUrlSnippet 
		mappedTo: #urlSnippetMappingFor:
]
