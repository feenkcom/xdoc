Extension { #name : #XdSuccessfullyPublishedAnswer }

{ #category : #'*XDoc-Gt4XDocClient' }
XdSuccessfullyPublishedAnswer >> asElement [
	^ XdSuccessfullyPublishedAnswerStencil new
		answer: self;
		asElement
]
