Class {
	#name : #XdUtility,
	#superclass : #Object,
	#traits : 'XdConstantsTrait',
	#classTraits : 'XdConstantsTrait classTrait',
	#category : #'XDoc-Core-Utility'
}

{ #category : #utility }
XdUtility class >> fileNameFromDateAndTime: aDateAndTime [
	<script: '(self fileNameFromDateAndTime: DateAndTime now) inspect'>
	^ String streamContents: [ :s | 
			aDateAndTime printSeparateDateAndTimeOn: s.
			s nextPut: $..
			s nextPutAll: self constants xdocExtension. ]
]
