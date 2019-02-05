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
				spec repository: 'github://svenvc/NeoJSON:14da7628190cdc6b94462c8a41650b54f44a5ea9/repository' ];
			baseline: 'GToolkitUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.4.11/src' ].
		spec package: 'XDoc-Core' with: [
				spec requires: #('NeoJSON' 'GToolkitUtility' ). ]. ].

]
