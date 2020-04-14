Class {
	#name : #XdInitialDialogPageStencil,
	#superclass : #XdShareDialogStencil,
	#instVars : [
		'publishAction',
		'updateAction',
		'deleteAction'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - UI'
}

{ #category : #'api - instantiation' }
XdInitialDialogPageStencil >> create [
	<return: #BlElement>
	^ self newPage
		addChild: self newPublishButton;
		addChild: self newUpdateButton;
		addChild: self newDeleteButton.
]

{ #category : #accessing }
XdInitialDialogPageStencil >> deleteAction [
	^ deleteAction
]

{ #category : #accessing }
XdInitialDialogPageStencil >> deleteAction: anObject [
	deleteAction := anObject
]

{ #category : #initialization }
XdInitialDialogPageStencil >> initialize [
	super initialize.
	deleteAction := self defaultButtonAction.
	publishAction := self defaultButtonAction.
	updateAction := self defaultButtonAction.
]

{ #category : #'api - instantiation' }
XdInitialDialogPageStencil >> newButton [
	^ super newButton
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c linear horizontal alignCenter ]
]

{ #category : #'instance creation' }
XdInitialDialogPageStencil >> newDeleteButton [
	| aButton |
	aButton := self newButton
		label: 'Delete existing document'.
	aButton action: [ self deleteAction cull: aButton ].
	^ aButton
]

{ #category : #'instance creation' }
XdInitialDialogPageStencil >> newPublishButton [
	| aButton |
	aButton := self newButton
		label: 'Publish new document'.
	aButton action: [ self publishAction cull: aButton ].
	^ aButton
]

{ #category : #'instance creation' }
XdInitialDialogPageStencil >> newUpdateButton [
	| aButton |
	aButton := self newButton
		label: 'Update existing document'.
	aButton action: [ self updateAction cull: aButton ].
	^ aButton
]

{ #category : #accessing }
XdInitialDialogPageStencil >> publishAction [
	^ publishAction
]

{ #category : #accessing }
XdInitialDialogPageStencil >> publishAction: anObject [
	publishAction := anObject
]

{ #category : #accessing }
XdInitialDialogPageStencil >> updateAction [
	^ updateAction
]

{ #category : #accessing }
XdInitialDialogPageStencil >> updateAction: anObject [
	updateAction := anObject
]
