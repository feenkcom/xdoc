Class {
	#name : #XdXdocListPlayPage,
	#superclass : #Object,
	#traits : 'GtAssertingTrait + GtAnnouncerTrait + XdConstantsTrait',
	#classTraits : 'GtAssertingTrait classTrait + GtAnnouncerTrait classTrait + XdConstantsTrait classTrait',
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
		addEventHandler:
			(GtInspectorListToSelectHandler new
				transformation:
					[ :eachFile | self readPlayBookFrom: eachFile ]);
		constraintsDo: [ :c | c padding: (BlInsets top: 10) ].
	aList column
		title: 'Title';
		stencil:
				[ :each :index | (BrListLabelStencil matchParent: each basename) asElement ].
	^ aList
]

{ #category : #initialization }
XdXdocListPlayPage >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #converting }
XdXdocListPlayPage >> readPlayBookFrom: eachFile [
	| aPlayBookMember aXdFile aJsonString |
	aXdFile := XdFile new
		streamingStrategy: (XdStreamingStrategy file: eachFile).
	aPlayBookMember := aXdFile streamingStrategy zip members
		detect: [ :aMember | aMember fileName endsWith: self constants playBookExtension ].
	aJsonString := aPlayBookMember contents asByteArray utf8Decoded.
	^ XdPlayBookJsonMapping readPlayBook: aJsonString
]

{ #category : #testing }
XdXdocListPlayPage >> shouldBePersisted [
	^ false
]

{ #category : #accessing }
XdXdocListPlayPage >> title [
	^ 'XDocs'
]
