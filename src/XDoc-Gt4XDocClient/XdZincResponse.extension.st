Extension { #name : #XdZincResponse }

{ #category : #'*XDoc-Gt4XDocClient' }
XdZincResponse >> gtViewsInContext: aContext [
	^ Array streamContents: [ :aStream | 
		| aZnResponseViews |
		aZnResponseViews := GtPhlowViewsCollector new
			fromObject: self response;
			to: ZnMessage;
			context: aContext;
			collect.
		aStream nextPutAll: aZnResponseViews.
		aStream nextPutAll: (super gtViewsInContext: aContext). ]
]
