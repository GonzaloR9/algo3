!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #OOStackWithLimitTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackWithLimitTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackWithLimitTest methodsFor: 'testing' stamp: 'gr 10/13/2022 18:37:51'!
test01LimitCanNotBeNegative

	self should: [OOStackWithLimit newWith: -1] raise: Error withExceptionDo: [ :anError | anError messageText = OOStackWithLimit limitStackErrorDescription ].
	
	
	! !

!OOStackWithLimitTest methodsFor: 'testing' stamp: 'gr 10/13/2022 18:38:11'!
test02LimitCanNotBeZero

	self should: [OOStackWithLimit newWith: 0] raise: Error withExceptionDo: [ :anError | anError messageText = OOStackWithLimit limitStackErrorDescription ].
	
	
	! !

!OOStackWithLimitTest methodsFor: 'testing' stamp: 'gr 10/13/2022 18:41:41'!
test03CanPushIfNotFull

	| stack |
	stack := OOStackWithLimit newWith: 1.
	stack push: 'Volve Gallardo'.
	self assert: stack size equals: 1.
	self assert: stack top equals: 'Volve Gallardo'.
	
	
	! !

!OOStackWithLimitTest methodsFor: 'testing' stamp: 'gr 10/13/2022 18:43:39'!
test04CanNotPushIfFull

	| stack |
	stack := OOStackWithLimit newWith: 1.
	stack push: 'Volve Gallardo'.
	self should: [stack push: 'Porfa :('.] raise: Error withExceptionDo: [ :anError | anError messageText = OOStackWithLimit fullStackErrorDescription ].
	self assert: stack size equals: 1.	
	self assert: stack top equals: 'Volve Gallardo'.
	
	
	! !

!OOStackWithLimitTest methodsFor: 'testing' stamp: 'gr 10/13/2022 18:45:14'!
test05CanPopIfFullAndPush

	| stack |
	stack := OOStackWithLimit newWith: 1.
	stack push: 'Volve Gallardo'.
	stack pop.
	stack push: 'Aguante River'.
	self assert: stack size equals: 1.	
	self assert: stack top equals: 'Aguante River'.
	
	
	! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 16:53:24'!
test01FindsThePrefix	

    |stack sFinder|
    stack := OOStack new.
    stack push: 'River'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self assert: (sFinder find:'Ri') equals: (OrderedCollection with: 'River').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 16:57:32'!
test02PrefixCanNotBeEmpty

    |stack sFinder|
    stack := OOStack new.
    stack push: 'River'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self should: [sFinder find: ''] raise: Error withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixStringDescription equals: anError messageText ]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 18:08:10'!
test03PrefixCanNotContainASpace

    |stack sFinder|
    stack := OOStack new.
    stack push: 'River'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self should: [sFinder find: 'Hey !!'] raise: Error withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixStringDescription equals: anError messageText ].
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 19:18:44'!
test04PrefixCanNotBeANumber

    |stack sFinder|
    stack := OOStack new.
    stack push: 'River'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self should: [sFinder find: 4] raise: Error withExceptionDo: [ :anError | self assert: SentenceFinderByPrefix invalidPrefixStringDescription equals: anError messageText ].
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 16:54:03'!
test05FindIsCaseSensitive

    |stack sFinder|
    stack := OOStack new.
    stack push: 'River'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self assert: (sFinder find:'ri') equals: (OrderedCollection new).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 16:54:11'!
test06PrefixNotFound

    |stack sFinder|
    stack := OOStack new.
    stack push: 'River'.
    stack push: 'El mas grande'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self assert: (sFinder find:'Ho') equals: (OrderedCollection new).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 19:19:52'!
test07DoesntFindStackWithEmptyString

    |stack sFinder|
    stack := OOStack new.
    stack push: ''.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self assert: (sFinder find:'Ri') equals: (OrderedCollection new).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 19:17:45'!
test08FindsMoreThanOnePrefix	

    | stack sFinder |
    stack := OOStack new.
    stack push: 'River'.
    stack push: 'River2'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self assert: (sFinder find:'Ri') equals: (OrderedCollection with: 'River2' with: 'River').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 19:20:20'!
test09FindsMoreThanOnePrefixInOrder	

    |stack sFinder|
    stack := OOStack new.
    stack push: 'River'.
    stack push: 'River2'.

    sFinder := SentenceFinderByPrefix newWith: stack.
    self deny: (sFinder find:'Ri') = (OrderedCollection with: 'River' with: 'River2').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 19:21:14'!
test10PrefixInEmptyStack

    |stack sFinder|
    stack := OOStack new.
    

    sFinder := SentenceFinderByPrefix newWith: stack.
    self assert: (sFinder find:'Ho') equals: (OrderedCollection new).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'gr 10/13/2022 17:06:32'!
test11FindsAndDoesntModifyStack

    | stack sFinder |
    stack := OOStack new.
    stack push: 'River'.
    stack push: 'River2'.

    sFinder := SentenceFinderByPrefix newWith: stack.
  

    self assert: stack top equals: 'River2'.
    self assert: stack size equals: 2.
    self assert: (sFinder find:'Ri') equals: (OrderedCollection with: 'River2' with: 'River').! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'values state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'gr 10/10/2022 12:44:10'!
isEmpty
	^values isEmpty.! !


!OOStack methodsFor: 'initialization' stamp: 'gr 10/13/2022 18:03:41'!
initialize
	values := OrderedCollection new.
	state := EmptyStack new.! !


!OOStack methodsFor: 'operations - DD' stamp: 'AP 10/14/2022 11:31:40'!
topValue
	^values first.! !


!OOStack methodsFor: 'operations' stamp: 'AP 10/14/2022 11:50:28'!
pop
	| removedValue |
	removedValue := values remove: self top.
	state := StackState for: self.
	^removedValue
! !

!OOStack methodsFor: 'operations' stamp: 'AP 10/14/2022 11:50:28'!
push: aValue
	values addFirst: aValue.
	state := StackState for: self.! !

!OOStack methodsFor: 'operations' stamp: 'gr 10/10/2022 12:44:42'!
size
	^values size.! !

!OOStack methodsFor: 'operations' stamp: 'AP 10/14/2022 11:37:43'!
top
	"self isEmpty ifTrue:[self error: self class stackEmptyErrorDescription ]."
	^state topFrom: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'gr 10/13/2022 17:08:20'!
stackEmptyErrorDescription	
	^ 'Stack is empty'.! !


!classDefinition: #OOStackWithLimit category: 'Stack-Exercise'!
Object subclass: #OOStackWithLimit
	instanceVariableNames: 'stack limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackWithLimit methodsFor: 'testing' stamp: 'gr 10/13/2022 18:25:53'!
isEmpty
	^stack isEmpty.! !


!OOStackWithLimit methodsFor: 'initialization' stamp: 'gr 10/13/2022 18:26:28'!
initializeWith: aLimit
	stack := OOStack new.
	limit := aLimit.! !


!OOStackWithLimit methodsFor: 'operations' stamp: 'gr 10/13/2022 18:26:57'!
pop
	^stack pop.
! !

!OOStackWithLimit methodsFor: 'operations' stamp: 'gr 10/13/2022 18:27:25'!
push: aValue
	(limit = self size) ifTrue: [^self error: self class fullStackErrorDescription].
	stack push: aValue.! !

!OOStackWithLimit methodsFor: 'operations' stamp: 'gr 10/13/2022 18:25:53'!
size
	^stack size.! !

!OOStackWithLimit methodsFor: 'operations' stamp: 'gr 10/13/2022 18:27:37'!
top
	^stack top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackWithLimit class' category: 'Stack-Exercise'!
OOStackWithLimit class
	instanceVariableNames: ''!

!OOStackWithLimit class methodsFor: 'error descriptions' stamp: 'gr 10/13/2022 18:17:53'!
fullStackErrorDescription
	^'The stack can not add more elements!!'.! !

!OOStackWithLimit class methodsFor: 'error descriptions' stamp: 'gr 10/13/2022 18:30:24'!
limitStackErrorDescription
	^'The limit must be a number bigger than zero!!'.! !

!OOStackWithLimit class methodsFor: 'error descriptions' stamp: 'gr 10/13/2022 18:11:44'!
stackEmptyErrorDescription	
	^ 'Stack is empty'.! !


!OOStackWithLimit class methodsFor: 'instance creation' stamp: 'gr 10/13/2022 18:37:15'!
newWith: aLimit
    | stackWithLimit |
    (aLimit isInteger not or: [ aLimit <= 0]) ifTrue: [^self error: self limitStackErrorDescription].
    stackWithLimit := OOStackWithLimit new.
    stackWithLimit initializeWith: aLimit .
    ^stackWithLimit.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'gr 10/13/2022 16:51:28'!
initializeWith: anOOStack
    stack := anOOStack.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'gr 10/13/2022 17:30:04'!
fillStackWith: desapilados

	^ [desapilados isEmpty not] whileTrue: [stack push: desapilados pop]! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'AP 10/14/2022 11:46:40'!
find: aPrefix

	(self InvalidPrefix: aPrefix) ifTrue: [^self error: self class invalidPrefixStringDescription]. 
	^self selectStringsWithPrefix: aPrefix.
	
	
! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'gr 10/13/2022 17:30:05'!
selectStringsWithPrefix: aPrefixString
	| desapilado desapilados encontrados |
	desapilados := OOStack new.
	encontrados := OrderedCollection new.
	[stack isEmpty not] 
		whileTrue: [
			desapilado := stack pop.
			desapilados push: desapilado.
			(desapilado is: aPrefixString substringAt: 1) ifTrue: [encontrados add: desapilado]].
		
	self fillStackWith: desapilados.
	^encontrados.! !


!SentenceFinderByPrefix methodsFor: 'checking' stamp: 'AP 10/14/2022 11:45:11'!
InvalidPrefix: aPrefix

	^ aPrefix isString not or: [self isInvalidString: aPrefix]! !

!SentenceFinderByPrefix methodsFor: 'checking' stamp: 'gr 10/13/2022 17:15:51'!
isInvalidString: aPrefixString
	^aPrefixString isEmpty or: [((aPrefixString findString: ' ') = 0) not].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'gr 10/13/2022 16:57:04'!
invalidPrefixStringDescription
	^'The prefix must be a string and can not be empty nor contain a space!!'.! !


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'gr 10/13/2022 16:52:02'!
newWith: anOOStack
    | sentenceFinder |
    sentenceFinder := SentenceFinderByPrefix new.
    sentenceFinder initializeWith: anOOStack.
    ^sentenceFinder.! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'operations - DD' stamp: 'gr 10/13/2022 17:57:19'!
topFrom: aStack
	self subclassResponsibility.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'instance creation' stamp: 'AP 10/14/2022 11:21:50'!
for: aStack
	^(self subclasses detect: [:subclass | subclass isStateOf: aStack]) new.! !


!StackState class methodsFor: 'private' stamp: 'gr 10/13/2022 18:01:16'!
isStateOf: aStack
	self subclassResponsibility.! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
StackState subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'operations - DD' stamp: 'AP 10/14/2022 11:40:19'!
topFrom: aStack
	^aStack error: aStack class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'private' stamp: 'gr 10/13/2022 18:00:51'!
isStateOf: aStack
	^aStack isEmpty.! !


!classDefinition: #NotEmptyStack category: 'Stack-Exercise'!
StackState subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'operations - DD' stamp: 'gr 10/11/2022 21:26:14'!
topFrom: aStack
	^aStack topValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack-Exercise'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'private' stamp: 'gr 10/13/2022 18:00:51'!
isStateOf: aStack
	^aStack isEmpty not.! !
