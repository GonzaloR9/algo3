!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'as yet unclassified' stamp: 'IL 10/1/2022 19:24:17'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := Stack new.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 15:59:07'!
test02StackShouldHaveNoTopWhenCreated

	 | stack |

   	 stack := Stack new.

   	 self should: [stack top] raise: Error  withExceptionDo: 
   	 [ :anError | self assert: Stack thereAreNoElementsErrorDescription equals: anError messageText ]! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:01:24'!
test03StackCantPopWhenCreated

	 | stack |

   	 stack := Stack new.

   	 self should: [stack pop] raise: Error  withExceptionDo: 
   	 [ :anError | self assert: Stack thereAreNoElementsErrorDescription equals: anError messageText ]! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:03:46'!
test04StackCanPushAnElement

	 | stack |

   	 stack := Stack new.
	 stack push: 'River'.
	 self deny: stack isEmpty.	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:04:34'!
test05StackTopIsCorrect

	 | stack |

   	 stack := Stack new.
	 stack push: 'River'.
	 self assert: stack top equals: 'River'.	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:05:37'!
test06StackPopIsCorrect

	 | stack |

   	 stack := Stack new.
	 stack push: 'River'.
	 self assert: stack pop equals: 'River'.	! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:06:58'!
test07StackPopBecomesEmpty

	 | stack |

   	 stack := Stack new.
	 stack push: 'River'.
	 stack pop.
	 self assert: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:07:56'!
test08StackIsLIFO

	 | stack |

   	 stack := Stack new.
	 stack push: 'River'.
	 stack push: 'River2'.
	 self assert: stack pop equals: 'River2'.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:08:57'!
test09StackIsntEmpty

	 | stack |

   	 stack := Stack new.
	 stack push: 'River'.
	 stack push: 'River2'.
	 stack pop.
	 self deny: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:11:03'!
test10StackTopIsCorrectAfterPop

	 | stack |

   	 stack := Stack new.
	 stack push: 'River'.
	 stack push: 'River2'.
	 stack pop.
	 self assert: stack top equals: 'River'.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:12:55'!
test11StackCanPushAnEmptyString

	 | stack |

   	 stack := Stack new.
	 stack push: ''.
	 self deny: stack isEmpty.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:13:37'!
test12StackCanPopAnEmptyString

	 | stack |

   	 stack := Stack new.
	 stack push: ''.
	 self assert: stack pop equals: ''.! !

!StackTest methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:14:27'!
test13StackTopIsAnEmptyString

	 | stack |

   	 stack := Stack new.
	 stack push: ''.
	 self assert: stack top equals: ''.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'values'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 15:38:41'!
initialize
	values := OrderedCollection new.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 15:40:33'!
isEmpty
	^values isEmpty! !

!Stack methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 16:00:53'!
pop
	values isEmpty ifTrue: [^Stack error: Stack thereAreNoElementsErrorDescription].
	^values removeLast.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 15:40:01'!
push: aValue
	values add: aValue.! !

!Stack methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 15:59:44'!
top
	values isEmpty ifTrue: [^Stack error: Stack thereAreNoElementsErrorDescription].
	^values last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'as yet unclassified' stamp: 'gr 10/7/2022 15:48:18'!
thereAreNoElementsErrorDescription
	^'The stack is empty!!'.! !
