Class {
	#name : #BaselineOfFeenkXdoc,
	#superclass : #BaselineOf,
	#category : #BaselineOfFeenkXdoc
}

{ #category : #baseline }
BaselineOfFeenkXdoc >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Brick' with: [ spec
				repository: 'github://pharo-graphics/Brick/src';
				loads: #default ];
		baseline: 'FeenkXdocCore' with: [ spec 
			repository: 'github://feenkcom/xdoc/src' ]
	].

]
