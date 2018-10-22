Class {
	#name : #BaselineOfXdoc,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdoc
}

{ #category : #baseline }
BaselineOfXdoc >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Brick' with: [ spec
				repository: 'github://pharo-graphics/Brick/src';
				loads: #default ];
		baseline: 'XdocCore' with: [ spec 
			repository: 'github://feenkcom/xdoc/src' ]
	].

]
