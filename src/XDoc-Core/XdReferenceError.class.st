Class {
	#name : #XdReferenceError,
	#superclass : #XdError,
	#instVars : [
		'fileName'
	],
	#category : #'XDoc-Core-Exceptions'
}

{ #category : #accessing }
XdReferenceError >> fileName [
	<return: #String>
	^ fileName
]

{ #category : #accessing }
XdReferenceError >> fileName: aString [
	fileName := aString
]
