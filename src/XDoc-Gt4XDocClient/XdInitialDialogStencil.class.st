Class {
	#name : #XdInitialDialogStencil,
	#superclass : #XdShareDialogStencil,
	#instVars : [
		'publishAction',
		'updateAction',
		'deleteAction'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdInitialDialogStencil >> create [
	<return: #BlElement>
	^ self newPage
		addChild: self newPublishButton;
		addChild: self newUpdateButton;
		addChild: self newDeleteButton.
]

{ #category : #accessing }
XdInitialDialogStencil >> deleteAction [
	^ deleteAction
]

{ #category : #accessing }
XdInitialDialogStencil >> deleteAction: anObject [
	deleteAction := anObject
]

{ #category : #initialization }
XdInitialDialogStencil >> initialize [
	super initialize.
	deleteAction := self defaultButtonAction.
	publishAction := self defaultButtonAction.
	updateAction := self defaultButtonAction.
]

{ #category : #'api - instantiation' }
XdInitialDialogStencil >> newButton [
	^ super newButton
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c linear horizontal alignCenter ]
]

{ #category : #'instance creation' }
XdInitialDialogStencil >> newDeleteButton [
	| aButton |
	aButton := self newButton
		label: 'Delete existing document'.
	aButton action: [ self deleteAction cull: aButton ].
	^ aButton
]

{ #category : #'instance creation' }
XdInitialDialogStencil >> newPublishButton [
	| aButton |
	aButton := self newButton
		label: 'Publish new document'.
	aButton action: [ self publishAction cull: aButton ].
	^ aButton
]

{ #category : #'instance creation' }
XdInitialDialogStencil >> newUpdateButton [
	| aButton |
	aButton := self newButton
		label: 'Update existing document'.
	aButton action: [ self updateAction cull: aButton ].
	^ aButton
]

{ #category : #accessing }
XdInitialDialogStencil >> publishAction [
	^ publishAction
]

{ #category : #accessing }
XdInitialDialogStencil >> publishAction: anObject [
	publishAction := anObject
]

{ #category : #accessing }
XdInitialDialogStencil >> updateAction [
	^ updateAction
]

{ #category : #accessing }
XdInitialDialogStencil >> updateAction: anObject [
	updateAction := anObject
]
