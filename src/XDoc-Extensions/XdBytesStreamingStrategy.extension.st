Extension { #name : #XdBytesStreamingStrategy }

{ #category : #'*XDoc-Extensions' }
XdBytesStreamingStrategy >> gtExtractedTreeFor: aView [
	<gtView>
	self exists ifFalse: [ ^ aView empty ].

	^ aView forward
		title: 'Extracted files';
		object: [ self
				open;
				extracted ];
		view: #gtTreeFor:;
		actionButtonIcon: BrGlamorousVectorIcons spawn
			label: 'Directory'
			tooltip: 'Open the root directory in a file browser'
			action: [ :aButton | WebBrowser openOn: self extracted asZnUrl ];
		actionButtonIcon: BrGlamorousVectorIcons spawn
			label: 'HTML'
			tooltip: 'Open index.html in a web browser'
			action: [ :aButton | 
				(self extracted / 'index.html') exists
					ifTrue: [ WebBrowser openOn: (self extracted / 'index.html') asZnUrl ]
					ifFalse: [ WebBrowser openOn: self extracted asZnUrl ] ]
]
