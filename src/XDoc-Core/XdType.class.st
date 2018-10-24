Class {
	#name : #XdType,
	#superclass : #Object,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdType class >> playbook [ 
	^ XdPlayBookType
]

{ #category : #accessing }
XdType class >> text [
	^ XdTextType
]

{ #category : #enumerating }
XdType class >> typeFromString: aString [ 
	self allSubclassesDo: [ :eachClass | 
		eachClass typeString = aString ifTrue: [ ^ eachClass ] ].
	^ self error: 'Unknown type'
]

{ #category : #accessing }
XdType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ self subclassResponsibility
]
