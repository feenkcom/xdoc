Extension { #name : #XdSuccessfullyDeletedAnswer }

{ #category : #'*XDoc-Gt4XDocClient' }
XdSuccessfullyDeletedAnswer >> asElement [
	^ XdSuccessfullyDeletedAnswerStencil new
		answer: self;
		asElement
]
