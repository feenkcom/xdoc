Class {
	#name : #BaselineOfXdocCore,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdocCore
}

{ #category : #baseline }
BaselineOfXdocCore >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		configuration: 'NeoJSON' with: [ spec
				repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main/';
				versionString: #stable;
				loads: 'default' ];
		package: 'XDoc-Core' with: [ spec 
			requires: #(#NeoJSON) ]
	]
]
