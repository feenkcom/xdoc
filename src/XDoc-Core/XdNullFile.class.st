Class {
	#name : #XdNullFile,
	#superclass : #XdProtoFile,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'XDoc-Core-Model'
}

{ #category : #'api - testing' }
XdNullFile >> hasAuthor [
	<return: #Boolean>
	^ false
]

{ #category : #'api - testing' }
XdNullFile >> hasDescription [
	<return: #Boolean>
	^ false
]

{ #category : #'api - testing' }
XdNullFile >> hasPublicUrl [
	<return: #Boolean>
	^ false
]

{ #category : #'api - testing' }
XdNullFile >> hasPublicationDate [
	<return: #Boolean>
	^ false
]

{ #category : #'api - testing' }
XdNullFile >> hasTitle [
	<return: #Boolean>
	^ false
]
