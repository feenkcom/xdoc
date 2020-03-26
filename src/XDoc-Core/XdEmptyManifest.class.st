Class {
	#name : #XdEmptyManifest,
	#superclass : #XdNullModel,
	#category : #'XDoc-Core-Model'
}

{ #category : #accessing }
XdEmptyManifest >> attachments [
	^ #()
]

{ #category : #accessing }
XdEmptyManifest >> author [
	^ ''
]

{ #category : #accessing }
XdEmptyManifest >> description [
	^ ''
]

{ #category : #accessing }
XdEmptyManifest >> documents [
	^ #()
]

{ #category : #convenience }
XdEmptyManifest >> numberOfDocuments [
	<return: #Integer>
	^ 0
]

{ #category : #accessing }
XdEmptyManifest >> title [
	^ ''
]
