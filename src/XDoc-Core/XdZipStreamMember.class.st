Class {
	#name : #XdZipStreamMember,
	#superclass : #ZipArchiveMember,
	#instVars : [
		'stream'
	],
	#category : #'XDoc-Core-Writer'
}

{ #category : #'instance creation' }
XdZipStreamMember class >> newFrom: aStream named: aFileName [
	^(self new) from: aStream; localFileName: aFileName; yourself
]

{ #category : #'instance creation' }
XdZipStreamMember class >> newFromStream: aReadStream [
	^ self new from: aReadStream; yourself.
]

{ #category : #'instance creation' }
XdZipStreamMember >> from: aReadStream [
	stream := aReadStream.
	compressedSize := uncompressedSize := stream size.
	desiredCompressionMethod := compressedSize > 0 ifTrue: [ CompressionDeflated ] ifFalse: [ CompressionStored ].
]

{ #category : #private }
XdZipStreamMember >> readRawChunk: n [
	^ stream next: n
]

{ #category : #private }
XdZipStreamMember >> rewindData [
	super rewindData.
	readDataRemaining := stream size.
	stream position: 0.
]
