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
	spec for: #'common' do: [
		spec baseline: 'Xdoc' with: [
				spec repository: 'github://feenkcom/xdoc:v0.5.5/src' ].
		spec package: 'XDoc-Client' with: [
				spec requires: #('Xdoc' ). ]. ].

]
