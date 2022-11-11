!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'firstAccount secondAccount aPortfolio anotherPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:51:50'!
test01InitialBalanceForPortfolioIsCorrect
	
	self assert: 0*peso equals: aPortfolio balance.
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:51:50'!
test02PortfolioWithTransactionHasCorrectBalance
	
	Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount: firstAccount.
	self assert: 100*peso equals: aPortfolio balance.
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:51:50'!
test03PortfolioWithMultipleTransactionHasCorrectBalance
	
	Deposit register: 100 * peso on: firstAccount.
	Deposit register: 200 * peso on: secondAccount.
	aPortfolio addAccount: firstAccount.
	aPortfolio addAccount: secondAccount.
	self assert: 300*peso equals: aPortfolio balance.
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:51:50'!
test04PortfolioKnowsRegisteredTransaction
	| deposit |
	
	deposit := Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount: firstAccount.
	self assert: (aPortfolio hasRegistered: deposit).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:51:50'!
test05PortfolioKnowsMultipleRegisteredTransactions
	| deposit withdraw |
	deposit := Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount: firstAccount.
	withdraw := Withdraw register: 50 * peso on: secondAccount.
	self deny: (aPortfolio hasRegistered: withdraw).
	self assert: (aPortfolio hasRegistered: deposit).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:51:50'!
test06PortfolioWithOneAccountKnowsItsTransactions
	| deposit |
	
	deposit := Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount: firstAccount.
	self assert: (OrderedCollection with: deposit) equals: (aPortfolio transactions).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:51:50'!
test07PortfolioWithMultipleAccountsKnowsItsTransactions
	
	Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount: firstAccount.
	Withdraw register: 50 * peso on: secondAccount.
	aPortfolio addAccount: secondAccount.
	self assert: (firstAccount transactions, (secondAccount transactions)) equals: (aPortfolio transactions).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:52:00'!
test08PortfolioWithAnotherPortfolioKnowsItsBalance
	
	Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount:firstAccount.
	
	anotherPortfolio addAccount: aPortfolio.
	self assert: 100*peso equals: (anotherPortfolio balance).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:52:00'!
test09PortfolioWithAnotherPortfolioKnowsItsTransactions

	Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount: firstAccount.
	
	anotherPortfolio addAccount: aPortfolio.
	self assert: firstAccount transactions equals: (anotherPortfolio transactions).
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:52:00'!
test10PortfolioWithAnotherPortfolioKnowsItsRegisteredTransactions
	| deposit |

	deposit := Deposit register: 100 * peso on: firstAccount.
	aPortfolio addAccount: firstAccount.
	
	anotherPortfolio addAccount: aPortfolio.
	self assert: (anotherPortfolio hasRegistered: deposit).
	! !


!PortfolioTest methodsFor: 'setUp/tearDown' stamp: 'gr 11/10/2022 20:52:00'!
setUp
	firstAccount:=ReceptiveAccount new.
	secondAccount:=ReceptiveAccount new.
	aPortfolio:=PortfolioAccount new.
	anotherPortfolio:=PortfolioAccount new.! !


!classDefinition: #PortfoliosValidosTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfoliosValidosTest
	instanceVariableNames: 'firstAccount secondAccount aPortfolio anotherPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfoliosValidosTest methodsFor: 'setUp/tearDown' stamp: 'gr 11/10/2022 20:53:08'!
setUp
	firstAccount:=ReceptiveAccount new.
	secondAccount:=ReceptiveAccount new.
	aPortfolio:=PortfolioAccount new.
	anotherPortfolio:=PortfolioAccount new.! !


!PortfoliosValidosTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:03'!
test01PortfolioCanNotAddSameAccountTwice
	aPortfolio addAccount: firstAccount.
	self should:[aPortfolio addAccount: firstAccount] raise: Error withMessageText: PortfolioAccount duplicatedAccountsErrorDescription.! !

!PortfoliosValidosTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:03'!
test02PortfolioCanNotAddItself
	
	self should:[aPortfolio addAccount: aPortfolio] raise: Error withMessageText: PortfolioAccount duplicatedAccountsErrorDescription.! !

!PortfoliosValidosTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:08'!
test03PortfolioCanNotAddAnAccountIfAChildPortfolioIncludesIt
	anotherPortfolio addAccount: firstAccount.
	aPortfolio addAccount: anotherPortfolio.
	self should:[aPortfolio addAccount: firstAccount] raise: Error withMessageText: PortfolioAccount duplicatedAccountsErrorDescription.! !

!PortfoliosValidosTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:08'!
test04PortfolioCanNotAddAnAccountIfAParentPortfolioIncludesIt
	aPortfolio addAccount: firstAccount.
	aPortfolio addAccount: anotherPortfolio.
	self should:[anotherPortfolio addAccount: firstAccount] raise: Error withMessageText: PortfolioAccount duplicatedAccountsErrorDescription.! !

!PortfoliosValidosTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:08'!
test05PortfolioCanNotAddAPortfolioIfTheyShareAChild
	aPortfolio addAccount: firstAccount.
	anotherPortfolio addAccount: firstAccount.
	self should:[aPortfolio addAccount: anotherPortfolio] raise: Error withMessageText: PortfolioAccount duplicatedAccountsErrorDescription.! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AP 11/10/2022 13:29:52'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'anAccount anotherAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:48'!
test01TransferenceUpdatesBalanceFormBothAccounts
	
	Transference transfer: 100 * peso from: anAccount to: anotherAccount.
	
	self assert: -100 * peso equals: anAccount balance.
	self assert: 100 * peso equals: anotherAccount balance.! !

!TransferenceTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:48'!
test02TransferenceHasRightValue
	| transference |
	
	transference := Transference transfer: 100 * peso from: anAccount to: anotherAccount.
	
	self assert: 100 * peso equals: transference value.! !

!TransferenceTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:48'!
test03TransferenceValueCanNotBe0
	
	self should: [Transference transfer: 0 * peso from: anAccount to: anotherAccount.] raise: Error withMessageText: Transference invalidTransferenceErrorDescription.
	
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:48'!
test04TransferenceValueCanNotBeNegative
	
	self should: [Transference transfer: -100 * peso from: anAccount to: anotherAccount.] raise: Error withMessageText: Transference invalidTransferenceErrorDescription.
	
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:48'!
test05TransferenceChecksOtherPart
	
	Transference transfer: 100 * peso from: anAccount to: anotherAccount.
	self assert: ((anotherAccount transactions first) isOtherPartOf: (anAccount transactions first)).
	self assert: ((anAccount transactions first) isOtherPartOf: (anotherAccount transactions first)).
	
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:48'!
test06TransferenceMultipleOtherPartsAreRight
	
	Transference transfer: 100 * peso from: anAccount to: anotherAccount.
	Transference transfer: 200 * peso from: anotherAccount to: anAccount. 
	self deny:((anotherAccount transactions second) isOtherPartOf: (anAccount transactions first)).
	self deny:((anAccount transactions second) isOtherPartOf: (anotherAccount transactions first)).
	self assert: ((anotherAccount transactions first) isOtherPartOf: (anAccount transactions first)).
	self assert: ((anAccount transactions first) isOtherPartOf: (anotherAccount transactions first)).
	
	! !

!TransferenceTest methodsFor: 'testing' stamp: 'gr 11/10/2022 20:53:42'!
test07CanNotTransferToThemselfs
	
	self should:[Transference transfer: 100 * peso from: anAccount to: anAccount.] raise: Error withMessageText: Transference invalidAccountErrorDescription.
	
	
	! !


!TransferenceTest methodsFor: 'setUp/tearDown' stamp: 'gr 11/10/2022 20:53:48'!
setUp
	
	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'AP 11/9/2022 19:24:16'!
updateBalance: aBalance
	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'initialization' stamp: 'AP 11/10/2022 16:32:02'!
initializeFor: anAmount
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'AP 11/10/2022 16:32:58'!
for: anAmount
	self subclassResponsibility! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'AP 11/9/2022 19:23:42'!
updateBalance: aBalance
	^aBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'AP 11/9/2022 19:24:03'!
updateBalance: aBalance
	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PortfolioAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PortfolioAccount
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioAccount methodsFor: 'main protocol' stamp: 'gr 11/10/2022 20:44:23'!
addAccount: anAccount 
	(self alreadyExists: anAccount) ifTrue: [self error: self class duplicatedAccountsErrorDescription].
	accounts add: anAccount.
	anAccount addParent: self.! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'gr 11/10/2022 20:56:58'!
balance
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [^0*peso].! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'AP 11/9/2022 20:05:42'!
hasRegistered: aTransation
	^accounts anySatisfy: [:anAccount | (anAccount hasRegistered: aTransation)].
	! !

!PortfolioAccount methodsFor: 'main protocol' stamp: 'AP 11/9/2022 20:06:09'!
transactions
	| transactions |
	transactions := OrderedCollection new.
	accounts do: [:anAccount | transactions addAll: anAccount transactions].
	^transactions.! !


!PortfolioAccount methodsFor: 'initialization' stamp: 'AP 11/10/2022 21:06:45'!
initialize
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!PortfolioAccount methodsFor: 'comparing' stamp: 'AP 11/10/2022 21:08:53'!
alreadyExists: anAccount
	(anAccount = self) ifTrue: [^true].
	^(self isAccountInPortfolio: anAccount) or:[self isChildOfAccountInPortfolio: anAccount]
	! !

!PortfolioAccount methodsFor: 'comparing' stamp: 'AP 11/10/2022 21:06:44'!
isAccountInPortfolio: anAccount

	^ accounts,parents anySatisfy: [:account | account alreadyExists: anAccount]! !

!PortfolioAccount methodsFor: 'comparing' stamp: 'gr 11/10/2022 20:50:33'!
isChildOfAccountInPortfolio: anAccount

	^ accounts anySatisfy:[:account | anAccount alreadyExists: account]! !


!PortfolioAccount methodsFor: 'private' stamp: 'AP 11/10/2022 21:06:45'!
addParent: aPortfolio
	parents add: aPortfolio.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioAccount class' category: 'ServiciosFinancieros-Ejercicio'!
PortfolioAccount class
	instanceVariableNames: ''!

!PortfolioAccount class methodsFor: 'error' stamp: 'AP 11/10/2022 13:05:00'!
duplicatedAccountsErrorDescription
	^'Can not store the same account more than once in a portfolio!!'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'gr 11/10/2022 20:58:47'!
balance
	| balance |
	balance := 0.
	transactions do: [ :aTransaction | balance := aTransaction updateBalance: balance].
	^balance! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AP 11/10/2022 13:28:42'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'comparing' stamp: 'AP 11/10/2022 13:24:07'!
alreadyExists: anAccount
	^anAccount = self.! !


!ReceptiveAccount methodsFor: 'private' stamp: 'AP 11/10/2022 16:27:21'!
addParent: aPortfolio
! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'part otherPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'AP 11/9/2022 20:07:35'!
withPart: aTransaction andOtherPart: anotherTransaction
	part:=aTransaction.
	otherPart:=anotherTransaction.! !


!Transference methodsFor: 'comparing' stamp: 'AP 11/9/2022 20:08:59'!
isOtherPartOf: aTransference.
	^part = aTransference otherPart! !


!Transference methodsFor: 'balance' stamp: 'AP 11/9/2022 20:07:11'!
updateBalance: aBalance
	^part updateBalance: aBalance.! !


!Transference methodsFor: 'accesing' stamp: 'AP 11/9/2022 19:41:04'!
otherPart
	^otherPart! !


!Transference methodsFor: 'value' stamp: 'AP 11/9/2022 20:07:11'!
value
	^part value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: 'value'!

!Transference class methodsFor: 'class initialization' stamp: 'AP 11/10/2022 12:20:21'!
invalidAmount: anAmount

	^ anAmount <= (0 * peso)! !

!Transference class methodsFor: 'class initialization' stamp: 'AP 11/10/2022 12:21:20'!
is: depositAccount sameAccountAs: extractionAccount

	^ extractionAccount = depositAccount! !

!Transference class methodsFor: 'class initialization' stamp: 'AP 11/10/2022 12:24:37'!
transfer: anAmount from: extractionAccount to: depositAccount
	| deposit withdraw |
	((extractionAccount = depositAccount)) ifTrue:[self error: self invalidAccountErrorDescription].
	((self invalidAmount: anAmount)) ifTrue: [self error: self invalidTransferenceErrorDescription ].
	
	withdraw := Withdraw for: anAmount.
	deposit := Deposit for: anAmount.
	
	^self registerTransferenceWithWithdraw: withdraw andDeposit: deposit from: extractionAccount to: depositAccount.
	! !

!Transference class methodsFor: 'class initialization' stamp: 'AP 11/9/2022 20:07:59'!
withPart: aTransaction andOtherPart: anotherTransaction
	^self new withPart: aTransaction andOtherPart: anotherTransaction.! !


!Transference class methodsFor: 'error' stamp: 'gr 11/10/2022 21:00:08'!
invalidAccountErrorDescription
	^'Cannot transfer to same account'.! !

!Transference class methodsFor: 'error' stamp: 'gr 11/10/2022 21:00:43'!
invalidTransferenceErrorDescription
	^'an Invalid amount was chosen!!'.! !


!Transference class methodsFor: 'instance creation' stamp: 'AP 11/10/2022 12:19:02'!
registerTransferenceWithWithdraw: withdraw andDeposit: deposit from: extractionAccount to: depositAccount
	| transferenceDeposit transferenceExtraction |
	transferenceExtraction:= Transference withPart: withdraw andOtherPart: deposit.
	transferenceDeposit:= Transference withPart: deposit andOtherPart: withdraw.
	extractionAccount register:transferenceExtraction.
	depositAccount register: transferenceDeposit.
	^transferenceExtraction.! !
