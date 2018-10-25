Class {
	#name : #XdBytesStreamingStrategy,
	#superclass : #XdStreamingStrategy,
	#instVars : [
		'bytes'
	],
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdBytesStreamingStrategy >> bytes [
	<return: #ByteArray or: nil>
	^ bytes
]

{ #category : #accessing }
XdBytesStreamingStrategy >> bytes: aByteArray [
	self 
		assert: [ aByteArray notNil ] 
		description: [ 'Bytes must be non-nil' ].
	bytes := aByteArray
]

{ #category : #testing }
XdBytesStreamingStrategy >> exists [
	<return: #Boolean>
	^ self bytes notNil
]

{ #category : #streams }
XdBytesStreamingStrategy >> readStream [
	self 
		assert: [ self exists ]
		description: [ 'Bytes must be defined before reading them' ].
	^ self bytes readStream
]

{ #category : #streams }
XdBytesStreamingStrategy >> writeStreamDo: aValuable [
	"Evaluates the argument with a write stream. Answers the result."	
	| inMemoryStream result |

	inMemoryStream := ByteArray new writeStream.
	result := aValuable value: inMemoryStream binary.
	bytes := inMemoryStream contents.
	^ result. 
]
