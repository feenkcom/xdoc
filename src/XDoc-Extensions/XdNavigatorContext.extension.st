Extension { #name : #XdNavigatorContext }

{ #category : #'*XDoc-Extensions' }
XdNavigatorContext >> gtStepsFor: aView [
	<gtView>
	self navigator ifNil: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Steps and Results';
		items: [ self allStepsAndResults ];
		column: 'Step' item: [ :anAssoc | anAssoc key name ];
		column: 'Result' item: #value;
		send: #value
]
