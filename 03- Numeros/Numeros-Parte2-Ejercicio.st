!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'polymorphic arithmetic' stamp: 'AP 10/3/2022 23:11:47'!
divideToFraction: aDividend
	^self subclassResponsibility.! !

!Numero methodsFor: 'polymorphic arithmetic' stamp: 'AP 10/3/2022 23:12:02'!
divideToInteger: aDividend
	^self subclassResponsibility.! !

!Numero methodsFor: 'polymorphic arithmetic' stamp: 'AP 10/3/2022 23:12:24'!
multiplyToFraction: aMultiplier
	^self subclassResponsibility.! !

!Numero methodsFor: 'polymorphic arithmetic' stamp: 'AP 10/3/2022 23:12:18'!
multiplyToInteger: aMultiplier
	^self subclassResponsibility.! !

!Numero methodsFor: 'polymorphic arithmetic' stamp: 'AP 10/3/2022 23:12:32'!
sumToFraction: anAdder
	^self subclassResponsibility.! !

!Numero methodsFor: 'polymorphic arithmetic' stamp: 'AP 10/3/2022 23:12:40'!
sumToInteger: anAdder
	^self subclassResponsibility.! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N?mero Inv?lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'gr 10/2/2022 12:14:55'!
* aMultiplicand
    ^aMultiplicand multiplyToInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'gr 10/2/2022 12:14:33'!
+ anAddend
	^anAddend sumToInteger: self.

	
		
		
		
		
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'gr 10/3/2022 19:53:22'!
- aSubtrahend 
	^aSubtrahend negated + self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'gr 10/2/2022 11:40:22'!
/ aDivisor 
	
	^aDivisor divideToInteger: self.
	
	
	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AP 10/1/2022 18:33:17'!
fibonacci
	
	^self subclassResponsibility.

		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 11:40:59'!
divideToFraction: aDividend
	^(Entero with: aDividend numerator integerValue) / (Entero with: value * aDividend denominator integerValue).! !

!Entero methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 11:40:22'!
divideToInteger: aDividend
	^Fraccion with: aDividend over: self.! !

!Entero methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 11:43:44'!
multiplyToFraction: aMultiplier

	^(Entero with: value * aMultiplier numerator integerValue) / (Entero with: aMultiplier denominator integerValue).! !

!Entero methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 11:43:59'!
multiplyToInteger: aMultiplier
	^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 12:16:20'!
sumToFraction: anAugend
	^(Entero with: (value * anAugend denominator integerValue) + (anAugend numerator integerValue)) / (Entero with: (anAugend denominator integerValue)).! !

!Entero methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/3/2022 20:03:00'!
sumToInteger: anAugend
        	^Entero with: (value + anAugend integerValue).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance subclass creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est? definido aqu? para Enteros Negativos'! !

!Entero class methodsFor: 'instance subclass creation' stamp: 'gr 10/2/2022 12:04:51'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^(Entero subclasses detect: [:subclass | subclass valueBelongsToReceiver: aValue]) new initializeWith: aValue.! !


!classDefinition: #Entero0 category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Entero0
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero0 methodsFor: 'arithmetic' stamp: 'AP 10/1/2022 18:03:51'!
fibonacci
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero0 class' category: 'Numeros-Parte2-Ejercicio'!
Entero0 class
	instanceVariableNames: ''!

!Entero0 class methodsFor: 'checks in instance creation' stamp: 'gr 10/2/2022 12:04:51'!
valueBelongsToReceiver: anIntegerValue
	^anIntegerValue = 0.! !


!classDefinition: #Entero1 category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Entero1
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero1 methodsFor: 'arithmetic' stamp: 'AP 10/1/2022 18:05:12'!
fibonacci
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero1 class' category: 'Numeros-Parte2-Ejercicio'!
Entero1 class
	instanceVariableNames: ''!

!Entero1 class methodsFor: 'checks in instance creation' stamp: 'gr 10/2/2022 12:04:51'!
valueBelongsToReceiver: anIntegerValue
	^anIntegerValue = 1.! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'arithmetic' stamp: 'AP 10/1/2022 17:57:38'!
fibonacci
	^self error: Entero negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'checks in instance creation' stamp: 'gr 10/2/2022 12:04:51'!
valueBelongsToReceiver: anIntegerValue
	^anIntegerValue < 0.! !


!classDefinition: #EnteroPositivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroPositivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivo methodsFor: 'arithmetic' stamp: 'AP 10/1/2022 18:35:07'!
fibonacci
	| one two |
	one := Entero with: 1.
	two := Entero with: 2.
	^(self - one) fibonacci + (self - two) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo class
	instanceVariableNames: ''!

!EnteroPositivo class methodsFor: 'checks in instance creation' stamp: 'gr 10/2/2022 12:04:51'!
valueBelongsToReceiver: anIntegerValue
	^anIntegerValue > 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gr 10/2/2022 11:43:44'!
* aMultiplier 
	
	^aMultiplier multiplyToFraction: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gr 10/2/2022 11:45:00'!
+ anAdder 
	^anAdder sumToFraction: self.
    
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gr 10/3/2022 19:54:01'!
- aSubtrahend 
	^aSubtrahend negated + self.
  
	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'gr 10/2/2022 11:40:59'!
/ aDivisor 
	
	^aDivisor divideToFraction: self.
	
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'gr 10/2/2022 13:29:37'!
createWith: aNumerator over: aDenominator

	self subclassResponsibility.! !

!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 11:40:59'!
divideToFraction: aDividend
	^(denominator * aDividend numerator) / (numerator * aDividend denominator)! !

!Fraccion methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/3/2022 19:59:45'!
divideToInteger: aDividend
	^(Entero with: self denominator integerValue * aDividend integerValue) / (Entero with: self numerator integerValue).! !

!Fraccion methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 11:43:44'!
multiplyToFraction: aMultiplier
	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)! !

!Fraccion methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/3/2022 20:00:19'!
multiplyToInteger: aMultiplier
	^(Entero with: self numerator integerValue * aMultiplier integerValue) / (Entero with: self denominator integerValue).! !

!Fraccion methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/2/2022 12:19:09'!
sumToFraction: anAugend

        	^(numerator * anAugend denominator) + (denominator * anAugend numerator) / (denominator * anAugend denominator) .! !

!Fraccion methodsFor: 'polymorphic arithmetic' stamp: 'gr 10/3/2022 19:59:01'!
sumToInteger: anAugend

       	 ^(Entero with: (self numerator integerValue) + (self denominator integerValue * anAugend integerValue)) / (Entero with: self denominator integerValue).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'AP 10/4/2022 15:08:51'!
with: aDividend over: aDivisor

	^(Fraccion subclasses detect: [ :subclass | subclass includes: aDividend and: aDivisor ]) new createWith: aDividend over: aDivisor.! !


!classDefinition: #Fraccion0 category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #Fraccion0
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion0 methodsFor: 'initialization' stamp: 'gr 10/2/2022 13:34:22'!
createWith: aDividend over: aDivisor
	^aDividend.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion0 class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion0 class
	instanceVariableNames: ''!

!Fraccion0 class methodsFor: 'as yet unclassified' stamp: 'gr 10/3/2022 18:18:44'!
includes: aNumerator and: aDenominator  
	^(aNumerator isZero and: [aDenominator isZero not]).! !


!classDefinition: #FraccionEsEntero category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #FraccionEsEntero
	instanceVariableNames: ''
	classVariableNames: 'GCD'
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!FraccionEsEntero methodsFor: 'initialization' stamp: 'gr 10/2/2022 14:24:53'!
createWith: aDividend over: aDivisor
	^aDividend // GCD.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionEsEntero class' category: 'Numeros-Parte2-Ejercicio'!
FraccionEsEntero class
	instanceVariableNames: ''!

!FraccionEsEntero class methodsFor: 'as yet unclassified' stamp: 'gr 10/3/2022 18:22:13'!
includes: aNumerator and: aDenominator
	GCD := aNumerator greatestCommonDivisorWith: aDenominator. 
	^(aNumerator isZero) not and: [aDenominator isZero not] and: [(aNumerator integerValue \\ aDenominator integerValue) = 0].! !


!classDefinition: #FraccionInvalida category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #FraccionInvalida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!FraccionInvalida methodsFor: 'initialization' stamp: 'gr 10/3/2022 12:45:53'!
createWith: aDividend over: aDivisor
	^self error: Fraccion canNotDivideByZeroErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionInvalida class' category: 'Numeros-Parte2-Ejercicio'!
FraccionInvalida class
	instanceVariableNames: ''!

!FraccionInvalida class methodsFor: 'as yet unclassified' stamp: 'gr 10/3/2022 18:22:24'!
includes: aNumerator and: aDenominator  
	^(aDenominator isZero).! !


!classDefinition: #FraccionNegativa category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #FraccionNegativa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!FraccionNegativa methodsFor: 'initialization' stamp: 'gr 10/2/2022 13:38:11'!
createWith: aDividend over: aDivisor
	^aDividend negated / aDivisor negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionNegativa class' category: 'Numeros-Parte2-Ejercicio'!
FraccionNegativa class
	instanceVariableNames: ''!

!FraccionNegativa class methodsFor: 'as yet unclassified' stamp: 'gr 10/3/2022 18:22:40'!
includes: aNumerator and: aDenominator  
	^(aNumerator isZero not and: [aDenominator isNegative ]).! !


!classDefinition: #FraccionPositiva category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #FraccionPositiva
	instanceVariableNames: ''
	classVariableNames: 'GCD'
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!FraccionPositiva methodsFor: 'initialization' stamp: 'gr 10/3/2022 18:18:09'!
createWith: aDividend over: aDivisor

	| greatestCommonDivisor clase |
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	clase := (Fraccion subclasses detect: [:subclass | subclass includes: numerator and: denominator]).
	^clase new initializeWith: numerator over: denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionPositiva class' category: 'Numeros-Parte2-Ejercicio'!
FraccionPositiva class
	instanceVariableNames: ''!

!FraccionPositiva class methodsFor: 'as yet unclassified' stamp: 'gr 10/3/2022 18:23:00'!
includes: aNumerator and: aDenominator 
	GCD := aNumerator greatestCommonDivisorWith: aDenominator. 
	^(aNumerator isZero) not and: [aDenominator isZero not] and: [aDenominator isNegative not] and: [((aDenominator // GCD) = 1) not].! !
