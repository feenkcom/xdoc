Class {
	#name : #XdAsyncConfiguration,
	#superclass : #Object,
	#category : #'XDoc-Gt4XDocClient-Client'
}

{ #category : #configuration }
XdAsyncConfiguration class >> defaultFutureConfiguration [
	^ AsyncFutureExecutionConfiguration new customGroup: #XDoc
]
