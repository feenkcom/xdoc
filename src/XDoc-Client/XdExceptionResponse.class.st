Class {
	#name : #XdExceptionResponse,
	#superclass : #XdProtoResponse,
	#instVars : [
		'exception'
	],
	#category : #'XDoc-Client-Answers'
}

{ #category : #accessing }
XdExceptionResponse >> exception [
	^ exception
]

{ #category : #accessing }
XdExceptionResponse >> exception: anObject [
	exception := anObject
]

{ #category : #testing }
XdExceptionResponse >> isResponse [
	<return: #Boolean>
	^ true
]

{ #category : #accessing }
XdExceptionResponse >> rawResponse [
	<return: #Exception>
	^ self exception
]
