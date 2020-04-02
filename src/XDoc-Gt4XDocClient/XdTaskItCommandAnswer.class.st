Class {
	#name : #XdTaskItCommandAnswer,
	#superclass : #XdCommandAnswer,
	#instVars : [
		'future',
		'backgroundAnswer'
	],
	#category : #'XDoc-Gt4XDocClient-Commands'
}

{ #category : #'private - answers' }
XdTaskItCommandAnswer >> answerFromCommand: aCommand [
	<return: #XdCommandAnswer>
	self backgroundAnswer ifNotNil: [ :anAnswer | ^ anAnswer ].
	self backgroundAnswer: (XdCommandAnswerBuilder new
		commandChain: aCommand;
		build).
	^ self backgroundAnswer
]

{ #category : #'private - answers' }
XdTaskItCommandAnswer >> answerFromException: anException [
	<return: #XdCommandAnswer>
	self backgroundAnswer ifNotNil: [ :anAnswer | ^ anAnswer ].
	self backgroundAnswer: (XdExceptionAnswer new exception: anException).
	^ self backgroundAnswer
]

{ #category : #accessing }
XdTaskItCommandAnswer >> backgroundAnswer [
	^ backgroundAnswer
]

{ #category : #accessing }
XdTaskItCommandAnswer >> backgroundAnswer: aXdCommandAnswer [
	self 
		assert: [ aXdCommandAnswer isNotNil ] 
		description: [ 'Background answer must be non-nil' ].
	backgroundAnswer := aXdCommandAnswer.
]

{ #category : #accessing }
XdTaskItCommandAnswer >> future [
	<return: #TKTFuture>
	^ future
]

{ #category : #accessing }
XdTaskItCommandAnswer >> future: aTKTFuture [
	self 
		assert: [ aTKTFuture isNotNil ] 
		description: [ 'TaskIt Future must be non-nil' ].
	future := aTKTFuture.
	self subscribeFutureCallbacks.
]

{ #category : #'api - subscriptions' }
XdTaskItCommandAnswer >> onFailureDo: aCallback [
	self onPrivateFailureDo: [ :anException | 
		aCallback value: (self answerFromException: anException) ].
	
]

{ #category : #'private - subscriptions' }
XdTaskItCommandAnswer >> onPrivateFailureDo: aCallback [
	self future onFailureDo: aCallback
]

{ #category : #'private - subscriptions' }
XdTaskItCommandAnswer >> onPrivateSuccessDo: aCallback [
	self future onSuccessDo: aCallback
]

{ #category : #'api - subscriptions' }
XdTaskItCommandAnswer >> onSuccessDo: aCallback [
	self onPrivateSuccessDo: [ :aSubCommand | 
		aCallback value: (self answerFromCommand: aSubCommand) ].	
]

{ #category : #'private - subscriptions' }
XdTaskItCommandAnswer >> subscribeFutureCallbacks [
	self onPrivateSuccessDo: [ :aSubCommand | 
		self answerFromCommand: aSubCommand ].
	self onPrivateFailureDo: [ :anException | 
		self answerFromException: anException ].
	
]
