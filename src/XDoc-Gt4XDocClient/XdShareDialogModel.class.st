Class {
	#name : #XdShareDialogModel,
	#superclass : #BrWidgetModel,
	#traits : 'TXdShareInformationAccess + TXdShareActionsAccess',
	#classTraits : 'TXdShareInformationAccess classTrait + TXdShareActionsAccess classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #accessing }
XdShareDialogModel >> actions: anObject [
	actions := anObject.
	self notifyActionsChanged.
]

{ #category : #accessing }
XdShareDialogModel >> information: anObject [
	information := anObject.
	self notifyInformationChanged.
]

{ #category : #initialization }
XdShareDialogModel >> initialize [
	super initialize.
	self initializeActions.
	self initializeInformation.
]

{ #category : #initialization }
XdShareDialogModel >> initializeListeners [
	super initializeListeners.

	self 
		when: XdShareInformationRequest 
		reply: [ XdShareInformationChanged new information: self information ].
	self 
		when: XdShareActionsRequest 
		reply: [ XdShareActionsChanged new actions: self actions ].
]

{ #category : #notifying }
XdShareDialogModel >> notifyActionsChanged [
	self dispatchEvent: (XdShareActionsChanged new actions: self actions)
]

{ #category : #notifying }
XdShareDialogModel >> notifyInformationChanged [
	self dispatchEvent: (XdShareInformationChanged new information: self information)
]
