Class {
	#name : #XdShareInformation,
	#superclass : #XdShareProtoInformation,
	#traits : 'TGtOptions',
	#classTraits : 'TGtOptions classTrait',
	#category : #'XDoc-Gt4XDocClient-Dialog - Model'
}

{ #category : #accessing }
XdShareInformation class >> authorOptionName [
	^ #author
]

{ #category : #accessing }
XdShareInformation class >> descriptionOptionName [
	^ #description
]

{ #category : #factory }
XdShareInformation class >> null [ 
	^ XdShareNullInformation default 
]

{ #category : #accessing }
XdShareInformation class >> passwordOptionName [
	^ #password
]

{ #category : #accessing }
XdShareInformation class >> publicUrlOptionName [
	^ #publicUrl
]

{ #category : #accessing }
XdShareInformation class >> titleOptionName [
	^ #title
]

{ #category : #accessing }
XdShareInformation class >> usernameOptionName [
	^ #username
]

{ #category : #asserting }
XdShareInformation >> assertString: aString [
	self 
		assert: [ aString isString ] 
		description: [ 'String must be a string instance' ].
	self 
		assert: [ aString asString == aString ] 
		description: [ 'String must be a string instance' ].
	
]

{ #category : #accessing }
XdShareInformation >> author [
	^ self 
		optionAt: self class authorOptionName 
		ifAbsentPut: [ self emptyString ]
]

{ #category : #accessing }
XdShareInformation >> author: aString [
	self assertString: aString.
	^ self 
		optionAt: self class authorOptionName 
		put: aString
]

{ #category : #accessing }
XdShareInformation >> description [
	^ self 
		optionAt: self class descriptionOptionName 
		ifAbsentPut: [ self emptyString ]
]

{ #category : #accessing }
XdShareInformation >> description: aString [
	self assertString: aString.
	^ self 
		optionAt: self class descriptionOptionName 
		put: aString
]

{ #category : #defaults }
XdShareInformation >> emptyString [
	^ String empty 
]

{ #category : #testing }
XdShareInformation >> hasParts [
	<return: #Boolean>
	^ self hasOptions
]

{ #category : #accessing }
XdShareInformation >> partAt: aType [
	^ self  optionAt: aType ifAbsent: [ '' ]
]

{ #category : #accessing }
XdShareInformation >> partAt: aType put: aValue [
	self optionAt: aType put: aValue
]

{ #category : #enumerating }
XdShareInformation >> partsDo: aBlock [ 
	"aBlock receives aKey and aValue"
	self hasOptions ifFalse: [ ^ self ].
	options keysAndValuesDo: aBlock
]

{ #category : #accessing }
XdShareInformation >> password [
	^ self 
		optionAt: self class passwordOptionName 
		ifAbsentPut: [ self emptyString ]
]

{ #category : #accessing }
XdShareInformation >> password: aString [
	self assertString: aString.
	^ self 
		optionAt: self class passwordOptionName 
		put: aString
]

{ #category : #accessing }
XdShareInformation >> publicUrl [
	^ self 
		optionAt: self class publicUrlOptionName 
		ifAbsentPut: [ self emptyString ]
]

{ #category : #accessing }
XdShareInformation >> publicUrl: aString [
	self assertString: aString.
	^ self 
		optionAt: self class publicUrlOptionName 
		put: aString
]

{ #category : #accessing }
XdShareInformation >> title [
	^ self 
		optionAt: self class titleOptionName 
		ifAbsentPut: [ self emptyString ]
]

{ #category : #accessing }
XdShareInformation >> title: aString [
	self assertString: aString.
	^ self 
		optionAt: self class titleOptionName 
		put: aString
]

{ #category : #accessing }
XdShareInformation >> username [
	^ self 
		optionAt: self class usernameOptionName 
		ifAbsentPut: [ self emptyString ]
]

{ #category : #accessing }
XdShareInformation >> username: aString [
	self assertString: aString.
	^ self 
		optionAt: self class usernameOptionName 
		put: aString
]
