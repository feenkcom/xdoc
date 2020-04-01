Trait {
	#name : #TGtReplacingCommandHolder,
	#traits : 'TGtDecoratingCommandHolder - {#newDecoratingCommandBuilder}',
	#category : #'XDoc-Client-Decorating Command Builder'
}

{ #category : #'accessing - options - decorating commands' }
TGtReplacingCommandHolder >> newDecoratingCommandBuilder [
	^ GtReplacingCommandBuilder new
]

{ #category : #'accessing - options - decorating commands' }
TGtReplacingCommandHolder >> replacingCommand: aCommand [
	self decoratingCommandBuilder replace: aCommand
]
