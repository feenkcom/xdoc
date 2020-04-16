Extension { #name : #XdAuthenticationRequiredAnswer }

{ #category : #'*XDoc-Gt4XDocClient' }
XdAuthenticationRequiredAnswer >> asElement [
	^ XdShareAuthenticationRequieredAnswerStencil new 
		answer: self;
		asElement
]
