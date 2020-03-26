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
