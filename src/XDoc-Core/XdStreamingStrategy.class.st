Class {
	#name : #XdStreamingStrategy,
	#superclass : #Object,
	#traits : 'TGtAssert + XdConstantsTrait + XdManifestJsonMappingTrait',
	#classTraits : 'TGtAssert classTrait + XdConstantsTrait classTrait + XdManifestJsonMappingTrait classTrait',
	#category : #'XDoc-Core-Model'
}

{ #category : #requirements }
XdStreamingStrategy class >> bytes [
	^ XdBytesStreamingStrategy new
]

{ #category : #requirements }
XdStreamingStrategy class >> bytes: aByteArray [
	^ self bytes bytes: aByteArray
]

{ #category : #requirements }
XdStreamingStrategy class >> file [
	^ XdFileStreamingStrategy new
]

{ #category : #requirements }
XdStreamingStrategy class >> file: aFileReference [
	^ self file file: aFileReference.
]

{ #category : #requirements }
XdStreamingStrategy class >> null [
	^ XdNullStreamingStrategy uniqueInstance
]

{ #category : #streams }
XdStreamingStrategy >> binaryReadStreamDo: anOneArgBlock [ 
	^ self readStreamDo: anOneArgBlock
]

{ #category : #accessing }
XdStreamingStrategy >> bytes [
	<return: #ByteArray>
	^ self readStreamDo: [ :aStream | aStream contents ]
]

{ #category : #'file system' }
XdStreamingStrategy >> detectFileReference: aDetectBlock ifFound: aFoundBlock ifNone: aNotFoundBlock [
	<return: #FileReference>
	^ self subclassResponsibility
]

{ #category : #testing }
XdStreamingStrategy >> exists [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #'gt-extension' }
XdStreamingStrategy >> gtFilesFor: aView [
	<gtView>
	self exists ifFalse: [ ^ aView empty ].
	^ aView list
		title: 'Files';
		items: [ self zip members ]
]

{ #category : #accessing }
XdStreamingStrategy >> json [
	^ XdManifestJsonMapping
]

{ #category : #accessing }
XdStreamingStrategy >> memberNamed: aFileName [ 
	<return: #ArchiveMember>
	^ self subclassResponsibility
]

{ #category : #streams }
XdStreamingStrategy >> readStream [
	"Return a binary read stream"
	^ self subclassResponsibility
]

{ #category : #streams }
XdStreamingStrategy >> readStreamDo: aBlock [
	| aStream |
	aStream := self readStream.
	^ [ aBlock value: aStream ]
		ensure: [ aStream close ]
]

{ #category : #accessing }
XdStreamingStrategy >> zip [
	<return: #ZipArchive>
	| aZip |
	aZip := ZipArchive new.
	self readStreamDo: [ :anInput | 
		[ aZip readFrom: anInput contents readStream ] 
			on: Error 
			do: [ :anError | "aZip addString: anError printString as: 'error.txt'" ] ].
	^ aZip
]
