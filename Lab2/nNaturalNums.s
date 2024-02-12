	AREA reset, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD	Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0, =src
	LDR R1, [R0]
	SUB R2, R1, #1
	MLA R3, R2, R1, #0 ;or MUL R3, R2, R1
	LSR R3, #1
	
STOP B STOP
src DCD 0x00000008
	AREA mydata, DATA, READWRITE
DST DCD 0,0
	END
	
	
;sum of first n natural numbers
