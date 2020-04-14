Extension { #name : #GtDocument }

{ #category : #'*XDoc-Gt4XDocClient' }
GtDocument >> gtXDocPublishActionFor: anAction [
	<gtAction>
	^ anAction dropdown 
		icon: BrGlamorousIcons tocloud;
		forViewDefinedIn: #gtTextFor:;
		priority: 55;
		content: [ 
			| anInformation anActions |
			anInformation := XdShareInformation new.
			anActions := XdShareActions new.
			XdShareDialogElement new  
				look: XdShareDialogLook;
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c |
					c padding: (BlInsets all: 5).
					c vertical exact: 400.
					c horizontal exact: 400 ];
				information: anInformation;
				actions: anActions.
			]
]
