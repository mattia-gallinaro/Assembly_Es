.text
.global main

main : 
    LDR r0, [r2, r3, lsl #2]  @ r3 è il numero di elementi da saltare se io faccio lsl #2 
    TEQ r0 , r4 
    ADDPL r0 , r0, r4
    RSBMI r0, r4, r0