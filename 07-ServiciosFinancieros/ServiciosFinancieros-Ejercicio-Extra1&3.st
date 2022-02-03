!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'accountOne accountTwo portfolioOne portfolioTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:41:29'!
test01PortfolioHaveZeroBalanceWhenCreated 
	
	self assertThatThereIsABalanceOf: 0*peso In: portfolioOne.
! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:41:52'!
test02AddingAccountInPortfolioIncreasesBalanceInPortfolio 
	
	portfolioOne addToGroup: accountOne.
	
	Deposit register: 100 * peso on: accountOne.
		
	self assertThatThereIsABalanceOf: 100*peso In: portfolioOne.

! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:42:17'!
test03AddingMultiplesAccountsInPortfolioIncreasesBalanceInPortfolio 
	
	portfolioOne addToGroup: accountOne.
	portfolioOne addToGroup: accountTwo.
	
	Deposit register: 100 * peso on: accountOne.
	Deposit register: 100 * peso on: accountTwo.
		
	self assertThatThereIsABalanceOf: 200*peso In: portfolioOne.

! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:25:40'!
test04PortfolioKnowsRegisteredTransactions 

	|deposit |
	
	deposit := Deposit register: 100 * peso on: accountOne.
	portfolioOne addToGroup: accountOne.
		
	self assert: (portfolioOne hasRegistered: deposit).

! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:26:11'!
test05EmptyPortfolioDoesNotKnowRegisteredTransactions 

	|deposit |
	
	deposit := Deposit register: 100 * peso on: accountOne.
		
	self deny: (portfolioOne hasRegistered: deposit).

! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:47:41'!
test06PortfolioWithMultiplesAccountsKnowsRegisteredTransactions 
	
	| depositOne depositTwo |
	
	depositOne := Deposit register: 100 * peso on: accountOne.
	depositTwo := Deposit register: 100 * peso on: accountTwo.
	
	portfolioOne addToGroup: accountOne.
	portfolioTwo addToGroup: portfolioOne.
	portfolioTwo addToGroup: accountTwo.
	
	self assert: (portfolioTwo hasRegistered: depositOne).
	self assert: (portfolioTwo hasRegistered: depositTwo).


! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:27:57'!
test07PortfolioKnowsItsTransactions 

	| deposit |
	
	deposit := Deposit register: 50 * peso on: accountOne.
	portfolioOne addToGroup: accountOne.
		
	self assert: 1 equals: portfolioOne transactions size.
	self assert: (portfolioOne transactions includes: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 16:44:41'!
test08PortfolioWithMultiplesAccountsKnowsItsTransactions 

	|depositOne depositTwo |
	
	depositOne := Deposit register: 50 * peso on: accountOne.
	depositTwo := Deposit register: 50 * peso on: accountTwo.

	portfolioOne addToGroup: accountOne.
	portfolioOne addToGroup: accountTwo.

	self assert: 2 equals: portfolioOne transactions size.
	self assert: (portfolioOne transactions includes: depositOne).
	self assert: (portfolioOne transactions includes: depositTwo).! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 17:27:00'!
test09PortfolioCanNotAddSameAccountMoreThanOnce
	
	self
		should: [	portfolioOne addToGroup: accountOne.
				portfolioOne addToGroup: accountOne.
		]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: 'Error' equals: anError messageText].! !

!PortfolioTest methodsFor: 'tests' stamp: 'dd 11/29/2021 18:14:14'!
test10PortfolioCanNotAddItself
		
	self
		should: [	portfolioOne addToGroup: portfolioOne .

		]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: 'Error' equals: anError messageText].! !


!PortfolioTest methodsFor: 'setup' stamp: 'dd 11/29/2021 16:22:58'!
setUp

	accountOne := ReceptiveAccount new.
	accountTwo := ReceptiveAccount new.
	
	portfolioOne := Portfolio new.
	portfolioTwo := Portfolio new.! !


!PortfolioTest methodsFor: 'helpers' stamp: 'dd 11/29/2021 16:40:49'!
assertThatThereIsABalanceOf: anAmount In: aPortfolio 

	self assert: anAmount equals: aPortfolio balance.
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 21:34:48'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'originAccount destinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'private' stamp: 'LNG 11/28/2021 00:38:37'!
assertAnActionWith: aValue raiseAnErrorMessage: anErrorMessage

	self
		should: [Transfer from: originAccount to: destinationAccount for: aValue]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: anErrorMessage].! !


!TransferTest methodsFor: 'tests' stamp: 'LNG 11/28/2021 01:40:24'!
test01BalancesOfOriginAndDestinationAccountsAreAffectedByATransfer
	
	Transfer from: originAccount to: destinationAccount for: (100*peso).
	
	self assert: originAccount balance equals: (-100*peso).
	self assert: destinationAccount balance equals: (100*peso).! !

!TransferTest methodsFor: 'tests' stamp: 'LNG 11/28/2021 01:44:49'!
test02AssertATransferAmountIsTheExpected

	| aTransfer |
	
	aTransfer := Transfer from: originAccount to: destinationAccount for: (10*peso).
	
	self assert: (10*peso) equals: aTransfer balanceValue.! !

!TransferTest methodsFor: 'tests' stamp: 'dd 11/29/2021 15:42:46'!
test03ATransferCannotBeNegative

	self assertAnActionWith: -10 * peso raiseAnErrorMessage: Transfer negativeTransferErrorDescription.
	! !

!TransferTest methodsFor: 'tests' stamp: 'dd 11/29/2021 15:42:35'!
test04ATransferCannotBeZero

	self assertAnActionWith: 0 * peso raiseAnErrorMessage: Transfer emptyTransferErrorDescription.! !

!TransferTest methodsFor: 'tests' stamp: 'dd 11/29/2021 15:42:42'!
test05TransfersKnowTheirCountparts

	| aTransfer |
	aTransfer := Transfer from: originAccount to: destinationAccount for: (10*peso).
	
	self assert: aTransfer depositLeg equals: aTransfer withdrawLeg counterpart.
	self assert: aTransfer withdrawLeg equals: aTransfer depositLeg counterpart.! !


!TransferTest methodsFor: 'setup' stamp: 'LNG 11/26/2021 02:22:37'!
setUp

	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'LNG 11/27/2021 23:33:45'!
balanceValue

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'LNG 11/28/2021 00:05:55'!
register: aValue on: account from: aTransfer

	| transaction |
	
	transaction := self for: aValue from: aTransfer.
	account registerATransfer: aTransfer.
	account register: transaction.		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'private' stamp: 'LNG 11/27/2021 23:33:45'!
balanceValue

	^self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDepositLeg
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/27/2021 23:33:45'!
balanceValue
	
	"cambiar nombre de metodo"
	^value.! !

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/26/2021 01:15:04'!
counterpart

	^transfer withdrawLeg.! !

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/25/2021 18:00:21'!
initializeFor: aValue

	value := aValue.! !

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/27/2021 23:41:41'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDepositLeg class
	instanceVariableNames: ''!

!TransferDepositLeg class methodsFor: 'instance creation' stamp: 'LNG 11/25/2021 18:03:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferDepositLeg class methodsFor: 'instance creation' stamp: 'LNG 11/27/2021 23:41:59'!
for: aValue from: aTransfer

	^self new initializeFor: aValue from: aTransfer.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdrawLeg
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/27/2021 23:33:45'!
balanceValue

	^value negated.! !

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/26/2021 01:15:47'!
counterpart

	^transfer depositLeg.! !

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/27/2021 23:35:26'!
initializeFor: aValue

	value := aValue.! !

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'LNG 11/27/2021 23:38:24'!
initializeFor: aValue from: aTransfer

	value := aValue.
	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdrawLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdrawLeg class
	instanceVariableNames: ''!

!TransferWithdrawLeg class methodsFor: 'instance creation' stamp: 'LNG 11/25/2021 18:10:33'!
for: aValue

	^self new initializeFor: aValue.! !

!TransferWithdrawLeg class methodsFor: 'instance creation' stamp: 'LNG 11/27/2021 23:41:03'!
for: aValue from: aTransfer

	^self new initializeFor: aValue from: aTransfer.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'LNG 11/19/2021 01:03:43'!
value

	^ value.! !


!Withdraw methodsFor: 'private' stamp: 'LNG 11/27/2021 23:33:45'!
balanceValue

	^self value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'LNG 11/27/2021 23:23:01'!
for: aValue

	^ self new initializeFor: aValue.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'group'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'private' stamp: 'dd 11/29/2021 14:51:36'!
copyTransactionsAt: anIndex To: aCollection

	(group at: anIndex) transactions collect: [:item| aCollection add: item]! !

!Portfolio methodsFor: 'private' stamp: 'dd 11/29/2021 14:51:36'!
copyTransactionsFromGroupTo: aCollection
	
	1 to: (group size) do: [:index|  self copyTransactionsAt: index To: aCollection ].
! !


!Portfolio methodsFor: 'initialization' stamp: 'dd 11/29/2021 14:25:47'!
initialize

	group := OrderedCollection new.
! !


!Portfolio methodsFor: 'operations' stamp: 'LNG 11/29/2021 18:16:46'!
addToGroup: anAccountOrPortfolio

	(group includes: anAccountOrPortfolio) ifTrue: [self signalError ].
	
	(anAccountOrPortfolio == self) ifTrue: [self signalError ].
	
	group add: anAccountOrPortfolio.
	! !

!Portfolio methodsFor: 'operations' stamp: 'dd 11/29/2021 14:27:56'!
balance
	
	^group sum: [ :item | item balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'operations' stamp: 'dd 11/29/2021 14:25:47'!
hasRegistered: aTransaction 

	^ group anySatisfy: [:item | item hasRegistered: aTransaction].
! !

!Portfolio methodsFor: 'operations' stamp: 'dd 11/29/2021 14:50:20'!
transactions
	
	| newCollection |
	
	newCollection := OrderedCollection new.
	
	self copyTransactionsFromGroupTo: newCollection.
			
	^newCollection .
! !


!Portfolio methodsFor: 'error message' stamp: 'dd 11/29/2021 17:12:13'!
signalError

	self error: self class errorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'dd 11/29/2021 17:14:09'!
errorMessage

	^'Error'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions transfers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'LNG 11/28/2021 00:00:58'!
initialize

	transactions := OrderedCollection new.
	transfers := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LNG 11/27/2021 23:33:45'!
balance
	
	^transactions sum: [ :aTransaction | aTransaction balanceValue ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LNG 11/28/2021 00:02:32'!
hasRegisteredATransfer: aTransfer

	^ transfers includes: aTransfer.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LNG 11/28/2021 00:03:11'!
registerATransfer: aTransfer

	transfers add: aTransfer.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'anAmount aDepositTransfer aWithdrawTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'LNG 11/26/2021 01:30:07'!
initializeWith: aDepositLeg and: aWithdrawLeg for: anAmountToTransfer

	aDepositTransfer := aDepositLeg.
	aWithdrawTransfer := aWithdrawLeg.
	anAmount := anAmountToTransfer.

	! !


!Transfer methodsFor: 'private' stamp: 'LNG 11/27/2021 23:34:25'!
balanceValue

	^anAmount.! !

!Transfer methodsFor: 'private' stamp: 'LNG 11/26/2021 01:19:12'!
depositLeg

	^aDepositTransfer.! !

!Transfer methodsFor: 'private' stamp: 'LNG 11/26/2021 01:19:37'!
withdrawLeg

	^aWithdrawTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'LNG 11/28/2021 00:12:42'!
from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer 

	| aTransfer aNewDeposit aNewWithdraw |
	
	self validateATransferAmount: anAmountToTransfer.
	
	aTransfer := self new.
	aNewWithdraw := TransferWithdrawLeg register: anAmountToTransfer on: anOriginAccount from: aTransfer.
	aNewDeposit := TransferDepositLeg register: anAmountToTransfer on: aDestinationAccount from: aTransfer.
	
	aTransfer initializeWith: aNewDeposit and: aNewWithdraw for: anAmountToTransfer.
	
	^aTransfer.
	
	! !


!Transfer class methodsFor: 'validation' stamp: 'LNG 11/28/2021 00:27:33'!
validateATransferAmount: anAmount

	(anAmount < 0) ifTrue: [^self error: self negativeTransferErrorDescription].
	(anAmount = 0) ifTrue: [^self error: self emptyTransferErrorDescription].
	
	

	! !


!Transfer class methodsFor: 'error messages' stamp: 'LNG 11/28/2021 00:26:13'!
emptyTransferErrorDescription

	^'Invalid transfer'.! !

!Transfer class methodsFor: 'error messages' stamp: 'LNG 11/28/2021 00:25:41'!
negativeTransferErrorDescription

	^'Invalida negated transfer'.! !
