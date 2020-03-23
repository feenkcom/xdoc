Class {
	#name : #XdNavigatorComponentAttachmentStep,
	#superclass : #XdNavigatorStep,
	#category : #'XDoc-Core-Tools - Navigator'
}

{ #category : #'private - finding' }
XdNavigatorComponentAttachmentStep >> findHereUsingContext: anXdNavigatorContext [ 
	| aComponent aResult |
	aComponent := anXdNavigatorContext result.
	aResult := anXdNavigatorContext manifest attachments 
		detect: [ :eachAttachment | eachAttachment id = aComponent link ] 
		ifFound: [ :anAttachment | anAttachment ] 
		ifNone: [ XdAttachment empty ].
	anXdNavigatorContext result: aResult.
]
