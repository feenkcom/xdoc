Class {
	#name : 'XdNullResponse',
	#superclass : 'XdProtoResponse',
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : 'XDoc-Client-Answers'
}

{ #category : 'testing - response status' }
XdNullResponse >> isAuthenticationRequired [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isBadRequest [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isCreated [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isError [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isInformational [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isNoContent [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isNotFound [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isNotModified [
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isRedirect [
	^ false
]

{ #category : 'testing' }
XdNullResponse >> isResponse [
	<return: #Boolean>
	^ false
]

{ #category : 'testing - response status' }
XdNullResponse >> isSuccess [
	^ false
]

{ #category : 'accessing' }
XdNullResponse >> message [
	<return: #String>
	^ ''
]

{ #category : 'accessing' }
XdNullResponse >> rawResponse [
	^ nil
]

{ #category : 'accessing - response' }
XdNullResponse >> statusLineMessage [
	<return: #String>
	^ ''
]
