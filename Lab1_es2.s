.global _start
_start:
	
	mov r1, #0xf
	mov r2, #3
	
	@effettua la differenza tra r1 e r2 e se il risulato è negativo
	@shifta verso destra di 0 per avere il valore senza segno
	
	subs r0, r2, r1
	rsbmi r0, r0, #0
	
	mov pc, lr @per terminare il programma
