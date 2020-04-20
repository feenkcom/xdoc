Extension { #name : #XdFileInfo }

{ #category : #'*XDoc-Gt4XDocClient' }
XdFileInfo >> asElement [
	^ XdFileInfoStencil new 
		fileInfo: self;
		asElement
]

{ #category : #'*XDoc-Gt4XDocClient' }
XdFileInfo >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live';
		priority: 1;
		stencil: [ self asElement ]
]
