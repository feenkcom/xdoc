Extension { #name : #XdFailureAnswer }

{ #category : #'*XDoc-Gt4XDocClient' }
XdFailureAnswer >> asElement [
	<return: #BlElement>
	^ XdFailureAnswerStencil new 
		answer: self;
		asElement
]
