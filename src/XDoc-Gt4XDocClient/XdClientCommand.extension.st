Extension { #name : #XdClientCommand }

{ #category : #'*XDoc-Gt4XDocClient' }
XdClientCommand >> asBlTktCommand [
	^ BlTktWrapperCommand new command: self
]
