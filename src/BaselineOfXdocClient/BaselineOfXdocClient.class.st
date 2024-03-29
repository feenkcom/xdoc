"
#XDoc Client

What is XDoc? Learn here: {{gtClass:BaselineOfXdoc}}. 

The client component provides the connection to server that serves XDocs.

"
Class {
	#name : #BaselineOfXdocClient,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdocClient
}

{ #category : #accessing }
BaselineOfXdocClient class >> gtDependencyAnalysisPreloadedBaselines [
	^ super gtDependencyAnalysisPreloadedBaselines
		copyWith: BaselineOfGToolkit
]

{ #category : #baseline }
BaselineOfXdocClient >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'XdocClientMinimal' with: [
				spec repository: 'github://feenkcom/xdoc:main/src' ];
			package: 'XDoc-Extensions' with: [
				spec requires: #('XdocClientMinimal' ). ];
			package: 'XDoc-Gt4XDocClient' with: [
				spec requires: #( 'XdocClientMinimal' ). ];
			package: 'XDoc-Store'. ].

]
