Extension { #name : 'XdExamples' }

{ #category : '*XDoc-Extensions' }
XdExamples >> xdFileLiveExtension [
	<gtExample>
	| aFile aPhlow |
	aFile := self readTextDocument.
	aPhlow := GtPhlowView empty on: aFile perform: #gtLiveFor:.
	self assert: aPhlow class ~= GtPhlowViewWithError.
	^ aPhlow
]
