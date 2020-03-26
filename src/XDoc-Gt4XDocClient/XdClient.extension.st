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
