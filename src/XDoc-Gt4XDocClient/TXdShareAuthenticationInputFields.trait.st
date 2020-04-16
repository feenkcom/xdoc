Trait {
	#name : #TXdShareAuthenticationInputFields,
	#category : #'XDoc-Gt4XDocClient-Dialog - Traits'
}

{ #category : #streams }
TXdShareAuthenticationInputFields >> authenticationLabelsAndInputFieldsOn: aStream [
	aStream
		nextPut: self newUserLabel;
		nextPut: self newUserInputField;
		nextPut: self newPasswordLabel;
		nextPut: self newPasswordInputField.
]

{ #category : #streams }
TXdShareAuthenticationInputFields >> labelsAndInputFieldsOn: aStream [
	super labelsAndInputFieldsOn: aStream.
	aStream nextPut: self newHorizontalSeparatorElement.
	self authenticationLabelsAndInputFieldsOn: aStream.
]
