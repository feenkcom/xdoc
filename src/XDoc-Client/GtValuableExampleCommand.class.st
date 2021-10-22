Class {
	#name : #GtValuableExampleCommand,
	#superclass : #Object,
	#instVars : [
		'result',
		'valuable'
	],
	#category : 'XDoc-Client-Decorating Command Builder'
}

{ #category : #execution }
GtValuableExampleCommand >> execute [
	self result: self valuable value
]

{ #category : #accessing }
GtValuableExampleCommand >> result [
	^ result
]

{ #category : #accessing }
GtValuableExampleCommand >> result: anObject [
	result := anObject
]

{ #category : #accessing }
GtValuableExampleCommand >> valuable [
	^ valuable
]

{ #category : #accessing }
GtValuableExampleCommand >> valuable: anObject [
	valuable := anObject
]
