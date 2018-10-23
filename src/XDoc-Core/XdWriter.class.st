Class {
	#name : #XdWriter,
	#superclass : #Object,
	#traits : 'XdJsonMappingTrait + XdConstantsTrait',
	#classTraits : 'XdJsonMappingTrait classTrait + XdConstantsTrait classTrait',
	#instVars : [
		'manifest'
	],
	#category : #'XDoc-Core-Writer'
}

{ #category : #writing }
XdWriter >> authorName: aString [
	self manifest author: aString.
]

{ #category : #writing }
XdWriter >> description: aString [
	self manifest description: aString.
]

{ #category : #initialization }
XdWriter >> initialize [
	super initialize.
	manifest := XdManifest new.
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

{ #category : #writing }
XdWriter >> title: aString [
	self manifest title: aString.
]

{ #category : #writing }
XdWriter >> write [
	<return: #XdFile>
	| aWriteStream |
	aWriteStream := WriteStream on: ByteArray streamSpecies new.
	[ self writeTo: aWriteStream ]
		ensure: [ aWriteStream close ].
	^ XdFile new
		manifest: self manifest;
		reference: (XdReference bytes: aWriteStream contents)
]

{ #category : #'private - writing' }
XdWriter >> writeTo: aWriteStream [
	| aZip |
	aZip := ZipArchive new.
	aZip 
		addString: (self json writeManifest: self manifest) utf8Encoded
		as: self constants manifestFileName.
	"self document attachments do: [ :eachAttachment | 
		self writeAttachment: eachAttachment to: aZip ]."
	aZip writeTo: aWriteStream.
]
