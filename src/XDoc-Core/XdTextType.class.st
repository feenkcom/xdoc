Class {
	#name : #XdTextType,
	#superclass : #XdType,
	#category : #'XDoc-Core-Model'
}

{ #category : #testing }
XdTextType class >> matchesMimeType: aZnMimeType [
	"Return true if the document type is equivalent to the Zinc MIME type"
	<return: #Boolean>
	^ aZnMimeType matches: ZnMimeType text
]

{ #category : #accessing }
XdTextType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'text'
]
