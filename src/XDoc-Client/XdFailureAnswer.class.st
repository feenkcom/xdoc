Class {
	#name : #XdFailureAnswer,
	#superclass : #XdFailedAnswer,
	#category : 'XDoc-Client-Answers'
}

{ #category : #accessing }
XdFailureAnswer >> message [
	^ self response message
]
