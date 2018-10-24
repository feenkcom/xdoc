Trait {
	#name : #XdBasicJsonMappingTrait,
	#category : #'XDoc-Core-Json'
}

{ #category : #'api - json reading/writing' }
XdBasicJsonMappingTrait classSide >> read: jsonSchema withMapping: messageSymbol from: aReadStream [ 
	"Read a JSON string using the JSON schema and return an object.
	The messageSymbol variable is a message to configure mapping between JSON and objects."
	<return: #Object>
	| reader |
	reader := (NeoJSONReader on: aReadStream).
	self perform: messageSymbol with: reader.
	^ reader nextAs: jsonSchema
]

{ #category : #'api - json reading/writing' }
XdBasicJsonMappingTrait classSide >> write: anObject as: schema mappedTo: mappingSymbol [
	"Return a JSON string representation of anOobject."
	^ self write: anObject as: schema mappedTo: mappingSymbol prettyPrint: false
]

{ #category : #'api - json reading/writing' }
XdBasicJsonMappingTrait classSide >> write: anObject as: schema mappedTo: mappingSymbol prettyPrint: aBoolean [
	"Return a JSON string representation of anOobject."
	<return: #String>
	^ String streamContents: [ :stream | | writer |
		writer := (NeoJSONWriter on: stream)
			prettyPrint: aBoolean;
			yourself.
		self perform: mappingSymbol with: writer.
		writer nextPut: anObject as: schema ].
]

{ #category : #'api - json reading/writing' }
XdBasicJsonMappingTrait classSide >> write: anObject mappedTo: mappingSymbol [ 
	"Return a JSON string representation of anObject."
	<return: #String>
	^ self write: anObject mappedTo: mappingSymbol prettyPrint: false
]

{ #category : #'api - json reading/writing' }
XdBasicJsonMappingTrait classSide >> write: anObject mappedTo: mappingSymbol prettyPrint: aBoolean [
	"Return a JSON string representation of anobject."
	<return: #String>
	^ String streamContents: [ :stream | | writer |
		writer := (NeoJSONWriter on: stream)
			prettyPrint: aBoolean;
			yourself.
		self perform: mappingSymbol with: writer.
		writer nextPut: anObject ].
]
