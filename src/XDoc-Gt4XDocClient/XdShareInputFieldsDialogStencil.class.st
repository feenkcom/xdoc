Class {
	#name : #XdShareInputFieldsDialogStencil,
	#superclass : #XdShareDialogWithNextActionStencil,
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #testing }
XdShareInputFieldsDialogStencil class >> isAbstract [ 
	^ self name = #XdShareInputFieldsDialogStencil  
]

{ #category : #streams }
XdShareInputFieldsDialogStencil >> labelsAndInputFieldsOn: aStream [
	self subclassResponsibility
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newFields [
	^ BlElement new 
		layout: (BlGridLayout new columnCount: 2);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChildren: self newLabelsAndInputFields.
]

{ #category : #'instance creation' }
XdShareInputFieldsDialogStencil >> newLabelsAndInputFields [
	^ Array
		streamContents:
			[ :aStream | self labelsAndInputFieldsOn: aStream ]
]
