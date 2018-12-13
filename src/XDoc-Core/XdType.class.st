Class {
	#name : #XdType,
	#superclass : #Object,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdType class >> text [
	^ XdTextType
]

{ #category : #enumerating }
XdType class >> typeFromMimeType: aZnMimeType [ 
	self allSubclassesDo: [ :eachClass | 
		(eachClass matchesMimeType: aZnMimeType) ifTrue: [ ^ eachClass ] ].
	^ XdUndefinedType new
			mimeType: aZnMimeType;
			yourself
]

{ #category : #enumerating }
XdType class >> typeFromString: aString [ 
	self allSubclassesDo: [ :eachClass | 
		eachClass typeString = aString ifTrue: [ ^ eachClass ] ].
	^ self error: 'Undefined type'
]

{ #category : #accessing }
XdType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ self subclassResponsibility
]
