Class {
	#name : #XdUtility,
	#superclass : #Object,
	#traits : 'XdConstantsTrait',
	#classTraits : 'XdConstantsTrait classTrait',
	#category : #'XDoc-Core-Utility'
}

{ #category : #utility }
XdUtility class >> playgroundFileNameFromDateAndTime: aDateAndTime [
	<script: '(self fileNameFromDateAndTime: DateAndTime now) inspect'>
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
