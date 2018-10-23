Class {
	#name : #XdReference,
	#superclass : #Object,
	#traits : 'GtAssertingTrait + XdConstantsTrait + XdJsonMappingTrait',
	#classTraits : 'GtAssertingTrait classTrait + XdConstantsTrait classTrait + XdJsonMappingTrait classTrait',
	#category : #'XDoc-Core-Model'
}

{ #category : #requirements }
XdReference class >> bytes [
	^ XdBytesReference new
]

{ #category : #requirements }
XdReference class >> bytes: aByteArray [
	^ self bytes bytes: aByteArray
]

{ #category : #requirements }
XdReference class >> empty [
	^ XdEmptyReference uniqueInstance
]

{ #category : #requirements }
XdReference class >> file [
	^ XdFileReference new
]

{ #category : #testing }
XdReference >> exists [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #'gt-extension' }
XdReference >> gtFilesFor: aView [
	<gtView>
	self exists ifFalse: [ ^ aView empty ].
	^ aView list
		title: 'Files';
		items: [ self zip members ]
]

{ #category : #streams }
XdReference >> readStream [
	"Return a binary read stream"
	^ self subclassResponsibility
]

{ #category : #streams }
XdReference >> readStreamDo: aBlock [
	| aStream |
	aStream := self readStream.
	^ [ aBlock value: aStream ]
		ensure: [ aStream close ]
]

{ #category : #accessing }
XdReference >> zip [
	<return: #ZipArchive>
	| aZip |
	aZip := ZipArchive new.
	self readStreamDo: [ :anInput | 
		[ aZip readFrom: anInput ] 
			on: Error 
			do: [ :anError | "aZip addString: anError printString as: 'error.txt'" ] ].
	^ aZip
]
