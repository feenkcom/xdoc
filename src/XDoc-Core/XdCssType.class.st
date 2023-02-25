Class {
	#name : #XdCssType,
	#superclass : #XdType,
	#category : #'XDoc-Core-Model'
}

{ #category : #testing }
XdCssType class >> matchesMimeType: aZnMimeType [
	"Return true if the document type is equivalent to the Zinc MIME type"
	<return: #Boolean>
	^ aZnMimeType matches: ZnMimeType textCss
]

{ #category : #accessing }
XdCssType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'css'
]
