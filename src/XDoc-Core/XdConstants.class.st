Class {
	#name : #XdConstants,
	#superclass : #Object,
	#category : #'XDoc-Core-Utility'
}

{ #category : #'client / server' }
XdConstants class >> cdnPathSegments [
	"Default public URL path segments for published XDoc documents"
	^ #( )
]

{ #category : #'client / server' }
XdConstants class >> emptyList [
	^ '[]'
]

{ #category : #version }
XdConstants class >> formatVersionNumber [
	<return: #Integer>
	^ 1
]

{ #category : #version }
XdConstants class >> formatVersionString [
	<return: #String>
	^ self formatVersionNumber asString
]

{ #category : #accessing }
XdConstants class >> htmlIndexFile [
	^ 'index.html'
]

{ #category : #'client / server' }
XdConstants class >> listFileName [
	"File name describing all published files"
	^ 'list.json'
]

{ #category : #accessing }
XdConstants class >> manifestFileName [
	^ 'manifest.json'
]

{ #category : #accessing }
XdConstants class >> pillarExtension [ 
	^ GtFileUtilityConstants pillarExtension
]

{ #category : #accessing }
XdConstants class >> playBookExtension [
	^ 'playbook'
]

{ #category : #accessing }
XdConstants class >> versionFileName [
	^ 'format-version.txt'
]

{ #category : #accessing }
XdConstants class >> xdocExtension [
	^ 'xdoc'
]

{ #category : #'client / server' }
XdConstants class >> xdocInfoFileName [
	"File name describing XDoc file path, name, and manifest"
	^ 'info.json'
]

{ #category : #'client / server' }
XdConstants class >> xdocPathSegments [
	"Default REST path to access/modify/delete an XDoc document"
	^ #( 'api' 'xdoc' )
]

{ #category : #'client / server' }
XdConstants class >> xdocPathSegmentsPattern [
	"Default REST path to access/modify/delete an XDoc document"
	^ #( 'api' 'xdoc' '*' )
]

{ #category : #'client / server' }
XdConstants class >> xdocsPathSegments [
	"REST path to access/post XDoc documents"
	^ #( 'api' 'xdocs' )
]
