Class {
	#name : #XdProtoResponse,
	#superclass : #Object,
	#category : 'XDoc-Client-Answers'
}

{ #category : #testing }
XdProtoResponse >> isResponse [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #testing }
XdProtoResponse >> isSuccess [
	<return: #Boolean>
	^ self subclassResponsibility
]

{ #category : #accessing }
XdProtoResponse >> message [
	<return: #String>
	^ self subclassResponsibility
]

{ #category : #accessing }
XdProtoResponse >> rawResponse [
	<return: #Object>
	^ self subclassResponsibility
]

{ #category : #'accessing - response' }
XdProtoResponse >> statusLineMessage [
	<return: #String>
	^ self subclassResponsibility
]
