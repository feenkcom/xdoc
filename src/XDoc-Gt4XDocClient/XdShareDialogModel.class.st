Class {
	#name : #XdShareDialogModel,
	#superclass : #BrWidgetModel,
	#traits : 'TXdShareInformationAccess',
	#classTraits : 'TXdShareInformationAccess classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #accessing }
XdShareDialogModel >> information: anObject [
	information := anObject.
	self notifyInformationChanged.
]

{ #category : #initialization }
XdShareDialogModel >> initializeListeners [
	super initializeListeners.

	self 
		when: XdShareInformationRequest 
		reply: [ XdShareInformationChanged new information: self information ].
]

{ #category : #notifying }
XdShareDialogModel >> notifyInformationChanged [
	self dispatchEvent: (XdShareInformationChanged new information: self information)
]
