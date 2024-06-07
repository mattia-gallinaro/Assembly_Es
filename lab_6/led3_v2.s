.bss

@ subroutine a disposizione
@ set_gpio : inizializza la GPIO
@ read_slides : leggere il valore impostato nei 4 switch e lo restituisce nei 4 bit meno significativi in R0
@ write_led : visualizza nei led i 4 bit meno significativi di R0
@ read_buttons : legge lo stato dei 2 pulsani e lo restituisce nei 2 bit meno significativi di R0.
@             	ogni bit corrisponde allo stato di un pulsante.


.text

.global main
main:
    @ Salva i registri modificati
    push {r0,r1,lr}
    
    @ inizializza la GPIO
    bl set_gpio
    
    mov r1, #1
    add r1, r1, LSL #4
    add r1, r1, LSL #8
    add r1, r1, LSL #16
    mov r0, r1
    bl write_led
    
loop:   bl read_buttons
    cmp r0, #1
    moveq r1, r1, ROR #1
    cmp r0, #2
    moveq r1, r1, ROR #31
    mov r0, r1
    bl write_led

    	b loop

    @ Ripristina registri modificati
    pop {r0,r1,lr}
    @ Termina e ritorna dalla funzione main
    mov pc, lr
