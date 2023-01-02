"
#XDoc

XDoc stands for eXecutable Document.

It is a container that contains content files and meta-data. Let's consider this document containing some text and a picture.
TODO: an example

The corresponsing XDoc file is a zip archive that looks like this internally:

TODO: an example

The meta-data is stored in the `manifest.json` file:

TODO: an example

XDoc is executable by providing it to a player that will choose the corresponding tool to open it with. The tool is chosen based on the meta-data from the XDoc file.

##Application areas

XDoc can be used for serialization and sharing of live documents, e.g. lepiter pages.

"
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
				spec repository: 'github://svenvc/NeoJSON:v17/repository' ].
		spec
			baseline: 'GToolkitFileUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.8.174/src' ].
		spec
			baseline: 'GToolkitAssertionUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.8.174/src' ].
		spec
			baseline: 'GToolkitBasicUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.8.174/src' ].

		spec package: 'XDoc-Core' with: [
			spec requires: #('NeoJSON' 'GToolkitFileUtility' 'GToolkitAssertionUtility' 'GToolkitBasicUtility') ].
	]
]
