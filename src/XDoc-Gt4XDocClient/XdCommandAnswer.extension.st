Extension { #name : #XdCommandAnswer }

{ #category : #'*XDoc-Gt4XDocClient' }
XdCommandAnswer >> gtViewsInContext: aContext [
	| aCollection |
	aCollection := OrderedCollection streamContents: [ :aStream | 
		aStream nextPutAll: (super gtViewsInContext: aContext).
		self hasResponse ifTrue: [
			| aResponseViews | 
			aResponseViews := GtPhlowViewsCollector new
				fromObject: self response rawResponse;
				justBelowTheObject;
				context: aContext;
				collect.
			aStream nextPutAll: aResponseViews ] ].
	GtPhlowViewsCollector sortByPriority: aCollection.
	^ aCollection.
]
