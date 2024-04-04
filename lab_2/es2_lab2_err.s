.data

n: .word 200 @ dimensione array

@ Alloca e inizializza un vettore di 200 word
V: .word 9358, 2004, -4825, 1350, 4430, -8168, 5440, 5889, -8785, 1553, -6649, -4573, 5614, 1554, -5869, -1917, -6712, -3810, -4482, -1818, -1468, 4551, 5502, -2013, -7377, -3975, 579, 8881$

.bss
max: .skip 4            @ il valore max del vettore list
indice_max: .skip 4     @ l'indice all'interno di list del valore massimo

.text

.global _start


_start:
		ldr r6, =indice_max @indirizzo in cui salvare l'indice del valore massimo in list
		str 0, [r6] @ salvo il valore 0 essendo che per ora il massimo si trova in pos 0 di list
		
		ldr r4, =n @indice per contare i cicli
		str r4, [r4]
		sub r4, r4, #1 @indice che il massimo dei cicli è 199
		
        ldr r0, =V @indirizzo di partenza quindi si tratta di V[0]
		
		mov r3, #1 @indice contatore
        
		ldr r7, =max
		str [r0], [r7]
        
		mov r5, #0 @indirizzo di memoria del secondo valore
		add r5, r0, #4 @ indirizzo di V[1]
loop:
		ldr r1, [r5]
		cmp r0, r1
		strLT r1, [r7] @salvo il nuovo massimo di list
		strLT r3, [r6] @salvo il nuovo indice in cui si trova il massimo
		add r3, #1
		add r5, #4
        cmp r3, r4
		bls loop