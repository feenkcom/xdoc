Class {
	#name : #XdClientSettings,
	#superclass : #Object,
	#classInstVars : [
		'xdServerUrl',
		'downloadDirectory'
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
XdClientSettings class >> defaultNewPublicXdServerUrl [
	<script: 'self xdServerUrl: self defaultNewPublicXdServerUrl'>
	^ 'https://publish.lepiter.com' asZnUrl
]

{ #category : #accessing }
XdClientSettings class >> defaultPublicXdServerUrl [
	<script: 'self xdServerUrl: self defaultPublicXdServerUrl'>
	^ 'https://blog.feenk.com' asZnUrl
]

{ #category : #accessing }
XdClientSettings class >> downloadDirectory [
	<return: #FileReference>
	^ downloadDirectory ifNil: [ downloadDirectory := FileLocator localDirectory / 'xdocs' ].
]

{ #category : #accessing }
XdClientSettings class >> makeLocalServerCurrent [
	self xdServerUrl: self defaultLocalXdServerUrl
]

{ #category : #accessing }
XdClientSettings class >> makePublicServerCurrent [
	self xdServerUrl: self defaultNewPublicXdServerUrl
]

{ #category : #accessing }
XdClientSettings class >> settingsOn: aBuilder [ 
	<systemsettings>
	
	(aBuilder group: #xdoc)
		parent: #tools;
		label: 'XDoc'
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
XdClientSettings class >> xdServerUrlSettingOn: aBuilder [ 
	<systemsettings>
	
	(aBuilder setting: #xdServerUrlString)
		parent: #xdoc;
		target: self;
		description: 'The URL for the Feenk XDoc sharing service';
		label: 'Feenk XDoc service URL'

]

{ #category : #accessing }
XdClientSettings class >> xdServerUrlString [
	^ self xdServerUrl asString
]

{ #category : #accessing }
XdClientSettings class >> xdServerUrlString: aString [
	self xdServerUrl: aString
]
