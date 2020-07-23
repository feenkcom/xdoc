Class {
	#name : #XdUtility,
	#superclass : #Object,
	#traits : 'TXdConstants',
	#classTraits : 'TXdConstants classTrait',
	#category : #'XDoc-Core-Utility'
}

{ #category : #utility }
XdUtility class >> extractInTempDirectory: aStream basename: aBasename [
	"Return a directory in which XDoc is extracted"
	<return: #FileReference>
	| anArchive aTmpDir |
	anArchive := ZipArchive new.
	anArchive readFrom: aStream contents readStream.
	aTmpDir := FileReference newTempFilePrefix: aBasename suffix: '-extracted-dir'.
	aTmpDir ensureCreateDirectory.
	anArchive extractAllTo: aTmpDir.
	^ aTmpDir
]

{ #category : #utility }
XdUtility class >> pathSegmentsInCdnPath: anArray [
	<return: #Boolean>
	^ XdConstants cdnPathSegments isEmpty or: [ anArray beginsWith: XdConstants cdnPathSegments ]
]

{ #category : #utility }
XdUtility class >> playgroundFileNameFromDateAndTime: aDateAndTime [
	<script: '(self playgroundFileNameFromDateAndTime: DateAndTime now) inspect'>
	"Screen Shot 2018-10-09 at 22.34.56"
	^ String streamContents: [ :aStream | 
			aStream nextPutAll: 'Playground '.
			BasicDatePrinter default 
				printYMD: aDateAndTime withLeadingSpace: false on: aStream.
			aStream nextPutAll: ' at '.
			BasicDatePrinter default 
				printHMS: aDateAndTime separatedBy: $. on: aStream.
			aStream
				nextPut: $.;
				nextPutAll: self constants xdocExtension. ]
]

{ #category : #utility }
XdUtility class >> xdocFileFromFileReference: aFileReference [
	^ XdReader new
		streamingStrategy: (XdStreamingStrategy file: aFileReference);
		onError: [ :anError | XdFile empty ];
		read
]
