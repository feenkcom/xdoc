Extension { #name : #XdStreamingStrategy }

{ #category : #'*XDoc-Extensions' }
XdStreamingStrategy >> gtExtractedTreeFor: aView [
	<gtView>
	^ aView empty
]

{ #category : #'*XDoc-Extensions' }
XdStreamingStrategy >> gtFilesFor: aView [
	<gtView>
	self exists ifFalse: [ ^ aView empty ].
	^ aView list
		title: 'Files';
		items: [ self zip members ]
]
