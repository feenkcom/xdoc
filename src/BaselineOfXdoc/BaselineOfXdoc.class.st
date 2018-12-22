Class {
	#name : #BaselineOfXdoc,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdoc
}

{ #category : #baseline }
BaselineOfXdoc >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		"baseline: 'Brick' with: [ spec
			repository: 'github://pharo-graphics/Brick/src' ];"
		baseline: 'XdocCore' with: [ spec 
			repository: 'github://feenkcom/xdoc/src' ];
		package: 'XDoc-Client' with: [ spec 
			requires: #( 'XdocCore' ) ]
	].

]
