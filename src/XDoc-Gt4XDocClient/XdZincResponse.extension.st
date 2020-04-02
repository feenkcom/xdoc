Extension { #name : #XdZincResponse }

{ #category : #'*XDoc-Gt4XDocClient' }
XdZincResponse >> gtViewsInContext: aContext [
	^ OrderedCollection streamContents: [ :aStream | 
		| aZnResponseViews |
		aZnResponseViews := GtPhlowViewsCollector new
			fromObject: self response;
			justBelowTheObject;
			context: aContext;
			collect.
		aStream nextPutAll: aZnResponseViews.
		aStream nextPutAll: (super gtViewsInContext: aContext). ]
]
