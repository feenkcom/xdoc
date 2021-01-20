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
		spec 
			baseline: 'XdocClientMinimal' with: [
				spec repository: 'github://feenkcom/xdoc:v0.8.237/src' ];
			baseline: 'Brick' with: [
				spec repository: 'github://feenkcom/Brick:v0.8.212/src' ];
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.228/src' ];
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:v0.8.215/src' ].
		spec 
			package: 'XDoc-Extensions' with: [
				spec requires: #('XdocClientMinimal' 'Brick' 'GToolkitPhlow' ). ];
			package: 'XDoc-Gt4XDocClient' with: [
				spec requires: #('XdocClientMinimal' 'Brick' 'GToolkitPhlow' 'GToolkitSpotter' ). ];
			package: 'XDoc-Store'. ].

]
