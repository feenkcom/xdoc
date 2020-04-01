Trait {
	#name : #TGtResponseStatus,
	#category : #'XDoc-Client-Responses'
}

{ #category : #'testing - response status' }
TGtResponseStatus >> isAuthenticationRequired [
	<return: #Boolean>
	^ self response isAuthenticationRequired
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isBadRequest [
	<return: #Boolean>
	^ self response isBadRequest
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isCreated [
	<return: #Boolean>
	^ self response isCreated
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isError [
	<return: #Boolean>
	^ self response isError
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isInformational [
	<return: #Boolean>
	^ self response isInformational
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isNoContent [
	<return: #Boolean>
	^ self response isNoContent
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isNotFound [
	<return: #Boolean>
	^ self response isNotFound
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isNotModified [
	<return: #Boolean>
	^ self response isNotModified
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isRedirect [
	<return: #Boolean>
	^ self response isRedirect
]

{ #category : #'testing - response status' }
TGtResponseStatus >> isSuccess [
	<return: #Boolean>
	^ self response isSuccess
]

{ #category : #accessing }
TGtResponseStatus >> response [
	^ self explicitRequirement
]
