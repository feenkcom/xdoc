Class {
	#name : #XdSuccessfullyUpdatedAnswer,
	#superclass : #XdSuccessfullyCreatedAnswer,
	#category : 'XDoc-Client-Answers'
}

{ #category : #accessing }
XdSuccessfullyUpdatedAnswer >> publicUrl [
	<return: #ZnUrl>
	^ self command publicUrl
]
