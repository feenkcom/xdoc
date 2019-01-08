Class {
	#name : #XdClientSettings,
	#superclass : #Object,
	#classInstVars : [
		'xdServerUrl'
	],
	#category : #'XDoc-Client-Settings'
}

{ #category : #accessing }
XdClientSettings class >> defaultLocalXdServerUrl [
	<script: 'self xdServerUrl: self defaultLocalXdServerUrl'>
	^ ZnUrl new 
		scheme: #http;
		host: NetNameResolver loopBackName;
		port: 2019;
		yourself
]

{ #category : #accessing }
XdClientSettings class >> defaultPublicXdServerUrl [
	<script: 'self xdServerUrl: self defaultPublicXdServerUrl'>
	^ 'https://docs.feenk.com' asZnUrl
]

{ #category : #accessing }
XdClientSettings class >> settingsOn: aBuilder [ 
	<systemsettings>
	
	(aBuilder setting: #xdServerUrlString)
		parent: #xd;
		target: self;
		description: 'The URL for the Feenk XD document sharing service';
		label: 'Feenk XD service URL'

]

{ #category : #accessing }
XdClientSettings class >> xdServerUrl [
	^ xdServerUrl ifNil: [ xdServerUrl := self defaultPublicXdServerUrl ]
]

{ #category : #accessing }
XdClientSettings class >> xdServerUrl: aZnUrlOrString [
	xdServerUrl := aZnUrlOrString ifNotNil: [ aZnUrlOrString asZnUrl ]
]

{ #category : #accessing }
XdClientSettings class >> xdServerUrlString [
	^ self xdServerUrl asString
]

{ #category : #accessing }
XdClientSettings class >> xdServerUrlString: aString [
	self xdServerUrl: aString
]
