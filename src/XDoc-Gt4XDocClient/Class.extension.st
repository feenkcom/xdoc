Extension { #name : #Class }

{ #category : #'*XDoc-Gt4XDocClient' }
Class >> gtXDocPublishActionFor: anAction [
	<gtAction>
	^ anAction dropdown 
		icon: BrGlamorousIcons tocloud;
		forViewDefinedIn: #gtDocumentFor:;
		priority: 55;
		content: [ 
			| anInformation anActions |
			anInformation := XdShareInformation new.
			anActions := XdShareActions new.
			anActions 
				publishAction: [ (GtDocument forClass: self) publishXDocWithInformation: anInformation ];
				updateAction: [ (GtDocument forClass: self) updateXDocWithInformation: anInformation ];
				deleteAction: [ (GtDocument forClass: self) deleteXDocWithInformation: anInformation ].
			XdShareDialogElement new  
				look: XdShareDialogLook;
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c |
					c padding: (BlInsets all: 5).
					c vertical exact: 400.
					c horizontal exact: 400 ];
				information: anInformation;
				actions: anActions.
			].
]
