Class {
	#name : #XdType,
	#superclass : #Object,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdType class >> html [
	^ XdHtmlType
]

{ #category : #accessing }
XdType class >> image [
	^ XdImageType
]

{ #category : #actions }
XdType class >> openDocument: aXdDocument ofXdFileInPharo: aXdFile [ 
	self subclassResponsibility
]

{ #category : #accessing }
XdType class >> text [
	^ XdTextType
]

{ #category : #accessing }
XdType class >> toolForDocument: aXdDocument ofXdFileInPharo: aXdFile [
	"Return an Bloc elemment or an object that understands #asElement."
	<return: #BlElement>
	^ self subclassResponsibility
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
