Class {
	#name : #GtDecoratingCommandBuilderExamples,
	#superclass : #Object,
	#instVars : [
		'commands'
	],
	#category : #'XDoc-Client-Decorated Command Builder'
}

{ #category : #'examples - commands' }
GtDecoratingCommandBuilderExamples >> anotherPostExecutionExampleCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicAnotherPostExecutionExampleCommand.
	aValuable := [ :aSubCommand | aSubCommand result: 72 ].
	aCommand valuable: aValuable.
	self assert: aCommand command equals: nil.
	self assert: aCommand valuable equals: aValuable.
	^ aCommand
]

{ #category : #'examples - commands' }
GtDecoratingCommandBuilderExamples >> basicAnotherPostExecutionExampleCommand [
	<gtExample>
	| aCommand |
	aCommand := GtAnotherValuablePostExecutionExampleCommand new.
	self assert: aCommand command equals: nil.
	^ aCommand
]

{ #category : #'examples - builder' }
GtDecoratingCommandBuilderExamples >> basicBuilder [
	<gtExample>
	| aBuilder |
	aBuilder := GtReplacingCommandBuilder new.
	self assert: aBuilder commands size isZero.
	^ aBuilder
]

{ #category : #'examples - commands' }
GtDecoratingCommandBuilderExamples >> basicPostExecutionExampleCommand [
	<gtExample>
	| aCommand |
	aCommand := GtValuablePostExecutionExampleCommand new.
	self assert: aCommand command equals: nil.
	^ aCommand
]

{ #category : #'examples - builder' }
GtDecoratingCommandBuilderExamples >> builderWithOnePostExecutionCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self basicBuilder.
	aCommand := self postExecutionExampleCommand.
	aBuilder command: aCommand.
	self assert: aBuilder commands size equals: 1.
	self assert: aBuilder commands first equals: aCommand.
	^ aBuilder
]

{ #category : #'examples - builder' }
GtDecoratingCommandBuilderExamples >> builderWithTwoPostExecutionCommands [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self builderWithOnePostExecutionCommand.
	aCommand := self anotherPostExecutionExampleCommand.
	aBuilder command: aCommand.
	self assert: aBuilder commands size equals: 2.
	self assert: aBuilder commands second equals: aCommand.
	^ aBuilder
]

{ #category : #'examples - builder' }
GtDecoratingCommandBuilderExamples >> builderWithTwoPostExecutionCommands_FirstReplaced [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self builderWithTwoPostExecutionCommands.
	aCommand := self postExecutionExampleCommand.
	aBuilder replace: aCommand.
	self assert: aBuilder commands size equals: 2.
	self assert: aBuilder commands first equals: aCommand.
	^ aBuilder
]

{ #category : #'examples - builder' }
GtDecoratingCommandBuilderExamples >> builderWithTwoPostExecutionCommands_SecondReplaced [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self builderWithTwoPostExecutionCommands.
	aCommand := self anotherPostExecutionExampleCommand.
	aBuilder replace: aCommand.
	self assert: aBuilder commands size equals: 2.
	self assert: aBuilder commands second equals: aCommand.
	^ aBuilder
]

{ #category : #'examples - decorated commands' }
GtDecoratingCommandBuilderExamples >> decoratedCommandWithOnePostExecutionCommand [
	<gtExample>
	| aBuilder aCommand aDecoratedCommand |
	aBuilder := self builderWithOnePostExecutionCommand.
	aCommand := self exampleCommand.
	aDecoratedCommand := aBuilder decorateCommand: aCommand.

	self assert: aBuilder commands first command isNil.

	self assert: aDecoratedCommand ~= aBuilder commands first.
	self assert: aDecoratedCommand class equals: aBuilder commands first class.
	self assert: aDecoratedCommand command equals: aCommand.
	^ aDecoratedCommand
]

{ #category : #'examples - decorated commands' }
GtDecoratingCommandBuilderExamples >> decoratedCommandWithTwoPostExecutionCommands [
	<gtExample>
	| aBuilder aCommand aDecoratedCommand |
	aBuilder := self builderWithTwoPostExecutionCommands.
	aCommand := self exampleCommand.
	aDecoratedCommand := aBuilder decorateCommand: aCommand.
	self assert: aBuilder commands first command isNil.
	self assert: aBuilder commands second command isNil.

	self assert: aDecoratedCommand ~= aBuilder commands first.
	self assert: aDecoratedCommand class equals: aBuilder commands second class.
	self assert: aDecoratedCommand command class equals: aBuilder commands first class.

	self assert: aDecoratedCommand ~= aBuilder commands second.
	self assert: aDecoratedCommand class equals: aBuilder commands second class.
	self assert: aDecoratedCommand command command equals: aCommand.
	^ aDecoratedCommand
]

{ #category : #'examples - commands' }
GtDecoratingCommandBuilderExamples >> exampleCommand [
	<gtExample>
	| aCommand |
	aCommand := GtValuableExampleCommand new.
	self assert: aCommand result equals: nil.
	aCommand execute.
	self assert: aCommand result equals: nil.
	^ aCommand
]

{ #category : #'examples - commands' }
GtDecoratingCommandBuilderExamples >> exampleCommandWithValuable [
	<gtExample>
	| aCommand aValuable |
	aCommand := self exampleCommand.
	aValuable := [ 42 ].
	aCommand valuable: aValuable.
	self assert: aCommand valuable equals: aValuable.
	self assert: aCommand result isNil.
	^ aCommand
]

{ #category : #'examples - execution' }
GtDecoratingCommandBuilderExamples >> executionWithOneDecoratedCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self builderWithOnePostExecutionCommand.
	aCommand := self exampleCommandWithValuable.
	aBuilder execute: aCommand.
	self assert: aCommand result equals: 108.
	^ aCommand
]

{ #category : #'examples - execution' }
GtDecoratingCommandBuilderExamples >> executionWithTwoDecoratedCommands [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self builderWithTwoPostExecutionCommands.
	aCommand := self exampleCommandWithValuable.
	aBuilder execute: aCommand.
	self assert: aCommand result equals: 72.
	self assert: aBuilder commands first command isNil.
	self assert: aBuilder commands second command isNil.
	^ aCommand
]

{ #category : #'examples - execution' }
GtDecoratingCommandBuilderExamples >> executionWithoutDecoratedCommand [
	<gtExample>
	| aBuilder aCommand |
	aBuilder := self basicBuilder.
	aCommand := self exampleCommandWithValuable.
	aBuilder execute: aCommand.
	self assert: aCommand result equals: 42.
	^ aCommand
]

{ #category : #'examples - commands' }
GtDecoratingCommandBuilderExamples >> postExecutionExampleCommand [
	<gtExample>
	| aCommand aValuable |
	aCommand := self basicPostExecutionExampleCommand.
	aValuable := [ :aSubCommand | aSubCommand result: 108 ].
	aCommand valuable: aValuable.
	self assert: aCommand command equals: nil.
	self assert: aCommand valuable equals: aValuable.
	^ aCommand
]
