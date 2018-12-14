Class {
	#name : #XdConstants,
	#superclass : #Object,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdConstants class >> htmlIndexFile [
	^ 'index.html'
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
XdConstants class >> xdocExtension [
	^ 'xdoc'
]
