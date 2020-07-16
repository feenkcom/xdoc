Class {
	#name : #XdKeyDocumentStoreExamples,
	#superclass : #Object,
	#instVars : [
		'documentStore'
	],
	#category : #'XDoc-Store-Examples'
}

{ #category : #cleanup }
XdKeyDocumentStoreExamples >> cleanUp [ 

	documentStore ifNotNil: 
		[ documentStore location ensureDeleteAll.
		documentStore := nil ]
]

{ #category : #'examples - date and time' }
XdKeyDocumentStoreExamples >> dateAndTime [
	<gtExample>
	| aDateAndTime |
	aDateAndTime := DateAndTime readFrom: '2020-04-06T08:55:02.973079+02:00' readStream.
	self assert: aDateAndTime nanoSecond isZero not.
	^ aDateAndTime
]

{ #category : #examples }
XdKeyDocumentStoreExamples >> dateAndTimeFrom [
	<gtExample>
	| aFileName aStore aDateAndTime |
	aFileName := self filename.
	aStore := XdKeyDocumentStore new.
	aDateAndTime := aStore dateAndTimeFrom: aFileName.
	self assert: aDateAndTime equals: self dateAndTimeRoundedToSeconds.
	^ aDateAndTime
]

{ #category : #'examples - date and time' }
XdKeyDocumentStoreExamples >> dateAndTimeRoundedToSeconds [
	<gtExample>
	| aDateAndTime aRounded |
	aDateAndTime := self dateAndTime.
	aRounded := aDateAndTime - 0.973079 asSeconds.
	self assert: aRounded nanoSecond equals: 0.
	^ aRounded
]

{ #category : #examples }
XdKeyDocumentStoreExamples >> documentStore [
	"Answer a xdoc document store in a temporary location that can be used for testing"
	<gtExample>
	| key root |

	documentStore ifNotNil: [ ^documentStore ].

	key := 'XdKeyDocumentStoreExamples/Examples'.
	root := FileReference newTempFilePrefix: self class name, '-' suffix: '-store'.
	root ensureCreateDirectory.
	documentStore := XdKeyDocumentStore
					forKey: key
					rootDirectory: root.
	self 
		assert: documentStore location 
		equals: root / key.
	self assert: documentStore location isDirectory.
	^ documentStore
]

{ #category : #examples }
XdKeyDocumentStoreExamples >> filename [
	"XdKeyDocumentStore names files using 'YYYY-MM-DD-HH-MM-SS.xdoc' in UTC time"
	<gtExample>
	| time store fn |

	time := self dateAndTime.
	store := XdKeyDocumentStore new.
	fn := store filenameFor: time.
	self
		assert: fn
		equals: '2020-04-06-06-55-02.xdoc'.
	^ fn
]

{ #category : #tests }
XdKeyDocumentStoreExamples >> filenameConflictTest [
	<gtExample>
	"Ensure that three filenames created in quick succession don't conflict"

	| filenames timestamps |

	filenames := Array streamContents: [ :stream |
		3 timesRepeat: [ stream nextPut: self documentStore newFile ensureCreateFile ] ].
	self assert: filenames first ~= filenames second.
	self assert: filenames first ~= filenames third.
	self assert: filenames second ~= filenames third.

	timestamps := filenames collect: [ :fn |
		self documentStore dateAndTimeFrom: fn ].
	self assert: (timestamps second between: timestamps first and: timestamps third).
	self assert: (timestamps third - timestamps first) < 6 seconds.

]

{ #category : #'examples - creation' }
XdKeyDocumentStoreExamples >> sampleDocument: aString [
	"Answer a stored text document with the supplied contents"
	| xdfr xdWriter xdFile |

	xdfr := self documentStore newFile.
	xdWriter := XdWriter new.
	xdWriter
		streamingStrategy: (XdStreamingStrategy file: xdfr);
		authorName: self class name;
		title: 'Sample Document';
		description: 'Created with #sampleDocument:';
		text;
		attachment: 'source.txt' text: aString.
		xdFile := xdWriter write.
		^ xdFile.
]

{ #category : #tests }
XdKeyDocumentStoreExamples >> twoDocumentTest [
	"Confirm the stores operation by creating two documents, checking their timestamps and retrieval"
	<gtExample>
	<after: #cleanUp>
	| doc1 doc2 xdReader xDoc contents |

	doc1 := self sampleDocument: 'document one'.
	doc2 := self sampleDocument: 'document two'.
	1 second wait.
	"Modify the first document so it has a later file modified time"
	doc1 writer 
		text;
		attachment: 'source.txt' text: 'document one take two';
		write.

	"Retrieve the latest file by name and check it is doc2".
	xdReader := XdReader new.
	xDoc := xdReader
		streamingStrategy: (XdStreamingStrategy file: self documentStore latestFilename);
		read.
	contents := (xDoc memberNamed: 'source.txt') contents utf8Decoded.
	self
		assert: contents
		equals: 'document two'.

	"Retrieve the latest file by modification time and check it is doc1".
	xdReader := XdReader new.
	xDoc := xdReader
		streamingStrategy: (XdStreamingStrategy file: self documentStore latestModifiedFilename);
		read.
	contents := (xDoc memberNamed: 'source.txt') contents utf8Decoded.
	self
		assert: contents
		equals: 'document one take two'.
	^ { doc1. doc2. }
]
