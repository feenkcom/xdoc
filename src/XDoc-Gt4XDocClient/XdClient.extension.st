Extension { #name : #XdClient }

{ #category : #'*XDoc-Gt4XDocClient' }
XdClient >> gtDocumentsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Documents';
		stencil: [ 
			XdDocumentsElement new 
				look: XdGlamorousDocumentsGridLook;
				client: self ]
]

{ #category : #'*XDoc-Gt4XDocClient' }
XdClient >> openFileReference: aFileReference [
	aFileReference exists ifFalse: [ ^ self ].
	XdClientOpenXDocCommand new 
		client: self;
		fileReference: aFileReference;
		execute
]

{ #category : #'*XDoc-Gt4XDocClient' }
XdClient >> taskIt [
	self decoratingCommand: XdTaskItCommand new
]
