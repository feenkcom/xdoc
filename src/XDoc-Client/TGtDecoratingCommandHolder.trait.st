Trait {
	#name : #TGtDecoratingCommandHolder,
	#instVars : [
		'decoratingCommand'
	],
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#category : #'XDoc-Client-Decorated Command Builder'
}

{ #category : #'as yet unclassified' }
TGtDecoratingCommandHolder classSide >> decoratingCommandBuilderOptionName [
	^ #decoratingCommandBuilder
]

{ #category : #'accessing - options - decorating commands' }
TGtDecoratingCommandHolder >> decoratingCommand: aCommand [
	self decoratingCommandBuilder command: aCommand
	
]

{ #category : #'accessing - options - decorating commands' }
TGtDecoratingCommandHolder >> decoratingCommandBuilder [
	self 
		optionAt: self class decoratingCommandBuilderOptionName 
		ifAbsentPut: [ self newDecoratingCommandBuilder ]
]

{ #category : #'execution - decorating commands' }
TGtDecoratingCommandHolder >> executeCommand: aCommand [
	self decoratingCommandBuilder execute: aCommand
]

{ #category : #'accessing - options - decorating commands' }
TGtDecoratingCommandHolder >> newDecoratingCommandBuilder [
	^ GtDecoratingCommandBuilder new
]
