Class {
	#name : #BaselineOfXdocCore,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdocCore
}

{ #category : #baseline }
BaselineOfXdocCore >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON:master/repository' ];
			baseline: 'GToolkitUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility/src' ].
		spec package: 'XDoc-Core' with: [
				spec requires: #('NeoJSON' 'GToolkitUtility' ). ]. ].

]
