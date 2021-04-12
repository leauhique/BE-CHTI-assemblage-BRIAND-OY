	PRESERVE8
	THUMB   
	EXPORT timer_callback
	INCLUDE DriverJeuLaser.inc 
	
		

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
FlagCligno DCB 0 

	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		



;if (FlagCligno==1) ;si FC = 1 alors   
;	{
;		FlagCligno=0; ; FCcligno = 0  
;		GPIOB_Set(1);  	
;	}
;	else				;sinon
;	{
;		FlagCligno=1; ;FC=1  
;		GPIOB_Clear(1);GPIOB_Set(1) ; 
;	}


timer_callback proc
	
	push {lr}
	;if (FlagCligno==1) ;si FC = 1 alors  

	ldr r0,=FlagCligno
	ldrb r1,[r0]
	 
	CMP r1,#1  
	;sinon
	BNE Sinon 
	; FCcligno = 0  
	MOVS r2,#0x00
	STR r2,[r0]
	;GPIOB_Set(1)
	MOVS r0,#0x01
	BL GPIOB_Set 
	b Finsi
Sinon 
	;FCcligno = 1 
	MOVS r2,#0x01
	STR r2,[r0]
	
	MOVS r0,#0x01
	;GPIOB_clear(1)
	BL GPIOB_Clear 
Finsi
	pop {lr}
	bx lr
	endp
		
bne 



		
		
	END	