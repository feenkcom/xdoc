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
				spec repository: 'github://feenkcom/xdoc:main/src' ];
			baseline: 'GToolkitExamples' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:main/src' ].
		spec package: 'XDoc-Client' with: [
				spec requires: #('Xdoc' 'GToolkitExamples' ). ]. ].

]
