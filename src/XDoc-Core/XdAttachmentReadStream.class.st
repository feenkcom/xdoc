Class {
	#name : #XdAttachmentReadStream,
	#superclass : #XdObject,
	#traits : 'TXdStreamingStrategyAccesssor',
	#classTraits : 'TXdStreamingStrategyAccesssor classTrait',
	#instVars : [
		'attachment'
	],
	#category : #'XDoc-Core-Streaming'
}

{ #category : #accessing }
XdAttachmentReadStream >> attachment [
	<return: #XdAttachment>
	^ attachment
]

{ #category : #accessing }
XdAttachmentReadStream >> attachment: anXdAttachment [
	self 
		assert: [ anXdAttachment isNotNil ] 
		description: [ 'Attachment must be non-nil' ].
	attachment := anXdAttachment
]

{ #category : #'accessing - attachment' }
XdAttachmentReadStream >> fileName [
	<return: #String>
	^ self attachment fileName
]

{ #category : #initialization }
XdAttachmentReadStream >> initialize [
	super initialize.
	attachment := XdAttachment empty.
]

{ #category : #enumerating }
XdAttachmentReadStream >> readStreamDo: anOneArgBlock [
	^ self subclassResponsibility 
]
