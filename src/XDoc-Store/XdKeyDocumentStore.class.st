"
XdKeyDocumentStore stores executable documents (.xdoc) by a key and timestamp.

The default key is the class name of the calling object, but may be a hierarchy similar to a unix path name, e.g. 'JSLink/Map', which would be used for storing playgrounds of JavaScript Map objects.

Files in the store are named by UTC timestamp.


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
!!Internal Representation and Key Implementation Points.

!!!Instance Variables
	location:		<FileReference>


!!!Implementation Points

The store assumes that files are not written rapidly, i.e. less than one per second.  File name conflicts are avoided by simply incrementing the timestamp by 1 second.
"
Class {
	#name : #XdKeyDocumentStore,
	#superclass : #Object,
	#instVars : [
		'location'
	],
	#category : #'XDoc-Store-Model'
}

{ #category : #accessing }
XdKeyDocumentStore class >> default [ 
	"Answer the default store for the sender"

	^ self forKey: (thisContext sender receiver class name)
]

{ #category : #accessing }
XdKeyDocumentStore class >> forKey: aString [
	"Answer an instance for the supplied relative path name"

	^ self 
		forKey: aString 
		rootDirectory: XdPlaygroundSettings directory
]

{ #category : #accessing }
XdKeyDocumentStore class >> forKey: aString rootDirectory: aFileReference [
	"Answer an instance for the supplied relative path name"
	| root |

	root := aFileReference asFileReference.
	"The root directory parent must exist"
	self 
		assert: root parent isDirectory
		description: 'The xdoc store parent directory must already exist'.
	root ensureCreateDirectory.
	^ self new location: aFileReference / aString

]

{ #category : #private }
XdKeyDocumentStore >> dateAndTimeFrom: aFileReference [
	"Answer the timestamp encoded in the supplied filename"

	^ DateAndTime readFrom: aFileReference asFileReference basenameWithoutExtension readStream 
]

{ #category : #private }
XdKeyDocumentStore >> filenameFor: aDateAndTime [
	"Answer the filename used for the supplied timestamp"
	| utc |

	utc := aDateAndTime asUTC.
	^ String streamContents: [ :stream |
		BasicDatePrinter default printYMD: utc asDate withLeadingSpace: false on: stream.
		stream << ' '.
		utc hour printOn: stream base: 10 length: 2 padded: true.
		stream << ':'.
		utc minute printOn: stream base: 10 length: 2 padded: true.
		stream << ':'.
		utc seconds printOn: stream base: 10 length: 2 padded: true.
		stream << '.xdoc' ].
]

{ #category : #accessing }
XdKeyDocumentStore >> latestFilename [
	"Answer the most recent document, based on file name"
	| sorter sortedNames |

	sorter := self location childrenMatching: '*.xdoc'.
	sorter ifEmpty: [ ^nil ].
	sortedNames := (sorter collect: 
		[ :reference | reference -> (self dateAndTimeFrom: reference) ])
			sorted: [ :a :b | a value > b value ].
	^ sortedNames first key.

]

{ #category : #accessing }
XdKeyDocumentStore >> latestModifiedFilename [
	"Answer the most recently modified document, based on file modification time"
	| sortedNames |

	sortedNames := (self location childrenMatching: '*.xdoc')
		sorted: [ :a :b | a modificationTime > b modificationTime ].
	^ sortedNames 
		ifEmpty: [ nil ]
		ifNotEmpty: [ sortedNames first ].

]

{ #category : #accessing }
XdKeyDocumentStore >> location [
	^ location
]

{ #category : #accessing }
XdKeyDocumentStore >> location: aFileReference [
	"Set the receiver's location"

	location := aFileReference asFileReference.
	location ensureCreateDirectory.


]

{ #category : #accessing }
XdKeyDocumentStore >> newFile [ 
	"Answer a new file based on the current time.
	See the class comments for further information on the file name strategy."
	| timestamp reference |

	timestamp := DateAndTime now.
	reference := self location / (self filenameFor: timestamp).
	[ reference exists ] whileTrue:
		[ timestamp := timestamp + 1 second.
		reference := self location / (self filenameFor: timestamp) ].
	^ reference
]
