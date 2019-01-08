Class {
	#name : #XdClient,
	#superclass : #Object,
	#category : #'XDoc-Client-Core'
}

{ #category : #actions }
XdClient >> download: aZnUrl [ 
	"Download an XDoc file from a public server"
	^ XdClientDownloadXDocCommand new
		client: self;
		url: aZnUrl;
		execute;
		xdFile
]
