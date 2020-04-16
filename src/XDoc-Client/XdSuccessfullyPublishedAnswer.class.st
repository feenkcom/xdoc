Class {
	#name : #XdSuccessfullyPublishedAnswer,
	#superclass : #XdSuccessfullyCreatedAnswer,
	#category : #'XDoc-Client-Answers'
}

{ #category : #'gt-extension' }
XdSuccessfullyPublishedAnswer >> gtPublicUrlFor: aView [
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

{ #category : #accessing }
XdSuccessfullyPublishedAnswer >> publicUrl [
	<return: #ZnUrl>
	^ self command publicUrl
]
