Class {
	#name : #XdShareDialogElement,
	#superclass : #BlElement,
	#instVars : [
		'dialogModel',
		'pager'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - UI'
}

{ #category : #accessing }
XdShareDialogElement >> information [
	<return: #XdShareInformation>
	^ self viewModel information
]

{ #category : #accessing }
XdShareDialogElement >> information: anInformation [
	self viewModel information: anInformation
]

{ #category : #initialization }
XdShareDialogElement >> initialize [
	super initialize.
	self viewModel: (dialogModel := XdShareDialogModel new).
]
