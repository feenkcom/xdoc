Extension { #name : #GtSpotterStart }

{ #category : #'*XDoc-Gt4XDocClient' }
GtSpotterStart >> gtSpotterXdocFor: aStep [
	<gtSearch>
	^ aStep listProcessor
		priority: 30;
		title: 'XDoc';
		itemName: [ :aFileInfo | aFileInfo titleAndAuthor ];
		wantsToDisplayOnEmptyQuery: false;
		filter: GtNullFilter
			item: [ :filter :context | 
			(context textTrimmed beginsWith: XdClientSettings xdServerUrlString)
				ifTrue:
					[ XdClient downloadFileInfo: context textTrimmed thenDo: filter ] ];
		actLogic: [ :aFileInfo :step :spotterElement | 
			(XdClient new downloadXDocUsingFileInfo: aFileInfo) 
				gtSpotterActDefault: step 
				from: spotterElement ]
]
