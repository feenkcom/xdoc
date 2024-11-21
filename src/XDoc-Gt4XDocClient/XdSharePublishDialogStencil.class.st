Class {
	#name : #XdSharePublishDialogStencil,
	#superclass : #XdShareInputFieldsDialogStencil,
	#instVars : [
		'selectedSpace'
	],
	#category : #'XDoc-Gt4XDocClient-Dialog - Stencils'
}

{ #category : #'api - instantiation' }
XdSharePublishDialogStencil >> create [
	^ self newPage
		addChild: self newFields;
		addChild: self newNextButton.
]

{ #category : #streams }
XdSharePublishDialogStencil >> dropdownButtonLabelled: aLabel [
	^ BrButton new
		label: aLabel;
		icon:
			(BlElement new
				size: 8 @ 8;
				geometry:
					(BlPolygonGeometry
						vertices:
							{(0 @ 0).
							(8 @ 0).
							((8 / 2) rounded @ 8)});
				background: Color lightGray;
				margin: (BlInsets left: 6);
				constraintsDo: [ :c | c linear vertical alignCenter ]);
		yourself
]

{ #category : #streams }
XdSharePublishDialogStencil >> handleSpaceSelection: anEvent on: aButton [

	anEvent indices ifNotEmpty: [ :theIndices | 
		| aWidgetElement |
		aWidgetElement := anEvent currentTarget.
		selectedSpace := aWidgetElement viewModel itemAt: theIndices first.
		LeUserSpaces selected: selectedSpace.
		aButton label: LeUserSpaces selected title ].
	anEvent currentTarget fireEvent: BrDropdownHideWish new
]

{ #category : #streams }
XdSharePublishDialogStencil >> labelsAndInputFieldsOn: aStream [
	aStream
		nextPut: self newSpacesLabel;
		nextPut: self newSpacesInputField;
		nextPut: self newTitleLabel;
		nextPut: self newTitleInputField;
		nextPut: self newAuthorLabel;
		nextPut: self newAuthorInputField;
		nextPut: self newDescriptionLabel;
		nextPut: self newDescriptionInputField.
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newDescriptionInputField [
	^ self newInputEditorWith: self constants descriptionOptionName
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newDescriptionLabel [
	^ self newLabel
		text: 'Description:'
]

{ #category : #streams }
XdSharePublishDialogStencil >> newDropdownWith: anArray labelled: aString [

	| button |
	button := self dropdownButtonLabelled: aString.
	^ button
		  aptitude: BrGlamorousButtonWithLabelAndIconAptitude
			  + (BrGlamorousWithDropdownAptitude
					   handle: [ 
						   (self dropdownButtonLabelled: aString)
							   aptitude: BrGlamorousButtonWithLabelAndIconAptitude
								   - BrGlamorousButtonExteriorAptitude;
							   yourself ]
					   content: [ 
						   BrSimpleList new
						   	when: BrSelectionChanged
						   	do: [:anEvent |
						   		self handleSpaceSelection: anEvent on: button
						   	];
							   itemStencil: [ 
								   BrLabel new
									   aptitude: BrGlamorousLabelAptitude new
										   + BrGlamorousListItemAptitude new;
									   padding: (BlInsets all: 5);
								   	hMatchParent ];
							   itemDataBinder: [ :eachElement :eachClass :eachIndex | 
								   eachElement text: eachClass title
							   ];
							   vFitContent;
							   hExact: 300;
							   items: anArray]);
		  
		  yourself
]

{ #category : #streams }
XdSharePublishDialogStencil >> newSpacesInputField [
	^ self newDropdownWith: LeUserSpaces default labelled:  (LeUserSpaces selected ifNil: [ 'Spaces'] ifNotNil: [ LeUserSpaces selected title ])
]

{ #category : #streams }
XdSharePublishDialogStencil >> newSpacesLabel [
	^ self newLabel text: 'Space:'
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newTitleInputField [
	^ self newInputFieldWith: self constants titleOptionName
]

{ #category : #'instance creation' }
XdSharePublishDialogStencil >> newTitleLabel [
	^ self newLabel
		text: 'Title:'
]
