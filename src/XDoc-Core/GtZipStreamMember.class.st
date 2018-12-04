Class {
	#name : #GtZipStreamMember,
	#superclass : #ZipArchiveMember,
	#instVars : [
		'stream'
	],
	#category : #'XDoc-Core-Writer'
}

{ #category : #'instance creation' }
GtZipStreamMember class >> newFrom: aStream named: aFileName [
	^(self new) from: aStream; localFileName: aFileName; yourself
]

{ #category : #'instance creation' }
GtZipStreamMember class >> newFromStream: aReadStream [
	^ self new from: aReadStream; yourself.
]

{ #category : #'instance creation' }
GtZipStreamMember >> from: aReadStream [
	stream := aReadStream.
	compressedSize := uncompressedSize := stream size.
	desiredCompressionMethod := compressedSize > 0 ifTrue: [ CompressionDeflated ] ifFalse: [ CompressionStored ].
]

{ #category : #private }
GtZipStreamMember >> readRawChunk: n [
	^ stream next: n
]

{ #category : #private }
GtZipStreamMember >> rewindData [
	super rewindData.
	readDataRemaining := stream size.
	stream position: 0.
]
