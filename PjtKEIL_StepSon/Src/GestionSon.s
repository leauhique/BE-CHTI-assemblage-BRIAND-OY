	PRESERVE8
	THUMB   
	EXPORT CallbackSon
	import Son
	export SortieSon	
	import LongueurSon

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
index dcd 0	
SortieSon dcd 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		

CallbackSon proc
	
	;initialisation des variables
	
	LDR R1,=Son
	LDR R3,=index
	
	LDR R13,=LongueurSon
	;LDR 
	LDR R2,[R3]
	; on regarde dans son a l'index donné 
	LDRSH R0,[R1,R2,lsl#1]
	; R2 = R2 +1
	CMP R2,R13
	;on regarde si on est en fin de tableau
	BGE Sinon
	ADD R2,R2,#1

	STR R2,[R3]
	;on met R0 entre [0;719]
	push{r4}
	ldr R1,=SortieSon
	MOV R4,#719
	ADD R0,R0,#32768
	ASR R0,R0,#16
	MUL R0,R4
	STR R0,[R1]
	pop{r4}
	
Sinon	
	

	
	
	
	bx lr 

	endp



		
		
	END	