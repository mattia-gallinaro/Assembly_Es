.text
.global find_max

@ Input:
@   * r0: indirizzo in memoria del vettore di interi con segno;
@   * r1: numero di elementi del vettore;

@ Output:
@   * r0: il valor massimo del vettore

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