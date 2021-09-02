Extension { #name : 'XdSequenceNumberGenerator' }

{ #category : '*XDoc-Extensions' }
XdSequenceNumberGenerator >> gtSequenceExampleFor: aView [
	<gtView>
	self currentId ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Sequence Examples';
		priority: 1;
		object: [ | aCopy | 
			aCopy := self copy. 
			20 timesCollect: [ aCopy nextId ] ];
		view: #gtItemsFor:
]
