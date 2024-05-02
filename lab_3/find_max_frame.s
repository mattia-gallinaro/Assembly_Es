

.data

n: .word 200 @ dimensione array

@ Alloca e inizializza un vettore di 200 word

V: .word -697, 1625, -873, 1375, -158, 1162, -1590, -1971, -345, 260, -956, 1329, 784, -1003,$


.text
.global _start

_start:
	
	push {r0, r1, lr}@ salva contenuto registri
    ldr r1, =n    @ carica indirizzo con la dimensione
    ldr r1, [r1]    @ carica la lunghezza dell'array in r1
    ldr r0, =V    @ indirizzo del vettore in r0
    bl find_max    @ chiama la funzione per trovare il massimo
    pop {r0, r1, lr}@ recupera valori iniziali dei registri
    mov pc, lr    @ esci


find_max:
   @@@ istruzioni della funzione max
        push {r2-r5, lr}
        cpy r2, r0
        ldr r0, [r2]
        mov r5, #4
        mul r4, r1, r5
        add r4, r2, r4
        add r2, #4
loop:
        ldr r3, [r2]
        cmp r3, r0
        movGT r0,r3
        add r2,r2,#4
        cmp r2,r4
        ble loop
        pop {r2-r5,lr}
        mov pc, lr   @ ritorna alla funzione chiamante.



istruzioni: 
		push {r11, lr}
		pop {r11, lr}



_start:
	
	push {r11, lr}@ salva contenuto registri
	mov r11, sp
    ldr r1, =n    @ carica indirizzo con la dimensione
    ldr r1, [r1]    @ carica la lunghezza dell'array in r1
	push {r1}
	ldr r0, =V    @ indirizzo del vettore in r0
    bl find_max    @ chiama la funzione per trovare il massimo
    pop {r11, lr}@ recupera valori iniziali dei registri
    mov pc, lr    @ esci


loop_func:
		
        ldr r3, [r2]
        cmp r3, r0
        movGT r0,r3
        add r2,r2,#4
        cmp r2,r4
        ble loop
        pop {r11,lr}
        mov pc, lr   @ ritorna alla funzione chiamante.