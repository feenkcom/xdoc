Extension { #name : 'AbstractFileReference' }

{ #category : '*XDoc-Extensions' }
AbstractFileReference >> gtXDFileFor: aView [
	<gtView>
	(self isFile and: [ XdConstants xdocExtension = self extension ]) ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'XDoc';
		priority: 0;
		object: [ XdFile fromFileReference: self ];
		view: #gtLiveFor:
]
