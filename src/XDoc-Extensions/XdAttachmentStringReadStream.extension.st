Extension { #name : #XdAttachmentStringReadStream }

{ #category : #'*XDoc-Extensions' }
XdAttachmentStringReadStream >> gtContentFor: aView [
	<gtView>
	self streamingStrategy ifNil: [ ^ aView empty ].
	^ aView textEditor
		title: 'Content';
		look: BrGlamorousRegularEditorLook;
		text: [ self content ]
]
