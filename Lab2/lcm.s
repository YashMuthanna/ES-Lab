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
	MOV R5,#15
	MOV R6,#20
	MOV R1,#0
	MOV R3,#1
LIP MUL R1,R3,R6
	MOV R2,R5
	BL DIV
	CMP R1,#0
	BEQ EXIT
	ADD R3,#1
	B LIP
EXIT MUL R1,R3,R6
STOP B STOP
DIV
LOOP CMP R1,R2
	BEQ OOF
	BLE NEXT
OOF SUB R1,R2
	B LOOP
NEXT BX LR 
	AREA mydata, DATA, READWRITE
DST DCD 0
	END