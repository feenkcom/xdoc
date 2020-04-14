Class {
	#name : #XdClientWithResponseCommand,
	#superclass : #XdClientCommand,
	#traits : 'TXdClientResponseInstance',
	#classTraits : 'TXdClientResponseInstance classTrait',
	#category : #'XDoc-Client-Commands'
}

{ #category : #testing }
XdClientWithResponseCommand class >> isAbstract [ 
	^ self name = #XdClientWithResponseCommand
]
