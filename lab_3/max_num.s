.data

n: .word 200 @ dimensione array

@ Alloca e inizializza un vettore di 200 word

V: .word -697, 1625, -873, 1375, -158, 1162, -1590, -1971, -345, 260, -956, 1329, 784, -1003,$


.text
.global main

main:    push {r0, r1, lr}@ salva contenuto registri
    ldr r1, =n    @ carica indirizzo con la dimensione
    ldr r1, [r1]    @ carica la lunghezza dell'array in r1
    ldr r0, =V    @ indirizzo del vettore in r0
    bl find_max    @ chiama la funzione per trovare il massimo
    pop {r0, r1, lr}@ recupera valori iniziali dei registri
    mov pc, lr    @ esci