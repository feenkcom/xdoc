Extension { #name : #XdFile }

{ #category : #'*XDoc-Gt4XDocClient' }
XdFile >> gtLiveFor: aView [
	<gtView>
	self exists ifFalse: [ ^ aView empty ].
	^ aView explicit
		title: 'Live';
		priority: 0;
		stencil: [ self toolInPharo ];
		actionButtonIcon: BrGlamorousIcons open action: [ self openInPharo ]
]
