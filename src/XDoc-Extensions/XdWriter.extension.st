Extension { #name : #XdWriter }

{ #category : #'*XDoc-Extensions' }
XdWriter >> gtManifestFor: aView [
	<gtView>
	self manifest ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Manifest';
		priority: 1;
		object: [ self manifest ];
		view: #gtContentFor:
]

{ #category : #'*XDoc-Extensions' }
XdWriter >> gtMembersFor: aView [
	<gtView>
	self manifest ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'ZIP members';
		priority: 2;
		object: [ self zip ];
		view: #gtMembersFor:
]
