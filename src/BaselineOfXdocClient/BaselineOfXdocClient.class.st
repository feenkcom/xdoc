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
				spec repository: 'github://feenkcom/xdoc:v0.4.6/src' ].
		spec package: 'XDoc-Client' with: [
				spec requires: #('Xdoc' ). ]. ].

]
