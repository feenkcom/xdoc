Class {
	#name : #XdSuccessfullyPublishedResponse,
	#superclass : #XdSuccessfulResponse,
	#category : #'XDoc-Client-Responses'
}

{ #category : #'as yet unclassified' }
XdSuccessfullyPublishedResponse >> gtPublicUrlFor: aView [
	<gtView>
	self command ifNil: [ ^ aView empty ].
	^ aView textEditor
		title: 'Public URL';
		priority: 1;
		glamorousCodeFontAndSize;
		text: [ self command publicUrl ];
		actionButtonIcon: BrGlamorousIcons clipboard 
			action: [ :aButton | 
				self command publicUrlToClipboard ]
]
