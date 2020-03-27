Extension { #name : #AbstractFileReference }

{ #category : #'*XDoc-Extensions' }
AbstractFileReference >> gtXDFileFor: aView [
	<gtView>
	(self isFile and: [ XdConstants xdocExtension = self extension ]) ifFalse: [ ^ aView empty ].
	^ ((XdFile fromFileReference: self) gtLiveFor: aView)
		title: 'XDoc'
]
