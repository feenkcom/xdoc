Class {
	#name : #XdSuccessfullyUpdatedAnswerStencil,
	#superclass : #XdSuccessfullyPublishedAnswerStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'instance creation' }
XdSuccessfullyUpdatedAnswerStencil >> newPublishedTitle [
	^ self newTitleLabel
		text: 'Successfully Updated'
]

{ #category : #'instance creation' }
XdSuccessfullyUpdatedAnswerStencil >> newUrlLabel [
	^ self newLabel
		text: 'Updated at:'
]
