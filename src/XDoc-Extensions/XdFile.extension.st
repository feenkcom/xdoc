Extension { #name : #XdFile }

{ #category : #'*XDoc-Extensions' }
XdFile >> gtExtractedTreeFor: aView [
	<gtView>
	self exists ifFalse: [ ^ aView empty ].

	^ aView forward
		title: 'Extracted files';
		priority: 10;
		object: [ self streamingStrategy ];
		view: #gtExtractedTreeFor:
]

{ #category : #'*XDoc-Extensions' }
XdFile >> gtLiveFor: aView [
	<gtView>
	^ aView forward
		title: 'Live';
		priority: 1;
		object: [ 
	(LeJsonV4 uniqueInstance deserialize: self mainFileReference readStream) asContentUIModel ];
		view: #gtLiveFor:
]

{ #category : #'*XDoc-Extensions' }
XdFile >> gtManifestFor: aView [
	<gtView>
	self manifest ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Manifest';
		priority: 2;
		object: [ self manifest ];
		view: #gtContentFor:
]

{ #category : #'*XDoc-Extensions' }
XdFile >> gtReferenceFor: aView [
	<gtView>
	| aList |
	aList := aView columnedList
		title: 'ZIP files' translated;
		priority: 3;
		items: [ self streamingStrategy zip members ].
	aList
		column: 'Icon' translated
		icon: [ :eachIcon | 
					(eachIcon isDirectory
						ifTrue: [ BrGlamorousIcons folder ]
						ifFalse: [ BrGlamorousIcons file ])
					 		asElement ] .
	aList column
		title: 'Name' translated;
		weight: 1;
		item: [ :each | each fileName ].
	aList column
		title: 'Size' translated;
		weight: 1;
		item: [ :each | each compressedSize ].
	aList column
		title: 'Last Modified' translated;
		weight: 1;
		item: [ :each | 
			String
				streamContents: [ :s | 
					each lastModTime printYMDOn: s.
					s nextPut: Character space.
					each lastModTime printHMSOn: s ] ].
	^ aList
]

{ #category : #'*XDoc-Extensions' }
XdFile >> openInPharo [
	"Document type should decide how to open (be displayed) in Pharo"
	self manifest documents ifEmpty: [ ^ self ].
	^ self manifest mainDocument openXdFileInPharo: self
]

{ #category : #'*XDoc-Extensions' }
XdFile >> toolInPharo [
	"Document type should decide which tool to use in Pharo"
	self manifest documents ifEmpty: [ ^ nil ].
	^ self manifest mainDocument toolForXdFileInPharo: self
]
