Extension { #name : #XdExceptionAnswer }

{ #category : #'*XDoc-Gt4XDocClient' }
XdExceptionAnswer >> asElement [
	<return: #BlElement>
	^ XdExceptionAnswerStencil new 
		answer: self;
		asElement
]
