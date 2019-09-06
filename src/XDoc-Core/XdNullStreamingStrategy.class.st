Class {
	#name : #XdNullStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'XDoc-Core-Model'
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

{ #category : #streams }
XdNullStreamingStrategy >> readStream [
	"Return a binary read stream"
	^ ByteArray new readStream
]
