Class {
	#name : #XdShareDialogExamples,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Examples'
}

{ #category : #'examples - actions' }
XdShareDialogExamples >> actions [
	<gtExample>
	| anActions |
	anActions := self basicActions.
	anActions publishAction: [ results add: #publishAction ].
	anActions deleteAction: [ results add: #deleteAction ].
	anActions updateAction: [ results add: #updateAction ].
	self assert: anActions publishAction isNotNil.
	self assert: anActions deleteAction isNotNil.
	self assert: anActions updateAction isNotNil.
	^ anActions
]

{ #category : #asserting }
XdShareDialogExamples >> assertDialog: aDialog withInformation: anInformation [
	self assert: aDialog information equals: anInformation.
	self assert: aDialog viewModel information equals: anInformation.
	self
		assert: aDialog viewModel information
		equals: aDialog viewModel information
]

{ #category : #'examples - information' }
XdShareDialogExamples >> assertPartValue: aRealValue with: anExpectedValue [
	self 
		assert: aRealValue asString 
		equals: anExpectedValue asString.
]

{ #category : #'examples - actions' }
XdShareDialogExamples >> basicActions [
	<gtExample>
	| anActions |
	anActions := XdShareActions new.
	^ anActions
]

{ #category : #'examples - dialog' }
XdShareDialogExamples >> basicDialog [
	<gtExample>
	| aDialog |
	aDialog := XdShareDialogElement new.
	self assert: aDialog viewModel isNotNil.
	self assert: aDialog look isNil.
	^ aDialog
]

{ #category : #'examples - information' }
XdShareDialogExamples >> basicInformation [
	<gtExample>
	| anInformation |
	anInformation := XdShareInformation new.
	self assert: anInformation hasParts not.
	anInformation partsDo: [ :aKey :aValue | 
		AssertionFailure signal: 'There should not be any parts' ].
	^ anInformation
]

{ #category : #'examples - dialog' }
XdShareDialogExamples >> dialog [
	<gtExample>
	| aDialog |
	aDialog := self basicDialog.
	aDialog 
		look: XdShareDialogLook;
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent. 
			c vertical matchParent ].
	self assert: aDialog viewModel isNotNil.
	self assert: aDialog look isNotNil.
	self 
		assert: aDialog viewModel information
		equals: aDialog viewModel information.
	self 
		assert: aDialog viewModel actions
		equals: aDialog viewModel actions.
	^ aDialog
]

{ #category : #accessing }
XdShareDialogExamples >> editorAt: anIndex in: aPageModel [
	| aCounter |
	aCounter := 0.
	self assert: aPageModel widget isNotNil.
	aPageModel widget allChildrenBreadthFirstDo: [ :eachChild | 
		(eachChild isKindOf: BrEditor) ifTrue: [
			aCounter := aCounter + 1.
			aCounter = anIndex ifTrue: [ ^ eachChild ] ] ].
	AssertionFailure signal: 'Did not find an editor at index: ', anIndex asString
]

{ #category : #'examples - dialog' }
XdShareDialogExamples >> emptyDialog [
	<gtExample>
	| aDialog anInformation |
	aDialog := self dialog.
	anInformation := self basicInformation.
	aDialog information: anInformation.
	self assertDialog: aDialog withInformation: anInformation.
	^ aDialog
]

{ #category : #'examples - dialog' }
XdShareDialogExamples >> filledDialog [
	<gtExample>
	| aDialog anInformation anActions |
	aDialog := self dialog.
	anInformation := self filledInformation.
	anActions := self actions.
	aDialog information: anInformation.
	aDialog actions: anActions.	
	self assertDialog: aDialog withInformation: anInformation.
	self assert: aDialog actions equals: anActions.
	^ aDialog
]

{ #category : #'examples - dialog' }
XdShareDialogExamples >> filledDialogInPublishStep [
	<gtExample>
	| aDialog |
	aDialog := self filledDialog.
	aDialog look proceedPublishStep.
	self assert: aDialog look pager pages size equals: 2.
	^ aDialog
]

{ #category : #'examples - information' }
XdShareDialogExamples >> filledInformation [
	<gtExample>
	| anInformation |
	anInformation := self basicInformation.
	anInformation 
		title: self titleString.
	self assertPartValue: anInformation title with: self titleString.
	^ anInformation
]

{ #category : #'examples - dialog infromation modifications' }
XdShareDialogExamples >> informationTitle [
	<gtExample>
	| aDialog anEditor |
	aDialog := self filledDialogInPublishStep.
	anEditor := self editorAt: 1 in: aDialog look pager pages second.
	self assertPartValue: anEditor text with: self titleString.
	^ aDialog
]

{ #category : #initialization }
XdShareDialogExamples >> initialize [
	super initialize.
	results := OrderedCollection new.
]

{ #category : #'examples - basic values' }
XdShareDialogExamples >> modificationString [
	<gtExample>
	^ ' (user modification)'
]

{ #category : #'examples - basic values' }
XdShareDialogExamples >> titleString [
	<gtExample>
	^ 'Joe Doe''s document'
]

{ #category : #'examples - dialog user modifications' }
XdShareDialogExamples >> userModificationOfTitle [
	<gtExample>
	| aDialog anEditor |
	aDialog := self filledDialogInPublishStep.
	anEditor := self editorAt: 1 in: aDialog look pager pages second.
	anEditor inserter 
		atEnd;
		string: self modificationString;
		insert.
	self 
		assertPartValue: aDialog information title 
		with: self titleString, self modificationString.
	^ aDialog
]
