Class {
	#name : #XdStreamingStrategy,
	#superclass : #Object,
	#traits : 'TGtAssert + TXdConstants + TXdManifestJsonMapping',
	#classTraits : 'TGtAssert classTrait + TXdConstants classTrait + TXdManifestJsonMapping classTrait',
	#category : #'XDoc-Core-Streaming'
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

{ #category : #'api - streams' }
XdStreamingStrategy >> binaryReadStreamDo: aBlock [
	"Iterate over a binary read stream"
	^ self readStreamDo: aBlock
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

{ #category : #'api - streams' }
XdStreamingStrategy >> detectReferenceNamed: aFileName ifFound: aFoundBlock ifNone: aNotFoundBlock [
	<return: #XdReadStreamReference>
	^ self subclassResponsibility
]

{ #category : #testing }
XdStreamingStrategy >> exists [
	<return: #Boolean>
	^ self subclassResponsibility
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

{ #category : #'api - streams' }
XdStreamingStrategy >> readStreamDo: aBlock [
	"Iterate over a binary read stream"
	^ self subclassResponsibility
]

{ #category : #'api - streams' }
XdStreamingStrategy >> writeStreamDo: aBlock [
	"Iterate over a binary write stream"
	self subclassResponsibility
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
