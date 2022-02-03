!classDefinition: #OpinionesDelPuebloRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #OpinionesDelPuebloRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OpinionesDelPuebloRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
OpinionesDelPuebloRiverwood class
	instanceVariableNames: 'listaDePrometedores'!

!OpinionesDelPuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'dd 9/29/2021 18:19:05'!
calificarComoPrometedorA: PersonajeAIncluir
	listaDePrometedores add: PersonajeAIncluir! !

!OpinionesDelPuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'dd 9/29/2021 18:19:05'!
esPrometedor: unPersonaje
	^listaDePrometedores includes: unPersonaje! !

!OpinionesDelPuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'LNG 10/3/2021 23:08:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	listaDePrometedores := ((OrderedCollection new) add: #Hamilton; yourself).! !

!OpinionesDelPuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'dd 9/29/2021 18:19:05'!
olvidar
	listaDePrometedores := OrderedCollection new.! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'LNG 9/28/2021 21:28:47'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'LNG 9/28/2021 20:00:32'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'dd 10/2/2021 20:00:15'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Salud aventurero!!'! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'dd 9/29/2021 18:17:22'!
carolinaLaCurandera
	^CarolinaLaCurandera! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'dd 9/29/2021 15:47:59'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'dd 9/29/2021 15:48:04'!
tirion
	^#Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'dd 9/29/2021 18:15:29'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^self riverwood esPrometedor: unPersonaje.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'dd 9/29/2021 18:17:22'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCurandera olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'dd 9/29/2021 15:38:35'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	self riverwood olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'dd 9/29/2021 18:16:07'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self riverwood calificarComoPrometedorA: self hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'dd 9/29/2021 18:17:01'!
riverwood
	^OpinionesDelPuebloRiverwood! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'dd 9/29/2021 15:30:48'!
hamilton
	^#Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'dd 9/29/2021 18:17:01'!
riverwood
	^OpinionesDelPuebloRiverwood! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'dd 9/29/2021 15:30:53'!
tirion
	^#Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'dd 9/29/2021 15:24:13'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	self riverwood olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'dd 9/29/2021 18:24:54'!
hacerQueRiverwoodVeaPrometedorAHamilton
	self riverwood calificarComoPrometedorA: self hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'cantidadDeInteraccionesPorPersonaje frasesPrometedor frasesDesconocido'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'LNG 9/28/2021 01:59:15'!
interactuarCon: unPersonajeJugadorAInteractuar

	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
		! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'LNG 9/28/2021 01:50:57'!
olvidar
	cantidadDeInteraccionesPorPersonaje := Dictionary new! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'dd 10/2/2021 19:42:00'!
reiniciarHiloDeConversacionCon: unPersonaje
	cantidadDeInteraccionesPorPersonaje at: unPersonaje put: 0. ! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'dd 10/2/2021 19:39:27'!
ObtenerFrasePara: unPersonajeJugadorAInteractuar con: cantidadDeInteracciones

	^ (OpinionesDelPuebloRiverwood esPrometedor: unPersonajeJugadorAInteractuar)
	 	ifTrue: [ frasesPrometedor at: (cantidadDeInteracciones min: frasesPrometedor size)] 
		ifFalse: [ frasesDesconocido at: (cantidadDeInteracciones min: frasesDesconocido size)]! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'dd 10/2/2021 19:24:05'!
obtenerCantidadDeInteracciones: unPersonajeJugadorAInteractuar

	^ cantidadDeInteraccionesPorPersonaje at: unPersonajeJugadorAInteractuar ifAbsent: [0]! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'dd 10/2/2021 19:30:43'!
recordarInteraccionCon: unPersonajeJugadorAInteractuar
	| cantidadDeInteraccion |
	cantidadDeInteraccion := self obtenerCantidadDeInteracciones: unPersonajeJugadorAInteractuar.
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugadorAInteractuar put: cantidadDeInteraccion + 1.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'dd 10/2/2021 19:38:48'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar
	| cantidadDeInteracciones |
	cantidadDeInteracciones := self obtenerCantidadDeInteracciones: unPersonajeJugadorAInteractuar.
	^ self ObtenerFrasePara: unPersonajeJugadorAInteractuar con: cantidadDeInteracciones
	! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'LNG 10/3/2021 23:08:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeInteraccionesPorPersonaje := ((Dictionary new) add: (#Hamilton->2); yourself).
	frasesPrometedor := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	frasesDesconocido := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).! !


!classDefinition: #CarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim subclass: #CarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCurandera class
	instanceVariableNames: ''!

!CarolinaLaCurandera class methodsFor: 'interacciones' stamp: 'dd 10/2/2021 19:45:46'!
interactuarCon: unPersonajeJugadorAInteractuar
	| frase |
	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	frase := self responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	self chequearFinDeConversacion: unPersonajeJugadorAInteractuar.
	^ frase
	! !


!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'dd 10/2/2021 20:28:12'!
chequearFinDeConversacion: unPersonajeJugadorAInteractuar
	|cantidadDeInteracciones |
	cantidadDeInteracciones :=self obtenerCantidadDeInteracciones: unPersonajeJugadorAInteractuar.
	cantidadDeInteracciones = frasesDesconocido size
		ifTrue: [self hacerCambiosPorClasificacion: unPersonajeJugadorAInteractuar ]! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'dd 10/2/2021 20:28:40'!
hacerCambiosPorClasificacion: unPersonajeJugadorAInteractuar

	OpinionesDelPuebloRiverwood calificarComoPrometedorA: unPersonajeJugadorAInteractuar. 
	self reiniciarHilosDeConversacionCon: unPersonajeJugadorAInteractuar! !

!CarolinaLaCurandera class methodsFor: 'interacciones - privado' stamp: 'dd 10/2/2021 20:13:40'!
reiniciarHilosDeConversacionCon: unPersonajeJugadorAInteractuar
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugadorAInteractuar put: 0. 
	TreborElGuardiaDeSkyrim reiniciarHiloDeConversacionCon: unPersonajeJugadorAInteractuar.

! !


!CarolinaLaCurandera class methodsFor: 'as yet unclassified' stamp: 'LNG 10/3/2021 23:08:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeInteraccionesPorPersonaje := ((Dictionary new) add: (#Hamilton->0); yourself).
	frasesPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	frasesDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).! !

OpinionesDelPuebloRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!
CarolinaLaCurandera initializeAfterFileIn!