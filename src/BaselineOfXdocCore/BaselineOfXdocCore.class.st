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
				spec repository: 'github://svenvc/NeoJSON:b10eb7aa1b3bac323da2ab1b286a27e6c8810076/repository' ];
			baseline: 'GToolkitUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.4.0/src' ].
		spec package: 'XDoc-Core' with: [
				spec requires: #('NeoJSON' 'GToolkitUtility' ). ]. ].

]
