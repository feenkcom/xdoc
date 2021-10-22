Class {
	#name : #XdFileService,
	#superclass : #Object,
	#category : 'XDoc-Client-FileService'
}

{ #category : #'System-FileRegistry' }
XdFileService class >> fileReaderServicesForFile: fullName suffix: suffix [
	<fileService>
	(XdConstants xdocExtension = suffix) ifFalse: [ ^ #() ].
	^ self services
]

{ #category : #actions }
XdFileService class >> openXDocDocument: aFileNameString [ 
	| aFileReference |
	aFileReference := aFileNameString asFileReference.
	aFileReference exists ifFalse: [ ^ self inform: aFileNameString, ' does not exist!' ].
	XdClient new openFileReference: aFileReference
]

{ #category : #'System-FileRegistry' }
XdFileService class >> serviceOpenXDoc [
	^ SimpleServiceEntry 
		provider: self 
		label: 'Open XDoc document'
		selector: #openXDocDocument:
		description: 'It opens an XDoc document, e.g, playground, or Documenter.'
		buttonLabel: 'Open XDoc'
]

{ #category : #'System-FileRegistry' }
XdFileService class >> services [
	^ Array with: self serviceOpenXDoc
]
