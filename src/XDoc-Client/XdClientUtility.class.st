Class {
	#name : 'XdClientUtility',
	#superclass : 'Object',
	#category : 'XDoc-Client-Utility'
}

{ #category : 'api - file system operations' }
XdClientUtility class >> notExistingFileIn: aDirectory basename: aBasename [
	<return: #FileReference>
	| aCreatedDirectory aFileReference aSoleBasename aSoleExtension anIndex |
	aCreatedDirectory := aDirectory asFileReference.
	aCreatedDirectory ensureCreateDirectory.
	aFileReference := aCreatedDirectory / aBasename.
	aSoleBasename := aFileReference basenameWithoutExtension.
	aSoleExtension := aFileReference extension.
	anIndex := 1.
	[ aFileReference exists ] whileTrue: [ 
		aFileReference := aCreatedDirectory / 
			(aSoleBasename, '-', anIndex asString, '.', aSoleExtension).
		anIndex := anIndex + 1.
	].
	^ aFileReference
]
