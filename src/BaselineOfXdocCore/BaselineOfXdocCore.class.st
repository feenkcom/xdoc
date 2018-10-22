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
				loads: 'default' ]";
		package: 'Feenk-XD-Core' with: [ spec 
			requires: #(#NeoJSON) ];
		package: 'Feenk-XD-Doc-Pillar-Core' with: [ spec 
			requires: #('Feenk-XD-Core') ];
		package: 'Feenk-XD-Doc-Image-Core' with: [ spec 
			requires: #('Feenk-XD-Core') ];
		package: 'Feenk-XD-Doc-PharoScript-Core' with: [ spec 
			requires: #('Feenk-XD-Core') ]"
]
]
