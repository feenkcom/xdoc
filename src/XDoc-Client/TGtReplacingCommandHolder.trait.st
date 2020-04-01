Trait {
	#name : #TGtReplacingCommandHolder,
	#traits : 'TGtDecoratingCommandHolder - {#newDecoratingCommandBuilder}',
	#classTraits : 'TGtDecoratingCommandHolder classTrait',
	#category : #'XDoc-Client-Decorated Command Builder'
}

{ #category : #'accessing - options - decorating commands' }
TGtReplacingCommandHolder >> newDecoratingCommandBuilder [
	^ GtReplacingCommandBuilder new
]

{ #category : #'accessing - options - decorating commands' }
TGtReplacingCommandHolder >> replacingCommand: aCommand [
	self decoratingCommandBuilder replace: aCommand
]
