!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'LNG 11/1/2021 19:52:29'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stackSentences finder prefixOne prefixTwo prefixThree prefixFour prefixFive prefixSix prefixSeven auxiliarStack sentencesList expected result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'dd 11/4/2021 03:23:14'!
setUp

	stackSentences := OOStack new.
	finder := SentenceFinderByPrefix new.
	auxiliarStack := OOStack new.
	sentencesList := #('winter is coming' 'winning is everything' 'The winds of Winter' 'Winter is here').
	
	self fill: stackSentences with: sentencesList.
	self fill: auxiliarStack with: sentencesList.
	
	prefixOne := ''.
	prefixTwo := ' '.
	prefixThree := 'Wint'.
	prefixFour := 'wint'.
	prefixFive := 'Winter '.
	prefixSix := 'Wont'.
	prefixSeven := 'win'.
! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LNG 11/4/2021 13:18:56'!
test01CanNotUseAnEmptyPrefix
	
	| error |
	error := SentenceFinderByPrefix prefixCanNotBeEmptyErrorMessage.
	self assertErrorTypeIs: error usingFinderWith: prefixOne in: stackSentences.

	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LNG 11/4/2021 11:40:46'!
test02CanNotUseAPrefixWithWhiteSpaceCharacter

	| error |
	error := SentenceFinderByPrefix prefixCanNotHaveEmptySpacesErrorMessage.
	self assertErrorTypeIs: error usingFinderWith: prefixTwo in: stackSentences.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LNG 11/4/2021 11:20:00'!
test03UsingAValidPrefixWithCapitalLetterReturnsOneSentence

	expected := OrderedCollection with: 'Winter is here'.	
	result := finder findSentencesWith: prefixThree In: stackSentences.	
	
	self elementsIn: result areTheSameThatIn: expected.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'dd 11/4/2021 04:31:48'!
test04UsingAValidPrefixWithLowerCaseReturnsOneSentence

	expected := OrderedCollection with: 'winter is coming'.
	result := finder findSentencesWith: prefixFour In: stackSentences.
	
	self elementsIn: result areTheSameThatIn: expected.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LNG 11/4/2021 11:31:46'!
test05CanNotUseAPrefixThatIncludesAWhiteSpaceCharacter
		
	| error |
	error := SentenceFinderByPrefix prefixCanNotHaveEmptySpacesErrorMessage.
	self assertErrorTypeIs: error usingFinderWith: prefixFive in: stackSentences.
		! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LNG 11/4/2021 13:44:06'!
test06PrefixWithoutMatchReturnsAnEmptyCollection
	
	result := finder findSentencesWith: prefixSix In: stackSentences.

	self assert: (result isEmpty).
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LNG 11/4/2021 13:44:55'!
test07PrefixWithMultipleMatchesReturnsACollectionWithTwoSentences
	
	expected := OrderedCollection with: 'winning is everything' with: 'winter is coming'.
	result := finder findSentencesWith: prefixSeven In: stackSentences.
			
	self elementsIn: result areTheSameThatIn: expected.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'dd 11/4/2021 04:35:42'!
test08StackRemainsIntactWhenASentenceIsFound
	
	result := finder findSentencesWith: prefixThree In: stackSentences.
	
	self assertThat: stackSentences isEqualTo: auxiliarStack.
	






! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'dd 11/4/2021 04:36:21'!
test09StackRemainsIntactWhenASentenceIsNotFound
	
	result := finder findSentencesWith: prefixSix In: stackSentences.
	
	self assertThat: stackSentences isEqualTo: auxiliarStack.







! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LNG 11/4/2021 13:23:01'!
test10StackRemainsIntactWhenAnErrorOcurred
		
	| error |
	error := SentenceFinderByPrefix prefixCanNotHaveEmptySpacesErrorMessage.
	self assertErrorTypeIs: error usingFinderWith: prefixTwo in: stackSentences.
				
	self assertThat: stackSentences isEqualTo: auxiliarStack.







! !


!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'dd 11/4/2021 03:58:27'!
assertErrorTypeIs: anError usingFinderWith: aPrefix in: aStack

	self
		should: [ finder findSentencesWith: aPrefix In: aStack]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :each |
			self assert: each messageText = anError]! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'dd 11/4/2021 04:12:44'!
assertThat: aStack isEqualTo: anotherStack

	aStack size timesRepeat: [
		self assert: (aStack  pop) equals: (anotherStack pop).
	]! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'dd 11/4/2021 03:52:13'!
elementsIn: aCollection areTheSameThatIn: anotherCollection

	aCollection allSatisfy: [ :each | anotherCollection includes: each].
! !

!SentenceFinderByPrefixTest methodsFor: 'helpers' stamp: 'dd 11/4/2021 03:19:24'!
fill: aStack with: aList
	
	1 to: (aList size) do: [:x | aStack  push: (aList at: x)].
! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack operations' stamp: 'LNG 11/4/2021 13:26:59'!
pop
	
	[^elements removeFirst] on: Error do: [self error: OOStack stackEmptyErrorDescription].

	
	! !

!OOStack methodsFor: 'stack operations' stamp: 'LNG 11/4/2021 13:26:59'!
push: anObject

	elements addFirst: anObject.
	

	! !

!OOStack methodsFor: 'stack operations' stamp: 'LNG 11/4/2021 13:26:59'!
size

	^elements size! !

!OOStack methodsFor: 'stack operations' stamp: 'LNG 11/4/2021 13:26:59'!
top
	
	[^elements first] on: Error do: [self error: OOStack stackEmptyErrorDescription].
	


	
! !


!OOStack methodsFor: 'initialization' stamp: 'LNG 11/4/2021 13:26:59'!
initialize 
	
	elements := OrderedCollection new.! !


!OOStack methodsFor: 'testing' stamp: 'LNG 11/4/2021 13:26:59'!
isEmpty

	^elements isEmpty.

	

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'public' stamp: 'LNG 11/4/2021 17:39:45'!
findSentencesWith: aPrefix In: aStack

	| auxStack sentencesCollection |
	
	self verifyValidationOf: aPrefix and: aStack.
	
	auxStack := OOStack new.
	sentencesCollection := OrderedCollection new.
	
	self fill: sentencesCollection withSentencesFrom: aStack using: aPrefix andPushThemTo: auxStack.
	self fill: aStack with: auxStack.
	^sentencesCollection.
	
	! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LNG 11/4/2021 13:31:20'!
fill: aStack with: anotherStack

	^ (anotherStack size) timesRepeat: [
		aStack push: anotherStack pop.
		]! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'LNG 11/4/2021 17:39:45'!
fill: aCollection withSentencesFrom: aStack using: aPrefix andPushThemTo: anAuxiliarStack
	
	(aStack size) timesRepeat: [
		| actualSentence | 
		actualSentence := aStack pop.
		(actualSentence beginsWith: aPrefix ) ifTrue: [aCollection add: actualSentence].
		anAuxiliarStack push: actualSentence.
		].
	! !


!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'LNG 11/4/2021 11:59:37'!
verifyValidationOf: aPrefix and: aStack

	(aPrefix = '') ifTrue: [^self error: self class prefixCanNotBeEmptyErrorMessage].
	
	(aPrefix includesSubString: ' ') ifTrue: [^self error: self class prefixCanNotHaveEmptySpacesErrorMessage].
	
	(aStack isEmpty) ifTrue: [^OOStack stackEmptyErrorDescription].
	
	

	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'LNG 11/3/2021 00:40:01'!
prefixCanNotBeEmptyErrorMessage

	^'Prefix can not be empty'.! !

!SentenceFinderByPrefix class methodsFor: 'error messages' stamp: 'LNG 11/3/2021 00:41:28'!
prefixCanNotHaveEmptySpacesErrorMessage

	^'Prefix can not have empty spaces'.! !
