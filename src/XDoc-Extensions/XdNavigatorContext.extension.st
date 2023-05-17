Extension { #name : #XdNavigatorContext }

{ #category : #'*XDoc-Extensions' }
XdNavigatorContext >> gtStepsFor: aView [
	<gtView>
	self navigator ifNil: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Steps and results';
		items: [ self allStepsAndResults ];
		column: 'Step' text: [ :anAssoc | anAssoc key name ];
		column: 'Result' text: #value;
		send: #value
]
