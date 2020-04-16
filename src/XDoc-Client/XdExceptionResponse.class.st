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

{ #category : #testing }
XdExceptionResponse >> isSuccess [
	^ false
]

{ #category : #accessing }
XdExceptionResponse >> rawResponse [
	<return: #Exception>
	^ self exception
]

{ #category : #'accessing - response' }
XdExceptionResponse >> statusLineMessage [
	^ self exception printString
]
