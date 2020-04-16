Class {
	#name : #XdShareResponseDialogStencil,
	#superclass : #XdShareInputFieldsDialogStencil,
	#instVars : [
		'response'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #testing }
XdShareResponseDialogStencil class >> isAbstract [ 
	^ self name = #XdShareResponseDialogStencil 
]

{ #category : #accessing }
XdShareResponseDialogStencil class >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ] 
		description: [ 'Zinc response must be non-nil' ].
	aZnResponse isSuccess ifTrue: [ ^ XdShareSuccessResponseDialogStencil new response: aZnResponse ].
	aZnResponse isError ifTrue: [ ^ XdShareFailureResponseDialogStencil new response: aZnResponse ].
	self error: 'unknown response'
]

{ #category : #defaults }
XdShareResponseDialogStencil >> defaultResponse [
	^ XdZincResponse null
]

{ #category : #initialization }
XdShareResponseDialogStencil >> initialize [
	super initialize.
	response := self defaultResponse.
]

{ #category : #'instance creation' }
XdShareResponseDialogStencil >> newStatusInputField [
	^ self newReadOnlyInputField 
		text: self responseStatusLineMessage
]

{ #category : #'instance creation' }
XdShareResponseDialogStencil >> newStatusLabel [
	^ self newLabel
		text: 'Status:'
]

{ #category : #accessing }
XdShareResponseDialogStencil >> response [
	<return: #ZnResponse>
	^ response
]

{ #category : #accessing }
XdShareResponseDialogStencil >> response: aZnResponse [
	self 
		assert: [ aZnResponse isNotNil ] 
		description: [ 'Zinc response must be non-nil' ].
	response := aZnResponse
]

{ #category : #accessing }
XdShareResponseDialogStencil >> responseStatusLineMessage [
	^ self response statusLineMessage
]
