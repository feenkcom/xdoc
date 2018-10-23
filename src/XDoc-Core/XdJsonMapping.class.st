Class {
	#name : #XdJsonMapping,
	#superclass : #Object,
	#category : #'XDoc-Core-Json'
}

{ #category : #mapping }
XdJsonMapping class >> manifestMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: XdManifest do: [ :mapping |
	      mapping mapAccessor: #title.
	      mapping mapAccessor: #description.
			mapping mapAccessor: #author ].
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
