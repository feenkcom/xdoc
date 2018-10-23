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
