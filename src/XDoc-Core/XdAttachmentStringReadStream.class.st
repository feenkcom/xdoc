Class {
	#name : #XdAttachmentStringReadStream,
	#superclass : #XdAttachmentReadStream,
	#category : #'XDoc-Core-Streaming'
}

{ #category : #streams }
XdAttachmentStringReadStream >> content [
	<return: #String>
	^ self readStreamDo: [ :aStream | aStream contents ]
]

{ #category : #'api - streams' }
XdAttachmentStringReadStream >> readStreamDo: anOneArgBlock [
	| aReference |
	aReference := self streamingStrategy 
		detectReferenceNamed: self fileName
		ifFound: [ :theReference | theReference ]
		ifNone: [ self error: self fileName, ' does not exist' ].
	^ aReference stringStreamDo: [ :aStream |
		anOneArgBlock value: aStream ]
]
