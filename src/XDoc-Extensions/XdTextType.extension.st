Extension { #name : #XdTextType }

{ #category : #'*XDoc-Extensions' }
XdTextType class >> toolForDocument: aXdDocument ofXdFileInPharo: aXdFile [
	"Return an Bloc elemment or an object that understands #asElement."
	<return: #BlElement>
	^ BrEditor new 
		look: BrGlamorousRegularEditorLook;
		text: 'TODO with navigator aXdFile navigator mainDocument mainAttachment string'
]
