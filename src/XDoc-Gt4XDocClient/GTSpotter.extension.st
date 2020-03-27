Extension { #name : #GTSpotter }

{ #category : #'*XDoc-Gt4XDocClient' }
GTSpotter >> spotterXdocFor: aStep [
	<spotterOrder: 30>
	^ aStep listProcessor
		title: 'XDoc';
		itemName: [ :aFileInfo | aFileInfo titleAndAuthor ];
		wantsToDisplayOnEmptyQuery: false;
		filter: GTNullFilter item: [ :filter :context | 
			(context textTrimmed beginsWith: XdClientSettings xdServerUrlString)
				ifTrue: [ 
					XdClient downloadFileInfo: context textTrimmed thenDo: filter ] ];
		actLogic: [ :aFileInfo :step |
			step exit.
			(XdClient new downloadXDocUsingFileInfo: aFileInfo) open ]
]
