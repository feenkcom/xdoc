Class {
	#name : #XdNullClient,
	#superclass : #XdProtoClient,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'XDoc-Client-Core'
}

{ #category : #accessing }
XdNullClient >> documents [
	^ #()
]
