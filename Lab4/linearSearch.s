	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN 
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=SRC
	LDR R5,=DST
	MOV R1,#10
	LDR R2,=CHK
	LDR R3,[R2]
BACK	LDR R4,[R0],#4
	CMP R4,R3
	BEQ EXIT
	SUBS R1,#1
	BNE BACK
	MOV R6,#99
	STR R6,[R5]
	B STOP
EXIT MOV R6,#11
	STR R6,[R5]
STOP B STOP
SRC DCD 0xABCD,0xA1B2, 0xD1C2 ,0xD3C2  ,0xD1C4,0xD123,0xF324,0x54F3,0x543E,0x1223
CHK DCD 0xFFFF
	AREA mydata, DATA, READWRITE
DST DCD 0
	END
