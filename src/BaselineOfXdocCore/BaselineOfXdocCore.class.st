Class {
	#name : #BaselineOfXdocCore,
	#superclass : #BaselineOf,
	#category : #BaselineOfXdocCore
}

{ #category : #baselines }
BaselineOfXdocCore >> baseline: spec [
	<baseline>
	"I am empty and I exist to bypass an error when merging in Iceberg."
	spec
		for: #common
		do: [ ]
]
