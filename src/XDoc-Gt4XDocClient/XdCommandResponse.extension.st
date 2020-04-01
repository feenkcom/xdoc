Extension { #name : #XdCommandResponse }

{ #category : #'*XDoc-Gt4XDocClient' }
XdCommandResponse >> gtViewsInContext: aContext [
	| anArray |
	anArray := Array streamContents: [ :aStream | 
		aStream nextPutAll: (super gtViewsInContext: aContext).
		self hasResponse ifTrue: [
			| aResponseViews | 
			aResponseViews := GtPhlowViewsCollector new
				fromObject: self response response;
				to: ZnMessage;
				context: aContext;
				collect.
			aStream nextPutAll: aResponseViews ] ].
	GtPhlowViewsCollector sortByPriority: anArray.
	^ anArray.
]
