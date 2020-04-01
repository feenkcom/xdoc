Class {
	#name : #XdZincNullResponse,
	#superclass : #XdZincProtoResponse,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'XDoc-Client-Responses'
}

{ #category : #'testing - response status' }
XdZincNullResponse >> isAuthenticationRequired [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isBadRequest [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isCreated [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isError [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isInformational [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isNoContent [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isNotFound [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isNotModified [
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isRedirect [
	^ false
]

{ #category : #testing }
XdZincNullResponse >> isResponse [
	<return: #Boolean>
	^ false
]

{ #category : #'testing - response status' }
XdZincNullResponse >> isSuccess [
	^ false
]
