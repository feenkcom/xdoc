Extension { #name : #XdSuccessfullyUpdatedAnswer }

{ #category : #'*XDoc-Gt4XDocClient' }
XdSuccessfullyUpdatedAnswer >> asElement [
	^ XdSuccessfullyUpdatedAnswerStencil new
		answer: self;
		asElement
]
