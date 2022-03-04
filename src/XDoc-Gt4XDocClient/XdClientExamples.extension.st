Extension { #name : #XdClientExamples }

{ #category : #'*XDoc-Gt4XDocClient' }
XdClientExamples >> basicList [
	<gtExample>
	| anElement |
	anElement := XdDocumentsElement new.
	self assert: anElement client notNil.
	^ anElement
]

{ #category : #'*XDoc-Gt4XDocClient' }
XdClientExamples >> basicListWithLook [
	<gtExample>
	| anElement aLook |
	anElement := self basicList.
	aLook := XdGlamorousDocumentsListAptitude new.
	anElement aptitude: aLook.
	self assert: aLook client equals: anElement client.
	self assert: anElement hasChildren description: 'Element must have children installed by the look'.
	^ anElement
]

{ #category : #'*XDoc-Gt4XDocClient' }
XdClientExamples >> listWithLook [
	<gtExample>
	| anElement aClient |
	anElement := self basicListWithLook.
	aClient := self client.
	anElement client: aClient.
	self assert: anElement viewModel client equals: aClient.
	self assert: anElement aptitude client equals: aClient.
	^ anElement
]
