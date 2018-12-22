Class {
	#name : #BaselineOfXdoc,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdoc
}

{ #category : #baseline }
BaselineOfXdoc >> baseline: spec [
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
