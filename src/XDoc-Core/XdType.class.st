Class {
	#name : #XdType,
	#superclass : #Object,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdType class >> css [
	^ XdCssType
]

{ #category : #accessing }
XdType class >> html [
	^ XdHtmlType
]

{ #category : #accessing }
XdType class >> image [
	^ XdImageType
]

{ #category : #accessing }
XdType class >> preview [ 
	^ XdPreviewType
]

{ #category : #accessing }
XdType class >> text [
	^ XdTextType
]

{ #category : #enumerating }
XdType class >> typeFromString: aString [ 
	self allSubclassesDo: [ :eachClass | 
		eachClass typeString = aString ifTrue: [ ^ eachClass ] ].
	^ XdUndefinedType new name: aString
]

{ #category : #accessing }
XdType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ self subclassResponsibility
]
