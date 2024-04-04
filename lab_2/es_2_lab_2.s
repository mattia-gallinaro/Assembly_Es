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
		ldr r4, =n @indice per contare i cicli
		str r4, [r4]
		sub r4, r4, #1 @indice che il massimo dei cicli è 199
		
        ldr r0, =V @indirizzo di partenza quindi si tratta di V[0]
		
		mov r3, #1 @indice contatore
        
		mov r1, [r0] @valore da controllare
        
		
loop:
        cmp r0,r1 @ se il valore in r0 < r1 allora salvo r1, sennò salvo r0 in r2
        movGT r2, r0
        movLT r2, r1
		add r3, #1 @ aumenta di 1 l'indice
		cmp 
        bls loop
