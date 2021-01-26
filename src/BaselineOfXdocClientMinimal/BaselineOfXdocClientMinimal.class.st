Class {
	#name : #BaselineOfXdocClientMinimal,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdocClientMinimal
}

{ #category : #baseline }
BaselineOfXdocClientMinimal >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'Xdoc' with: [
				spec repository: 'github://feenkcom/xdoc:v0.8.251/src' ];
			baseline: 'GToolkitExamples' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.16/src' ].
		spec package: 'XDoc-Client' with: [
				spec requires: #('Xdoc' 'GToolkitExamples' ). ]. ].

]
