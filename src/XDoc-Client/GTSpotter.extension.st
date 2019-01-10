Extension { #name : #GTSpotter }

{ #category : #'*XDoc-Client' }
GTSpotter >> spotterXdocFor: aStep [
	<spotterOrder: 30>
	^ aStep listProcessor
		title: 'XDoc';
		itemName: [ :anXdFile | anXdFile titleAndAuthor ];
		wantsToDisplayOnEmptyQuery: false;
		filter: GTNullFilter item: [ :filter :context | 
			(context textTrimmed beginsWith: XdClientSettings xdServerUrlString)
				ifTrue: [ 
					XdClient download: context textTrimmed thenDo: filter ] ];
		actLogic: [ :anXdFile :step |
			step exit.
			anXdFile inspect ]
]
