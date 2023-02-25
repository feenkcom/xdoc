Extension { #name : #XdFileStreamingStrategy }

{ #category : #'*XDoc-Extensions' }
XdFileStreamingStrategy >> gtExtractedTreeFor: aView [
	<gtView>
	self exists ifFalse: [ ^ aView empty ].

	^ aView forward
		title: 'Extracted';
		object: [ self
				open;
				extracted ];
		view: #gtTreeFor:;
		actionButtonIcon: BrGlamorousIcons spawn
			label: 'HTML'
			tooltip: 'Open index.html in a web browser'
			action: [ :aButton | aButton spawnObject: (WebBrowser openOn: self extracted fullPath) ]
]
