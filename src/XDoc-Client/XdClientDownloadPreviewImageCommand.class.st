Class {
	#name : 'XdClientDownloadPreviewImageCommand',
	#superclass : 'XdClientCommand',
	#instVars : [
		'fileInfo'
	],
	#category : 'XDoc-Client-Commands'
}

{ #category : 'execution' }
XdClientDownloadPreviewImageCommand >> execute [
	| aPreviewForm |

	aPreviewForm := Form extent: 0@0.
	self previewUrlDo: [ :anImageUrl |
		
		anImageUrl asUrl retrieveContents ifNotNil: [ :aByteArray |
			aPreviewForm := Form fromBinaryStream: aByteArray readStream ] ].

	^ aPreviewForm
]

{ #category : 'accessing' }
XdClientDownloadPreviewImageCommand >> fileInfo [
	^ fileInfo
]

{ #category : 'accessing' }
XdClientDownloadPreviewImageCommand >> fileInfo: aXdFileInfo [
	fileInfo := aXdFileInfo
]

{ #category : 'enumerating' }
XdClientDownloadPreviewImageCommand >> previewUrlDo: aBlock [
	"Evaluate aBlock with a preview image file name if preview exists in an XDoc document"

	self fileInfo manifest documents
		detect: [ :eachDocument | eachDocument type = XdPreviewType and: [ eachDocument components isNotEmpty ] ]
		ifFound: [ :aPreviewDocument |
			| anAttachmentId |
			anAttachmentId := aPreviewDocument components anyOne link.
			self fileInfo manifest attachments
				detect: [ :eachAttachment | eachAttachment id = anAttachmentId ]
				ifFound: [ :aPreviewAttachment |
					| aPreviewURL |
					
					aPreviewURL := self client serverUrl 
						/ XdConstants cdnPathSegments 
						/ self fileInfo pathSegment
						/ XdConstants previewDirectoryName
						/ aPreviewAttachment fileName.
					
					aBlock value: aPreviewURL ] ]
]
