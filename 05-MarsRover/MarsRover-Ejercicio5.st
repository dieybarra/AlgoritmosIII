!classDefinition: #MarsRoverTest category: 'Ejercicio-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover comandoB comandoF north west south east'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:09:24'!
test01verificacionDePosicionInicialDeUnMarsRover
	
	self assert: [marsRover estaEn: 1@1 apuntandoA: north.]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:21:25'!
test02envioDeComandoVacioPermaneceEnLaMismaPosicion
	
	self verificarQueSeLanzaMensajeDeErrorAlEjecutar: [marsRover moverSegunSecuenciaDeComandos: ''.].
	self assert: (marsRover estaEn:  1@1 apuntandoA: north).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 00:38:05'!
test03envioDeComandoDeAvanceTerminaEnLaPosicionEsperada
	
	marsRover moverSegunSecuenciaDeComandos: 'f' .
	
	self assert: (marsRover estaEn:  1@2 apuntandoA: north).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 00:39:03'!
test04envioDeComandoDeRetrocesoTerminaEnLaPosicionEsperada

	marsRover moverSegunSecuenciaDeComandos: 'b'.
	
	self assert: (marsRover estaEn:  1@0 apuntandoA: north).

! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:21:25'!
test05envioDeComandoInvalidoLanzaUnMensajeDeError
	
	self verificarQueSeLanzaMensajeDeErrorAlEjecutar: [marsRover moverSegunSecuenciaDeComandos: 'w'.].
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 00:43:26'!
test06avanzarYRetrocederTerminaEnLaMismaPosicion
	
	marsRover moverSegunSecuenciaDeComandos: 'fb'.
	self assert: (marsRover estaEn:  1@1 apuntandoA: north).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 00:44:28'!
test07envioDeMultiplesComandosDeAvanceTerminaEnPosicionEsperada

	marsRover moverSegunSecuenciaDeComandos: 'fff'.
	self assert: [marsRover estaEn: (1@4) apuntandoA: north].
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:21:25'!
test08secuenciaDeComandosConCaracterInvalidoAlFinalTerminaEnPosicionEsperada
	
	self verificarQueSeLanzaMensajeDeErrorAlEjecutar: [marsRover moverSegunSecuenciaDeComandos: 'bbw'].
	self assert: (marsRover estaEn:  1@-1 apuntandoA: north).
	
	
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:39:47'!
test09envioDeComandoDeRotacionIzquierdaTerminaApuntandoALaDireccionEsperada

	marsRover moverSegunSecuenciaDeComandos: 'l'.
	
	self assert: [marsRover estaEn: (1@1) apuntandoA: west].
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:39:59'!
test10envioDeComandoDeRotacionDerechaTerminaApuntandoALaDireccionEsperada

	marsRover moverSegunSecuenciaDeComandos: 'r'.
	
	self assert: [marsRover estaEn: (1@1) apuntandoA: east].
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:40:07'!
test11rotarAIzquierdaYDespuesADerechaTerminaEnLaMismaPosicion

	marsRover moverSegunSecuenciaDeComandos: 'rl'.
	
	self assert: [marsRover estaEn: (1@1) apuntandoA: north].
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:40:17'!
test12SecuenciaDeRotacionesConCaracterInvalidoAlFinalTerminaEnPosicionEsperada

	self verificarQueSeLanzaMensajeDeErrorAlEjecutar: [marsRover moverSegunSecuenciaDeComandos: 'rrj'.].
	self assert: (marsRover estaEn:  1@1 apuntandoA: south).
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:40:28'!
test13SecuenciaDeRotacionesConCaracterInvalidoEnElMedioTerminaEnPosicionEsperada

	self verificarQueSeLanzaMensajeDeErrorAlEjecutar: [marsRover moverSegunSecuenciaDeComandos: 'rjr'.].
	self assert: (marsRover estaEn:  1@1 apuntandoA: east).
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:40:36'!
test14rotarADerechaYAvanzarTerminaEnPosicionYDireccionEsperada

	marsRover moverSegunSecuenciaDeComandos: 'rf'.
	
	self assert: [marsRover estaEn: (2@1) apuntandoA: east].
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:40:47'!
test15rotarAIzquierdaYRetrocederTerminaEnPosicionYDireccionEsperada

	marsRover moverSegunSecuenciaDeComandos: 'lbb'.
	
	self assert: [marsRover estaEn: (3@1) apuntandoA: west].
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:43:00'!
test16secuenciaDeComandosConCaracterInvalidoEnElMedioTerminaEnPosicionEsperada
	
	self verificarQueSeLanzaMensajeDeErrorAlEjecutar: [marsRover moverSegunSecuenciaDeComandos: 'bwb'.].
	self assert: (marsRover estaEn:  1@0 apuntandoA: north).
	
	
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 18:42:45'!
test17multiplesComandosTerminaEnLaMismaPosicionYOrientacion
	
	marsRover moverSegunSecuenciaDeComandos: 'frfbrrfbrb'.
	self assert: [marsRover estaEn: (1@1) apuntandoA: north].
	! !

!MarsRoverTest methodsFor: 'tests' stamp: 'LNG 11/18/2021 01:43:51'!
test18multiplesComandosTerminaEnLaPosicionYOrientacionEsperada

	marsRover moverSegunSecuenciaDeComandos: 'blffllbbflb'.
	self assert: [marsRover estaEn: (-2@-1) apuntandoA: north].! !


!MarsRoverTest methodsFor: 'setup' stamp: 'LNG 11/18/2021 18:00:55'!
setUp

	north := OrientacionNorte new.
	west := OrientacionOeste new.
	south := OrientacionSur new.
	east := OrientacionEste new. 
	
	marsRover := MarsRover iniciarEn: 1@1 yApuntandoHacia: north! !


!MarsRoverTest methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:21:25'!
verificarQueSeLanzaMensajeDeErrorAlEjecutar: unaAccion

	self
		should: unaAccion
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover comandoInvalidoErrorMessage ].! !


!classDefinition: #ComandosMarsRover category: 'Ejercicio-MarsRover'!
Object subclass: #ComandosMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!ComandosMarsRover methodsFor: 'privado' stamp: 'dd 11/17/2021 01:42:38'!
realizarAccionA: unMarsRover

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandosMarsRover class' category: 'Ejercicio-MarsRover'!
ComandosMarsRover class
	instanceVariableNames: ''!

!ComandosMarsRover class methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:06:50'!
verificarExistenciaEnClaseDe: unCaracter

	self subclassResponsibility.! !


!classDefinition: #ComandoAvanzar category: 'Ejercicio-MarsRover'!
ComandosMarsRover subclass: #ComandoAvanzar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!ComandoAvanzar methodsFor: 'privado' stamp: 'dd 11/17/2021 01:53:44'!
realizarAccionA: unMarsRover

	unMarsRover moverHaciaAdelante.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoAvanzar class' category: 'Ejercicio-MarsRover'!
ComandoAvanzar class
	instanceVariableNames: ''!

!ComandoAvanzar class methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:06:50'!
verificarExistenciaEnClaseDe: unCaracter

	^(unCaracter = $f).! !


!classDefinition: #ComandoRetroceder category: 'Ejercicio-MarsRover'!
ComandosMarsRover subclass: #ComandoRetroceder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!ComandoRetroceder methodsFor: 'privado' stamp: 'dd 11/17/2021 01:53:30'!
realizarAccionA: unMarsRover

	unMarsRover moverHaciaAtras.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRetroceder class' category: 'Ejercicio-MarsRover'!
ComandoRetroceder class
	instanceVariableNames: ''!

!ComandoRetroceder class methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:06:50'!
verificarExistenciaEnClaseDe: unCaracter

	^(unCaracter = $b).! !


!classDefinition: #ComandoRotarADerecha category: 'Ejercicio-MarsRover'!
ComandosMarsRover subclass: #ComandoRotarADerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!ComandoRotarADerecha methodsFor: 'privado' stamp: 'dd 11/17/2021 01:43:48'!
realizarAccionA: unMarsRover

	unMarsRover rotarHaciaLaDerecha.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarADerecha class' category: 'Ejercicio-MarsRover'!
ComandoRotarADerecha class
	instanceVariableNames: ''!

!ComandoRotarADerecha class methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:06:50'!
verificarExistenciaEnClaseDe: unCaracter

	^(unCaracter = $r).! !


!classDefinition: #ComandoRotarAIzquierda category: 'Ejercicio-MarsRover'!
ComandosMarsRover subclass: #ComandoRotarAIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!ComandoRotarAIzquierda methodsFor: 'privado' stamp: 'dd 11/17/2021 01:43:27'!
realizarAccionA: unMarsRover

	unMarsRover rotarHaciaLaIzquierda.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarAIzquierda class' category: 'Ejercicio-MarsRover'!
ComandoRotarAIzquierda class
	instanceVariableNames: ''!

!ComandoRotarAIzquierda class methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:06:50'!
verificarExistenciaEnClaseDe: unCaracter

	^(unCaracter = $l).! !


!classDefinition: #MarsRover category: 'Ejercicio-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual puntoCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!MarsRover methodsFor: 'inicializacion' stamp: 'LNG 11/15/2021 10:54:52'!
inicializarMarsRoverEnPosicion: unaPosicion apuntandoHacia: unPuntoCardinal

	posicionActual := unaPosicion.
	puntoCardinal := unPuntoCardinal.! !


!MarsRover methodsFor: 'privado' stamp: 'dd 11/17/2021 02:18:34'!
estaEn: unaPosicion apuntandoA: unPuntoCardinal

	^(posicionActual = unaPosicion) and: [puntoCardinal isKindOf: unPuntoCardinal class].! !

!MarsRover methodsFor: 'privado' stamp: 'dd 11/17/2021 02:45:59'!
moverSegunSecuenciaDeComandos: unaSecuenciaDeComandos

	| comandoTraducido |
	(unaSecuenciaDeComandos size = 0) ifTrue: [^self error: MarsRover comandoInvalidoErrorMessage] .
	
	1 to: (unaSecuenciaDeComandos size) do: 
	
		[:x | comandoTraducido := self traducirComando: (unaSecuenciaDeComandos  at: x).
			comandoTraducido realizarAccionA: self.]! !

!MarsRover methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:06:50'!
traducirComando: unCaracter

	| class |
	class := ComandosMarsRover allSubclasses detect: [:aClass | aClass verificarExistenciaEnClaseDe: unCaracter] ifNone: [self error: MarsRover comandoInvalidoErrorMessage].
	
	^class new.



	! !


!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:47:30'!
avanzarApuntandoHaciaElEste

	posicionActual := posicionActual + (1@0).! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:47:10'!
avanzarApuntandoHaciaElNorte

	posicionActual := posicionActual + (0@1).! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:48:11'!
avanzarApuntandoHaciaElOeste

	posicionActual := posicionActual + (-1@0).! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:47:50'!
avanzarApuntandoHaciaElSur

	posicionActual := posicionActual + (0@-1).! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:52:24'!
moverHaciaAdelante
		
	^puntoCardinal avanzar: self.
! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:52:33'!
moverHaciaAtras
	
	^puntoCardinal retroceder: self.
! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 20:35:17'!
retrocederApuntandoHaciaElEste

	posicionActual := posicionActual - (1@0).! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 20:31:56'!
retrocederApuntandoHaciaElNorte

	posicionActual := posicionActual - (0@1).! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 20:40:37'!
retrocederApuntandoHaciaElOeste

	posicionActual := posicionActual - (-1@0).! !

!MarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 20:39:29'!
retrocederApuntandoHaciaElSur

	posicionActual := posicionActual - (0@-1).! !

!MarsRover methodsFor: 'movimientos' stamp: 'dd 11/17/2021 02:44:56'!
rotarHaciaLaDerecha

	puntoCardinal := puntoCardinal puntoCardinalADerecha.
! !

!MarsRover methodsFor: 'movimientos' stamp: 'dd 11/17/2021 02:44:52'!
rotarHaciaLaIzquierda

	puntoCardinal := puntoCardinal puntoCardinalAIzquierda.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'mensajes de error' stamp: 'LNG 11/15/2021 12:06:06'!
comandoInvalidoErrorMessage

	^'El comando es invalido'.! !


!MarsRover class methodsFor: 'inicializacion' stamp: 'LNG 11/15/2021 12:03:25'!
iniciarEn: unaPosicion yApuntandoHacia: unPuntoCardinal

	^self new inicializarMarsRoverEnPosicion: unaPosicion apuntandoHacia: unPuntoCardinal.! !


!classDefinition: #OrientacionMarsRover category: 'Ejercicio-MarsRover'!
Object subclass: #OrientacionMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!OrientacionMarsRover methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:32:41'!
puntoCardinalADerecha

	self subclassResponsibility.! !

!OrientacionMarsRover methodsFor: 'privado' stamp: 'dd 11/17/2021 02:19:48'!
puntoCardinalAIzquierda

	self subclassResponsibility.! !


!OrientacionMarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:50:29'!
avanzar: unMarsRover

	self subclassResponsibility.! !

!OrientacionMarsRover methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:43:15'!
retroceder: unMarsRover

	self subclassResponsibility.! !


!classDefinition: #OrientacionEste category: 'Ejercicio-MarsRover'!
OrientacionMarsRover subclass: #OrientacionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!OrientacionEste methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:00:40'!
puntoCardinalADerecha

	^OrientacionSur new.! !

!OrientacionEste methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:00:28'!
puntoCardinalAIzquierda

	^OrientacionNorte new.! !


!OrientacionEste methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:48:49'!
avanzar: unMarsRover

	^unMarsRover avanzarApuntandoHaciaElEste.! !

!OrientacionEste methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:43:15'!
retroceder: unMarsRover

	^unMarsRover retrocederApuntandoHaciaElEste.! !


!classDefinition: #OrientacionNorte category: 'Ejercicio-MarsRover'!
OrientacionMarsRover subclass: #OrientacionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!OrientacionNorte methodsFor: 'privado' stamp: 'LNG 11/18/2021 17:59:52'!
puntoCardinalADerecha

	^OrientacionEste new.! !

!OrientacionNorte methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:00:55'!
puntoCardinalAIzquierda

	^OrientacionOeste new.! !


!OrientacionNorte methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:49:23'!
avanzar: unMarsRover

	^unMarsRover avanzarApuntandoHaciaElNorte.! !

!OrientacionNorte methodsFor: 'movimientos' stamp: 'LNG 11/18/2021 18:30:51'!
retroceder: unMarsRover

	^unMarsRover retrocederApuntandoHaciaElNorte.

! !


!classDefinition: #OrientacionOeste category: 'Ejercicio-MarsRover'!
OrientacionMarsRover subclass: #OrientacionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!OrientacionOeste methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:00:28'!
puntoCardinalADerecha

	^OrientacionNorte new.! !

!OrientacionOeste methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:00:40'!
puntoCardinalAIzquierda

	^OrientacionSur new.! !


!OrientacionOeste methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:50:14'!
avanzar: unMarsRover

	^unMarsRover avanzarApuntandoHaciaElOeste.! !

!OrientacionOeste methodsFor: 'movimientos' stamp: 'LNG 11/18/2021 18:31:12'!
retroceder: unMarsRover

	^unMarsRover retrocederApuntandoHaciaElOeste.! !


!classDefinition: #OrientacionSur category: 'Ejercicio-MarsRover'!
OrientacionMarsRover subclass: #OrientacionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRover'!

!OrientacionSur methodsFor: 'privado' stamp: 'LNG 11/18/2021 18:00:55'!
puntoCardinalADerecha

	^OrientacionOeste new.! !

!OrientacionSur methodsFor: 'privado' stamp: 'LNG 11/18/2021 17:59:52'!
puntoCardinalAIzquierda

	^OrientacionEste new.! !


!OrientacionSur methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:49:47'!
avanzar: unMarsRover

	^unMarsRover avanzarApuntandoHaciaElSur.! !

!OrientacionSur methodsFor: 'movimientos' stamp: 'LNG 11/17/2021 23:43:15'!
retroceder: unMarsRover

	^unMarsRover retrocederApuntandoHaciaElSur.! !
