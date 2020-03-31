Extension { #name : #XdProtoClientCommand }

{ #category : #'*XDoc-Gt4XDocClient' }
XdProtoClientCommand >> asBlTktCommand [
	^ BlTktWrapperCommand new command: self
]
