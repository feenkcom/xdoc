Extension { #name : #XdDocument }

{ #category : #'*XDoc-Extensions' }
XdDocument >> gtComponentsFor: aView [
	<gtView>
	^ aView list
		title: 'Components';
		priority: 1;
		items: [ self components asOrderedCollection ];
		itemFormat: [ :eachComponent | 
			'Link to attachment id: ', eachComponent link asString ]
]

{ #category : #'*XDoc-Extensions' }
XdDocument >> openXdFileInPharo: aXdFile [ 
	^ self type openDocument: self ofXdFileInPharo: aXdFile
]

{ #category : #'*XDoc-Extensions' }
XdDocument >> toolForXdFileInPharo: aXdFile [ 
	^ self type toolForDocument: self ofXdFileInPharo: aXdFile
]
