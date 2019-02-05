"
!XDoc Client

What is XDoc? Learn here: ${class:BaselineOfXdoc}$. 

The client component provides the connection to server that serves XDocs.

An example area is the blog feed from below.

${xdocs}$
"
Class {
	#name : #BaselineOfXdocClient,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdocClient
}

{ #category : #baseline }
BaselineOfXdocClient >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		"baseline: 'Brick' with: [ spec
			repository: 'github://pharo-graphics/Brick/src' ];"
		baseline: 'Xdoc' with: [ spec 
			repository: 'github://feenkcom/xdoc/src' ];
		package: 'XDoc-Client' with: [ spec 
			requires: #( 'Xdoc' ) ]
	].

]
