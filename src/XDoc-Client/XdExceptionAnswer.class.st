Class {
	#name : #XdExceptionAnswer,
	#superclass : #XdFailedAnswer,
	#category : #'XDoc-Client-Answers'
}

{ #category : #accessing }
XdExceptionAnswer >> exception [
	<return: #Exception>
	^ self response exception
]

{ #category : #accessing }
XdExceptionAnswer >> exception: anException [
	self
		assert: [ anException isNotNil ] 
		description: [ 'Exception must be non-nil' ].
	self response: (XdExceptionResponse new exception: anException)
]

{ #category : #accessing }
XdExceptionAnswer >> message [
	^ self exception messageText
]
