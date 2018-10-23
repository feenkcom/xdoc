Class {
	#name : #XdComponent,
	#superclass : #Object,
	#instVars : [
		'link'
	],
	#category : #'XDoc-Core-Model'
}

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
