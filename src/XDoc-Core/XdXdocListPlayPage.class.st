Class {
	#name : #XdXdocListPlayPage,
	#superclass : #Object,
	#traits : 'GtAssertingTrait + GtAnnouncerTrait',
	#classTraits : 'GtAssertingTrait classTrait + GtAnnouncerTrait classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #announcer }
XdXdocListPlayPage >> announcer [
	<return: #Announcer>
	^ announcer
]

{ #category : #converting }
XdXdocListPlayPage >> asElement [
	| aFileReference aList |
	aFileReference := FileLocator localDirectory / 'xdocs'.
	aFileReference ensureCreateDirectory.
	aList := BrColumnedList new
		display: aFileReference allFiles;
		addEventHandler: GtInspectorListToSelectHandler new.
	aList column
		title: 'Title';
		stencil: [ :each :index |			
			BrMaterialListItemStencil singleLineWithoutIcon
				label: each basename ].
	^ aList
]

{ #category : #initialization }
XdXdocListPlayPage >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #testing }
XdXdocListPlayPage >> shouldBePersisted [
	^ false
]

{ #category : #accessing }
XdXdocListPlayPage >> title [
	^ 'XDocs'
]
