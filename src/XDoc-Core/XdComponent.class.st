Class {
	#name : #XdComponent,
	#superclass : #XdModel,
	#instVars : [
		'link'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #requirements }
XdComponent class >> empty [
	^ XdEmptyComponent default
]

{ #category : #accessing }
XdComponent >> link [
	<return: #String>
	^ link
]

{ #category : #accessing }
XdComponent >> link: aString [
	self
		assert: [ aString notNil ]
		description: [ 'Component link id must be non-nil' ].
	link := aString
]
