Extension { #name : #TXdNavigatorAllStepsExtension }

{ #category : #'*XDoc-Extensions' }
TXdNavigatorAllStepsExtension >> gtStepsFor: aView [
	<gtView>
	self nextStep ifNil: [ ^ aView empty ].
	^ aView columnedList 
		title: 'Steps';
		items: [ self allSteps ];
		column: 'Name' text: #name
]
