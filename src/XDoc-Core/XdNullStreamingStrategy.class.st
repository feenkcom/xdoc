Class {
	#name : #XdNullStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Core-Streaming'
}

{ #category : #cleanup }
XdNullStreamingStrategy class >> cleanUp [
	self reset
]

{ #category : #cleanup }
XdNullStreamingStrategy class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
XdNullStreamingStrategy class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'file system' }
XdNullStreamingStrategy >> detectFileReference: aDetectBlock ifFound: aFoundBlock ifNone: aNotFoundBlock [
	<return: #FileReference>
	^ aNotFoundBlock value
]

{ #category : #'api - streams' }
XdNullStreamingStrategy >> detectReferenceNamed: aFileName ifFound: aFoundBlock ifNone: aNotFoundBlock [
	<return: #XdReadStreamReference>
	^ aNotFoundBlock value
]

{ #category : #testing }
XdNullStreamingStrategy >> exists [
	<return: #Boolean>
	^ false
]

{ #category : #accessing }
XdNullStreamingStrategy >> memberNamed: aFileName [ 
	<return: #ArchiveMember>
	^ nil
]

{ #category : #'api - streams' }
XdNullStreamingStrategy >> open [
	"Do nothing"
]

{ #category : #'api - streams' }
XdNullStreamingStrategy >> readStreamDo: aBlock [
	"do nothing"
]

{ #category : #'api - streams' }
XdNullStreamingStrategy >> writeStreamDo: aBlock [
	"do nothing"
]
