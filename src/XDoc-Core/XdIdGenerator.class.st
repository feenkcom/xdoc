Class {
	#name : #XdIdGenerator,
	#superclass : #Object,
	#category : #'XDoc-Core-ID Generator'
}

{ #category : #accessing }
XdIdGenerator >> nextId [
	"Return next unique id that can be used to identify objects"
	<return: #String>
	^ self subclassResponsibility
]
