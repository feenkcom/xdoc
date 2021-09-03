Extension { #name : 'XdManifest' }

{ #category : '*XDoc-Extensions' }
XdManifest >> gtContentFor: aView [
	<gtView>
	^ aView list
		title: 'Content';
		items: [ { 
			'Title: ', self title asString.
			'Author: ', self author asString.
			'Description: ', self description asString } ,
			self documents , 
			self attachments ]
			
]
