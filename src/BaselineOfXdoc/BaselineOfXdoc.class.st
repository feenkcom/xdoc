"
!XDoc

XDoc stands for eXecutable Document.

It is a container that contains content files and meta-data. Let's consider this document containing some text and a picture.

${example:GtDocumentExamples>>#documentWithFigure|noCode|previewShow=#gtTextFor:|previewHeight=400}$

The corresponsing XDoc file is a zip archive that looks like this internally:

${example:XdDocumentExamples>>#writeDocumentWithImages|noCode|previewShow=#gtReferenceFor:|previewHeight=200}$

The meta-data is stored in the ==manifest.json== file:

${example:XdDocumentExamples>>#writeDocumentWithImages|noCode|previewShow=#gtManifestFor:|previewHeight=200}$

XDoc is executable by providing it to a player that will choose the corresponding tool to open it with. The tool is chosen based on the meta-data from the XDoc file.

!!Application areas

XDoc can be used for various purposes. Two distinct applications are the serialization and sharing of:
- Live documents. See ${class:XdDocumentExamples}$ , and 
- Playground pages. See ${class:XdPlaygroundExamples}$.




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
				spec repository: 'github://svenvc/NeoJSON:v17/repository' ];
			baseline: 'GToolkitFileUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.7.20/src' ];
			baseline: 'GToolkitAssertionUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.7.20/src' ];
			baseline: 'GToolkitBasicUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.7.20/src' ].
		spec package: 'XDoc-Core' with: [
				spec requires: #('NeoJSON' 'GToolkitFileUtility' 'GToolkitAssertionUtility' 'GToolkitBasicUtility' ). ]. ].

]
