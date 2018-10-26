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
		baseline: 'GToolkitUtility' with: [ spec 
			repository: 'github://feenkcom/gtoolkit-utility/src' ];
		package: 'XDoc-Core' with: [ spec 
			requires: #( 'NeoJSON' 'GToolkitUtility' ) ]
	]
]
