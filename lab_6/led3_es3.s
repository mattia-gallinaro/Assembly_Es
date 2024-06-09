.bss

@ subroutine a disposizione
@ set_gpio : inizializza la GPIO
@ read_slides : leggere il valore impostato nei 4 switch e lo restituisce nei 4 bit meno significativi in R0
@ write_led : visualizza nei led i 4 bit meno significativi di R0
@ read_buttons : legge lo stato dei 2 pulsani e lo restituisce nei 2 bit meno significativi di R0.
@             	ogni bit corrisponde allo stato di un pulsante.
@ write_number : permette di scrivere il valore dei 4 bit meno significativi di r0 sul display a 7 segmenti 

.text

.global main
main:
    @ Salva i registri modificati
    push {r0,r1,lr}
    
    @ inizializza la GPIO
    bl set_gpio
    
    mov r1, #1
    cpy r0, r1
    mov r2, #0 @contatore per sapere quante volte uno dei bottoni è stato premuto
    bl write_led
    mov r0, r2
    
loop:
    bl write_number @ lo metto qua sopra in modo che il valore venga scritto 
    bl read_buttons
    cmp r0, #1
    bleq ruota_destra
    addeq r2 , #1
    cmp r0, #2
    bleq ruota_sinistra
    addeq r2 , #1
    bl write_led
    cpy r0, r2
    b loop

    @ Ripristina registri modificati
    pop {r0,r1,lr}
    @ Termina e ritorna dalla funzione main
    mov pc, lr

ruota_destra: 
    push {fp, lr}
    mov fp, sp 
    mov r1, r1, ROR #1
    cmp r1, #8
    movhi r1, #8 @ se il numero, senza segno è più grande di 8 allora devo mettere r1 a 8 sennò lo tengo com'è , in modo che così rientri da sinistra
    cpy r0, r1
    pop {fp, pc}


ruota_sinistra: 
    push {fp, lr}
    mov fp, sp 
    mov r1, r1, ROR #31
    cmp r1, #8
    movhi r1, #1
    cpy r0, r1
    pop {fp, pc}
    @ se il numero, senza segno è più grande di 8 allora devo mettere r1 a 1 sennò lo tengo com'è , in modo che così rientri da destra