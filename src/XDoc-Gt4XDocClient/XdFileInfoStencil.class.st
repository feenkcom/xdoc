Class {
	#name : #XdFileInfoStencil,
	#superclass : #BrStencil,
	#instVars : [
		'fileInfo'
	],
	#category : #'XDoc-Gt4XDocClient-Other Stencils'
}

{ #category : #'api - instantiation' }
XdFileInfoStencil >> create [
	<return: #Object>
	^ BrAsyncWidget new
		layout: BlFrameLayout new;
		background: BlBackground transparent;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		stencil: [ self newToolOrEmptyElement ]
]

{ #category : #accessing }
XdFileInfoStencil >> fileInfo [
	<return: #XdFileInfo>
	^ fileInfo
]

{ #category : #accessing }
XdFileInfoStencil >> fileInfo: anXdFileInfo [
	fileInfo := anXdFileInfo
]

{ #category : #'instance creation' }
XdFileInfoStencil >> newEmptyElement [
	<return: #BlElement>
	^ BrFrame new 
		matchParent;
		addChild: self newEmptyLabel
]

{ #category : #'instance creation' }
XdFileInfoStencil >> newEmptyLabel [
	<return: #BlElement>
	^ BrLabel new 
		aptitude: BrGlamorousLabelAptitude;
		text: self newEmptyLabelText;
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignCenter ]
]

{ #category : #'instance creation' }
XdFileInfoStencil >> newEmptyLabelText [
	<return: #BlRunRopedText>
	^ 'No content' asRopedText foreground: BrGlamorousColors disabledButtonTextColor
]

{ #category : #'instance creation' }
XdFileInfoStencil >> newToolOrEmptyElement [
	<return: #BlElement>
	| anXDoc |
	anXDoc := self fileInfo xdoc.
	anXDoc ifNil: [ ^ self newEmptyElement ].
	^ anXDoc asDocumenter
]
