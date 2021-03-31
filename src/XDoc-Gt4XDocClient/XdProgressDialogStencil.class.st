Class {
	#name : #XdProgressDialogStencil,
	#superclass : #XdShareDialogStencil,
	#instVars : [
		'title'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdProgressDialogStencil >> create [
	<return: #BlElement>
	^ self newPage
		addChild: self newTitleLabel";
		addChild: self newSubtitleLabel".
]

{ #category : #initialization }
XdProgressDialogStencil >> defaultTitle [
	^ 'Processing...'
]

{ #category : #initialization }
XdProgressDialogStencil >> initialize [
	super initialize.
	title := self defaultTitle.
]

{ #category : #'instance creation' }
XdProgressDialogStencil >> newSubtitleLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new glamorousRegularFontAndSize; foreground: Color gray);
		text: 'waiting...';
		focusability: BlFocusability none;
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c linear horizontal alignCenter ]
]

{ #category : #'instance creation' }
XdProgressDialogStencil >> newTitleLabel [
	^ BrLabel new
		aptitude: (BrGlamorousLabelAptitude new glamorousRegularFont; fontSize: 24);
		text: self title;
		focusability: BlFocusability none;
		margin: (BlInsets all: 5);
		constraintsDo: [ :c | 
			c linear horizontal alignCenter ]
]

{ #category : #accessing }
XdProgressDialogStencil >> title [
	^ title
]

{ #category : #accessing }
XdProgressDialogStencil >> title: anObject [
	title := anObject
]
