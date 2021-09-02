Extension { #name : 'XdType' }

{ #category : '*XDoc-Extensions' }
XdType class >> openDocument: aXdDocument ofXdFileInPharo: aXdFile [ 
	self subclassResponsibility
]

{ #category : '*XDoc-Extensions' }
XdType class >> toolForDocument: aXdDocument ofXdFileInPharo: aXdFile [
	"Return an Bloc elemment or an object that understands #asElement."
	<return: #BlElement>
	^ self subclassResponsibility
]
