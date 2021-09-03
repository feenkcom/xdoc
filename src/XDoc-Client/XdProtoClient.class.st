Class {
	#name : 'XdProtoClient',
	#superclass : 'Object',
	#traits : 'TGtAssert',
	#classTraits : 'TGtAssert classTrait',
	#category : 'XDoc-Client-Core'
}

{ #category : 'accessing' }
XdProtoClient >> documents [
	"Download a list of published documents"
	^ self subclassResponsibility
]

{ #category : 'accessing' }
XdProtoClient >> downloadXDocUsingFileInfo: aXdFileInfo [ 
	"Download a XdFile"
	^ self subclassResponsibility
]
