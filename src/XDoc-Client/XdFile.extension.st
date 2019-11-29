Extension { #name : #XdFile }

{ #category : #'*XDoc-Client' }
XdFile >> gtReferenceFor: aView [
	<gtView>
	| aList |
	aList := aView columnedList
		title: 'Files' translated;
		priority: 1;
		items: self streamingStrategy zip members.
	aList
		column: 'Icon' translated
		do: [ :column | 
			column
				item: [ :each | 
					each isDirectory
						ifTrue: [ BrGlamorousIcons folder ]
						ifFalse: [ BrGlamorousIcons file ] ];
				rowStencil: [ :eachIcon | eachIcon asElement margin: (BlInsets left: 5 right: 5) ];
				noResize ].
	aList column
		title: 'Name' translated;
		matchParent;
		item: [ :each | each fileName ].
	aList column
		title: 'Size' translated;
		matchParent;
		item: [ :each | each compressedSize ].
	aList column
		title: 'Last Modified' translated;
		matchParent;
		item: [ :each | 
			String
				streamContents: [ :s | 
					each lastModTime printYMDOn: s.
					s nextPut: Character space.
					each lastModTime printHMSOn: s ] ].
	^ aList
]
