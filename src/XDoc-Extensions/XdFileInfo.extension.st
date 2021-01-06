Extension { #name : #XdFileInfo }

{ #category : #'*XDoc-Extensions' }
XdFileInfo >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		items: [ {('Title' -> self title).
			('Author' -> self author).
			('Description' -> self description).
			('File name' -> self fileName).
			('Created on' -> self createdOn).
			('XDoc URL' -> self xdocUrl).
			('Preview URL' -> self previewUrl)} ];
		column: 'Property' text: [ :assoc | assoc key ];
		column: 'Value' text: [ :assoc | assoc value asString ];
		send: #value
]
