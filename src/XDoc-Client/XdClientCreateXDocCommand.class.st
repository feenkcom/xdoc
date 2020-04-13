Class {
	#name : #XdClientCreateXDocCommand,
	#superclass : #XdClientWithResponseCommand,
	#instVars : [
		'xdoc'
	],
	#category : #'XDoc-Client-Commands'
}

{ #category : #testing }
XdClientCreateXDocCommand class >> isAbstract [ 
	^ self name = #XdClientCreateXDocCommand 
]

{ #category : #accessing }
XdClientCreateXDocCommand >> publicUrl [
	<return: #ZnUrl>
	^ self response location asZnUrl
]

{ #category : #accessing }
XdClientCreateXDocCommand >> xdoc [
	<return: #XdFile>
	^ xdoc
]

{ #category : #accessing }
XdClientCreateXDocCommand >> xdoc: aXdFile [ 
	xdoc := aXdFile
]

{ #category : #private }
XdClientCreateXDocCommand >> xdocBytes [
	<return: #ByteArray>
	self flag: 'XDoc API proposeal [feenkcom/gtoolkit#888]'.
	"^ self xdoc reader bytes"
	^ self xdoc streamingStrategy bytes
]

{ #category : #accessing }
XdClientCreateXDocCommand >> xdocEntity [
	<return: #ZnEntity>
	^ ZnEntity bytes: self xdocBytes
]
