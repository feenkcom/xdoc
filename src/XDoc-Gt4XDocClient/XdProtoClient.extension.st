Extension { #name : #XdProtoClient }

{ #category : #'*XDoc-Gt4XDocClient' }
XdProtoClient >> async [
	<return: #XdAsyncClient>
	^ XdAsyncClient new client: self
]
