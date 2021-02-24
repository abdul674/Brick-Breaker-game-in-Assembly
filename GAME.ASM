.MODEL SMALL
.STACK 200H
.386

DRAW_ROW MACRO X
	LOCAL L1
	
	PUSH AX
	PUSH CX
	PUSH DX

	MOV AH,0CH
    MOV AL,5        
    MOV CX,1
    MOV DX,X
    L1:
        INT 10H
        INC CX
        CMP CX,318
        JL L1
		
	POP DX 
	POP CX
	POP AX
	
ENDM
DRAW_COLUMN MACRO Y
	LOCAL L2
	
	PUSH AX
	PUSH CX
	PUSH DX
	
    MOV AH,0CH
    MOV AL,5
    MOV CX,Y
    MOV DX,1
    L2:
        INT 10H
        INC DX
        CMP DX,199
        JL L2	
		
	POP DX 
	POP CX
	POP AX
ENDM

.DATA
	
	RIGHT 		DB 4DH
	LEFT  		DB 4BH
	
	P_START		DW 85
	P_END	 	DW 125
	P_COLOR		DB 15
	P_CHOICE	DB 0
	
	B_COLOR DB 4
	B_X 	DW 127
	B_Y 	DW 60
	B_M_X   DW 3
	B_M_Y   DW 3
	BOUNCE  DW 3
	
	LIVES	DB 3
	
	PAUSED	DB "PAUSED"
	P_X		DB 15
	P_Y		DB 30
	PAU_COL DB 0
	
	WIN		DB 30
	WIN_MSG	DB "YOU WIN...!!!"
	
	GO		DB "GAME OVER...!!!"
	GO_X	DB 15
	GO_Y	DB 6
	
    SCORE_MSG 	DB "Score : "
	SCORE_DEC	DB '0'
	SCORE_HUN	DB '0'
	SCORE_T		DW ?
	;===================================================
	;============== VARIABLE FOR BRICKS ================
	;===================================================
	
    COUNTER1   DB 0
	
	COLORBLOCK DB ?

    BLOCKCX    DW ?
    BLOCKDX    DW ? 
	
	CO DW 0
	DO DW 0
	
	BLOCK_1		DW 52
	BLOCK_2		DW 52
	BLOCK_3		DW 52
	BLOCK_4		DW 52
	BLOCK_5		DW 52
	BLOCK_6		DW 52
	
	B1_START	DW 11
	B2_START	DW 44
	B3_START	DW 77
	B4_START	DW 110
	B5_START	DW 143
	B6_START	DW 176
	
;------------------------------------------------------------------------------------------------------------
;=============================== Variables to be Printed  ===================================================
;------------------------------------------------------------------------------------------------------------
  

    WLCM      DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ========== WELCOME TO ==========" 
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ========= BRICK BREAKER ========" 
              DB  0AH,0DH,"                  ================================"
              DB  0AH,0DH,"                  ================================$"
         
    str2      DB  0AH,0DH,"     =================================================================="
              DB  0AH,0DH,"     =================================================================="
              DB  0AH,0DH,"     ============ Abdul Rehman : BITF14M521@PUCIT.EDU.PK =============="   
              DB  0AH,0DH,"     ============                                        =============="
              DB  0AH,0DH,"     ============ Sajid Mehmood: BITF14M511@PUCIT.EDU.PK =============="
			  DB  0AH,0DH,"     ============                                        =============="
              DB  0AH,0DH,"     ============ Uzair Sawati : BITF14M548@PUCIT.EDU.PK =============="
              DB  0AH,0DH,"     =================================================================="
              DB  0AH,0DH,"     ==================================================================$"
        
         
    str3      DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     =====  IT IS A SINGLE PLAYER GAME. YOU HAVE A BALL WHICH YOU  ====="
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     ========  USE TO BREAK BRICKS, BREAK ALL THE BRICKS TO   =========="
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     ========== WIN THE GAME BUT IF YOU LOSE YOUR BALL THEN ============"
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     ============================ GAME OVER ============================"
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     ===================================================================$"
        
    str5      DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     =======================    CONTROLS   ============================="
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,0AH,0DH
			  DB  0AH,0DH,"     ==================================================================="
			  DB  0AH,0DH,"     === USE UP ARROW TO START , P TO PAUSE AND ESC TO QUIT THE GAME ==="
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     == USE THE LEFT AND RIGHT ARROW KEYS TO MOVE THE BAR FROM IT'S  ==="
              DB  0AH,0DH,"     ==================================================================="
              DB  0AH,0DH,"     ======== CURRENT POSITION TO LEFT OR RIGHT RESPECTIVELY ==========="
              DB  0AH,0DH,"     ===================================================================$"   
        
                                                                       
    str6      DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ====    THANK YOU     ===="
              DB 0AH,0DH,"                  ====       FOR        ===="
              DB 0AH,0DH,"                  ==== PLAYING THE GAME ===="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ==========================$"
                         
    LOSE_MSG  DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ====     YOU LOSE     ===="
              DB 0AH,0DH,"                  =========================="
              DB 0AH,0DH,"                  ==========================$"   
              
    ITEM0     DB 0AH,0DH,"                  ==========================="
              DB 0AH,0DH,"                  ===========================",0AH,0DH,'$'
    ITEM1     DB 'NEW GAME      ====',0AH,0DH,'$'
    ITEM2     DB 'PROGRAMMED BY ====',0AH,0DH,'$'
    ITEM3     DB 'ABOUT         ====',0AH,0DH,'$'
    ITEM4     DB 'INSTRUCTIONS  ====',0AH,0DH,'$'
    ITEM5     DB 'QUIT GAME     ====',0AH,0DH,'$'         
    ITEM6     DB "                  ==========================="
              DB 0AH,0DH,"                  ===========================$"
    
    SELECTED DW 0     ; currenlty selected menu item.
    MENU_COUNT DW 5   ; number of items in menu.
    UP      EQU     48h
    DOWN    EQU     50h

    ; all menu items should be
    ; entered in this address array:
    ITEMS_ADR DW ITEM1, ITEM2,ITEM3, ITEM4,ITEM5, ITEM6
    
    SELECTOR        DB '                  ==== ->  $'
    EMPTY_SELECTOR  DB '                  ====     $'
	
	
.CODE
MAIN PROC

	MOV AX,@DATA
	MOV DS,AX
	MOV ES,AX
	
	CALL WELCOME_SCR
	CALL MAIN_MENU
	CALL SET_DISPLAY_MODE
	CALL DRAW_BOUNDARY
	CALL DRAW_PADDLE
	CALL FULLBLOCK
	CALL DRAW_BALL
	CALL MOVE_BALL
;-------------------;
;	read keyboard	;
;-------------------;
	AA :
		MOV	AH,0
		INT	16H
		CMP AL,0DH
		JNE AA
		
;-----------------------;
;	set to text mode	;
;-----------------------;
	MOV	AX,3		;select mode 3, text mode
	INT	10H
	
	MOV	AH,4CH		;return
	INT	21H			;to DOS
	
MAIN ENDP

SET_DISPLAY_MODE PROC
	PUSH AX
	
	MOV AH,0
    MOV AL,13H
    INT 10H
    MOV AH,0CH
    INT 10H
	
	POP AX
	RET
SET_DISPLAY_MODE ENDP

DRAW_BOUNDARY PROC
	DRAW_ROW 1
	DRAW_ROW 2
	DRAW_ROW 3
	DRAW_ROW 4
	
	DRAW_ROW 195
	DRAW_ROW 196
	DRAW_ROW 197
	DRAW_ROW 198
	
	
	DRAW_COLUMN 1
	DRAW_COLUMN 2
	DRAW_COLUMN 3
	DRAW_COLUMN 4
	
	DRAW_COLUMN 210
	DRAW_COLUMN 211
	DRAW_COLUMN 212
	DRAW_COLUMN 213
	
	DRAW_COLUMN 315
	DRAW_COLUMN 316
	DRAW_COLUMN 317
	DRAW_COLUMN 318

	RET
DRAW_BOUNDARY ENDP

DRAW_PADDLE PROC
	PUSH AX
	PUSH CX
	PUSH DX
	
	MOV AH,0CH
    MOV AL,P_COLOR        
    MOV CX,P_START
    MOV DX,190
    LO1:
        INT 10H
        INC CX
        CMP CX,P_END
        JNZ LO1
       
    MOV CX,P_START
    MOV DX,189
    LO2:
        INT 10H
        INC CX
        CMP CX,P_END
        JNZ LO2
		
	POP DX 
	POP CX
	POP AX
	RET
DRAW_PADDLE ENDP

MOVE_PADDLE PROC
	PUSH AX
	PUSH CX
	
	MOV P_COLOR,0			; COLOR = BLACK
	CALL DRAW_PADDLE
	MOV P_COLOR,15			; COLOR = OFF WHITE
	
	MOV AH,P_CHOICE
	CMP AH,RIGHT
	JE MR
	CMP AH,LEFT
	JE ML
	
	P_OUTPUT :
	CALL DRAW_PADDLE
	POP CX
	POP AX
	
	RET

	MR :
		CMP P_END,209
		JGE P_OUTPUT
		ADD P_START,5
		ADD P_END,5
		JMP P_OUTPUT
	ML :
		CMP P_START,6
		JLE P_OUTPUT
		SUB P_START,5
		SUB P_END,5
		JMP P_OUTPUT
MOVE_PADDLE ENDP

DRAW_BALL PROC
	PUSH AX
	PUSH CX
	PUSH DX
	
	MOV AH,0CH
    MOV AL,B_COLOR        
    MOV CX,B_X
    MOV DX,B_Y
	INT 10H
    INC CX
	INT 10H
	INC DX
	INT 10H
	DEC CX
	INT 10H
	DEC CX
	INT 10H
	DEC DX
	INT 10H
	DEC DX
	INT 10H
	INC CX
	INT 10H
	INC CX
	INT 10H
	
	
	POP DX 
	POP CX
	POP AX
	
	RET
DRAW_BALL ENDP

MOVE_BALL PROC
	PUSH CX
	PUSH BX
	PUSH AX
	PUSH SI
	CALL DISPLAY_SCORE
	
	AK :
	MOV AH,00
    INT 16H
	MOV P_CHOICE,AH
	CALL MOVE_PADDLE
	CMP AH,48H
	JNE AK
	
	BO1 :
		CALL CHECKHITBLOCK1
		MOV B_COLOR , 0
		CALL DRAW_BALL
		MOV B_COLOR , 4
		
		MOV AX , B_X
		ADD AX , B_M_X
		MOV B_X, AX
		
		CMP B_X, 208
		JGE A2
		CMP B_X, 7
		JLE A2
		BB :
		CMP B_Y, 7
		JLE A1
		
		BBBB :
		MOV AX , B_Y
		ADD AX , B_M_Y
		MOV B_Y , AX
		
		MOV AH, 1				;CHECK KEYBOARD INPUT FLAG FOR KEY
		INT 16H
		JNZ KEY_PRESSED 
		
		CC :
		CALL DRAW_BALL
		
		CMP B_Y , 185
		JG B_AT_END
		
		CMP WIN,0
		JE G_WIN
		
		DE :
		
		CALL DELAY
		JMP BO1 
	
	QUIT :
		XOR AX,AX
		XOR DX,DX
		XOR CX,CX
		MOV DH,GO_X
		MOV DL,GO_Y
		MOV AH,13H
		MOV BH,0
		LEA BP,GO
		MOV BL,10
		MOV CX,15
		INT 10H
	
	RETURN : POP SI 
	POP AX
	POP BX
	POP CX
	
	RET
	A1 :
		NEG B_M_Y
		JMP BBBB
	A2 :
		NEG B_M_X
		JMP BB
		
	KEY_PRESSED :
		MOV AX,0
		INT 16H
		CMP AL,1BH
		JE QUIT
		CMP AL,'p'
		JE PAU
		MOV P_CHOICE, AH
		MOV AH,0CH
		INT 21H
		CALL MOVE_PADDLE
		JMP CC
	
	PAU :
		MOV AH,0CH
		INT 21H
		CALL DRAW_BALL
		CALL PAUSEE
		JMP CC 
		
	
	B_AT_END :
		MOV BX,P_START
		CMP B_X , BX
		JB QUIT
		MOV BX,P_END
		CMP B_X , BX
		JG QUIT
		JL BO_BACK
		JMP DE
		
	BO_BACK :
		NEG B_M_Y
		JMP DE
		
	G_WIN :
		XOR AX,AX
		XOR DX,DX
		XOR CX,CX
		MOV DH,GO_X
		MOV DL,GO_Y
		MOV AH,13H
		MOV BH,0
		LEA BP,WIN_MSG
		MOV BL,10
		MOV CX,13
		INT 10H
		JMP RETURN
MOVE_BALL ENDP

DELAY PROC
	PUSH BX
    
        MOV EBX,12500H 
        DELAYER_LOOP:
			DEC EBX
            JNZ DELAYER_LOOP
    POP BX
	RET
DELAY ENDP

FULLBLOCK PROC
    PUSH BP
    MOV BP,SP
    PUSH BX
    PUSH DX
    PUSH CX
    PUSH AX
    
	;---------------
	;---- ROW 1 ----
	;---------------
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,11
    MOV BLOCKDX,12
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,44
    MOV BLOCKDX,12
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,77
    MOV BLOCKDX,12
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,110
    MOV BLOCKDX,12
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,143
    MOV BLOCKDX,12
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,176
    MOV BLOCKDX,12
    CALL BLOCK
	
	;---------------
	;---- ROW 2 ----
	;---------------
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,11
    MOV BLOCKDX,20
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,44
    MOV BLOCKDX,20
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,77
    MOV BLOCKDX,20
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,110
    MOV BLOCKDX,20
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,143
    MOV BLOCKDX,20
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,176
    MOV BLOCKDX,20
    CALL BLOCK
    
	;---------------
	;---- ROW 3 ----
	;---------------
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,11
    MOV BLOCKDX,28
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,44
    MOV BLOCKDX,28
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,77
    MOV BLOCKDX,28
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,110
    MOV BLOCKDX,28
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,143
    MOV BLOCKDX,28
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,176
    MOV BLOCKDX,28
    CALL BLOCK
	
	;---------------
	;---- ROW 4 ----
	;---------------
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,11
    MOV BLOCKDX,36
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,44
    MOV BLOCKDX,36
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,77
    MOV BLOCKDX,36
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,110
    MOV BLOCKDX,36
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,143
    MOV BLOCKDX,36
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,176
    MOV BLOCKDX,36
    CALL BLOCK
	
	;---------------
	;---- ROW 5 ----
	;---------------
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,11
    MOV BLOCKDX,44
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,44
    MOV BLOCKDX,44
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,77
    MOV BLOCKDX,44
    CALL BLOCK
	
	MOV COLORBLOCK,2
    MOV BLOCKCX,110
    MOV BLOCKDX,44
    CALL BLOCK
	
	MOV COLORBLOCK,4
    MOV BLOCKCX,143
    MOV BLOCKDX,44
    CALL BLOCK
	
	MOV COLORBLOCK,3
    MOV BLOCKCX,176
    MOV BLOCKDX,44
    CALL BLOCK
	
    POP AX
    POP CX
    POP DX
    POP BX
    POP BP    
    RET 

FULLBLOCK ENDP

BLOCK PROC

    PUSH BP
    MOV BP,SP
    PUSH BX
    PUSH DX
    PUSH CX
    PUSH AX
	
	CMP COLORBLOCK,0
	JNE D_B
	DEC WIN
	ADD SCORE_DEC,2
	CMP SCORE_DEC,'8'
	JG HUN
	
	DDD :
	CALL DISPLAY_SCORE
	
	D_B :
    MOV AH,0CH
    MOV AL,COLORBLOCK
	MOV CX,BLOCKCX
	MOV DX,BLOCKDX
	MOV BX,CO
	ADD BX,BLOCKCX
	ADD BX,30
	MOV CO,BX
	
	MOV BX,DO
	ADD BX,BLOCKDX
	ADD BX,5
	MOV DO,BX
	
	R1 :	
	INT	10H		
	INC	CX			;next col
	CMP	CX,CO		;more columns?
	JLE	R1	
	MOV CX,BLOCKCX
	INC DX
	CMP DX,DO
	JLE R1
	
	MOV DO,0
	MOV CO,0
    POP AX
    POP CX
    POP DX
    POP BX
    POP BP    
    RET 
	
	HUN :
		INC SCORE_HUN
		MOV SCORE_DEC,'0'
		JMP DDD
	
BLOCK ENDP

CHECKHITBLOCK1 PROC

    PUSH BP
    MOV BP,SP
    PUSH BX
    PUSH DX
    PUSH CX
    PUSH AX
	
	MOV AX,B1_START
	CMP B_X,AX
	JG BLOCK1
	
	
	
	BLOCK1 :
	
	MOV AX,B2_START
	CMP B_X,AX
	JG BLOCK2
	
	CMP BLOCK_1,12
	JE BLOCK2
	MOV CX,BLOCK_1
	CMP CX,B_Y
	JLE NO_HIT
	SUB BLOCK_1,8
	MOV COLORBLOCK,0
	MOV AX,B1_START
	MOV BLOCKCX,AX
	MOV AX,BLOCK_1
	MOV BLOCKDX,AX
	CALL BLOCK
	
	NEG B_M_Y
	SUB BLOCK_1,8
	ADD BLOCK_1,8
	JMP NO_HIT
	
	
	BLOCK2 :
	
	MOV AX,B3_START
	CMP B_X,AX
	JG BLOCK3
	
	CMP BLOCK_2,12
	JE BLOCK3
	MOV CX,BLOCK_2
	CMP CX,B_Y
	JLE NO_HIT
	SUB BLOCK_2,8
	MOV COLORBLOCK,0
	MOV AX,B2_START
	MOV BLOCKCX,AX
	MOV AX,BLOCK_2
	MOV BLOCKDX,AX
	CALL BLOCK
	
	NEG B_M_Y
	SUB BLOCK_2,8
	ADD BLOCK_2,8
	JMP NO_HIT
	
	
	
	BLOCK3 :
	
	MOV AX,B4_START
	CMP B_X,AX
	JG BLOCK4
	
	CMP BLOCK_3,12
	JE BLOCK4
	MOV CX,BLOCK_3
	CMP CX,B_Y
	JLE NO_HIT
	SUB BLOCK_3,8
	MOV COLORBLOCK,0
	MOV AX,B3_START
	MOV BLOCKCX,AX
	MOV AX,BLOCK_3
	MOV BLOCKDX,AX
	CALL BLOCK
	
	NEG B_M_Y
	SUB BLOCK_3,8
	ADD BLOCK_3,8
	JMP NO_HIT
	
	
	
	BLOCK4 :
	
	MOV AX,B5_START
	CMP B_X,AX
	JG BLOCK5
	
	CMP BLOCK_4,12
	JE BLOCK5
	MOV CX,BLOCK_4
	CMP CX,B_Y
	JLE NO_HIT
	SUB BLOCK_4,8
	MOV COLORBLOCK,0
	MOV AX,B4_START
	MOV BLOCKCX,AX
	MOV AX,BLOCK_4
	MOV BLOCKDX,AX
	CALL BLOCK
	
	NEG B_M_Y
	SUB BLOCK_4,8
	ADD BLOCK_4,8
	JMP NO_HIT
	
	
	
	BLOCK5 :
	
	MOV AX,B6_START
	CMP B_X,AX
	JG BLOCK6
	
	CMP BLOCK_5,12
	JE BLOCK6
	MOV CX,BLOCK_5
	CMP CX,B_Y
	JLE NO_HIT
	SUB BLOCK_5,8
	MOV COLORBLOCK,0
	MOV AX,B5_START
	MOV BLOCKCX,AX
	MOV AX,BLOCK_5
	MOV BLOCKDX,AX
	CALL BLOCK
	
	NEG B_M_Y
	SUB BLOCK_5,8
	ADD BLOCK_5,8
	JMP NO_HIT
	
	
	
	BLOCK6 :
	
	CMP BLOCK_1,12
	JE NO_HIT
	MOV CX,BLOCK_6
	CMP CX,B_Y
	JLE NO_HIT
	SUB BLOCK_6,8
	MOV COLORBLOCK,0
	MOV AX,B6_START
	MOV BLOCKCX,AX
	MOV AX,BLOCK_6
	MOV BLOCKDX,AX
	CALL BLOCK
	
	NEG B_M_Y
	SUB BLOCK_6,8
	ADD BLOCK_6,8
	JMP NO_HIT
	
	NO_HIT :
	
    POP AX
    POP CX
    POP DX
    POP BX
    POP BP    
    RET 


CHECKHITBLOCK1 ENDP

DISPLAY_SCORE PROC
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	PUSH BP
	
	XOR AX,AX
	XOR DX,DX
	XOR CX,CX
	MOV DH,6
	MOV DL,28
	MOV AH,13H
	MOV BH,0
	LEA BP,SCORE_MSG
	MOV BL,9
	MOV CX,8
	INT 10H
	
	PUSH AX
	MOV AL,SCORE_HUN
	MOV AH,SCORE_DEC
	MOV SCORE_T,AX
	POP AX
	
	XOR BP,BP
	MOV AH,13H
	MOV BH,0
	MOV DH,6
	MOV DL,36
	LEA BP,SCORE_T
	MOV BL,9
	MOV CX,2
	INT 10H
	
	POP BP
	POP DX
	POP CX
	POP BX
	POP AX
	RET
DISPLAY_SCORE ENDP

CLEAR_SCREEN PROC
    PUSH    AX      

	MOV	AX,3		
	INT	10H
	
    POP     AX      
    RET
CLEAR_SCREEN ENDP

MAIN_MENU PROC      
    PUSH    AX      
    PUSH    BX      
    PUSH    CX      
    PUSH    DX            

    

    START:
        PRINT_MENU:
        
            CALL CLEAR_SCREEN
            MOV AH,9
            LEA DX,ITEM0
            INT 21H
            
            MOV BX, 0
            MOV CX, MENU_COUNT
            PRINT_ITEMS:
                MOV AX,BX
                SHR AX, 1   
                CMP AX, SELECTED
                JNE NOT_SEL
                
                LEA DX, SELECTOR
                MOV AH, 09H
                INT 21H
                    
                JMP CONT
            NOT_SEL:
                LEA DX, EMPTY_SELECTOR
                MOV AH, 09H
                INT 21H
            CONT:    
                MOV DX, ITEMS_ADR[BX]
                MOV AH, 09H
                INT 21H
                
                ADD BX, 2  ; NEXT ITEM.
            LOOP PRINT_ITEMS
            
            
            
            MOV AH,9
            LEA DX,ITEM6
            INT 21H
               
            
            CHECK_FOR_KEY:
            
            MOV     AH,01H
            INT     16H
            JZ      NO_KEY
            
            MOV     AH,00H
            INT     16H
            
            CMP     AL, 1BH    ; ESC - KEY?
            JE      NOT_ENTER  ;
            
            CMP     AH, UP
            JNE     NOT_UP
            SUB     SELECTED, 1
            NOT_UP:
            
            CMP     AH, DOWN
            JNE     NOT_DOWN
            ADD     SELECTED, 1
            NOT_DOWN:
            
            
            ; enter pressed?       
            CMP    AH, 1CH
            JNE    NOT_ENTER
                CMP SELECTED, 0
                JNE NOT_ITEM_0
                CALL CLEAR_SCREEN
                JMP START_GAME
            NOT_ITEM_0:
                CMP SELECTED, 1
                JNE NOT_ITEM_1
                CALL CLEAR_SCREEN
                LEA DX, STR2
                MOV AH, 9
                INT 21H           
                MOV AH,1
                INT 21H
                JMP START  
            NOT_ITEM_1:
                CMP SELECTED, 2
                JNE NOT_ITEM_2
                CALL CLEAR_SCREEN
                LEA DX, STR3
                MOV AH, 9
                INT 21H               
                MOV AH,1
                INT 21H
                JMP START
            NOT_ITEM_2:
                CMP SELECTED, 3
                JNE NOT_ITEM_4
                CALL CLEAR_SCREEN
                LEA DX, STR5
                MOV AH, 9
                INT 21H           
                MOV AH,1
                INT 21H    
                JMP START
            NOT_ITEM_4:
                CMP SELECTED,4
                JNE NOT_ITEM_5
                CALL CLEAR_SCREEN
                LEA DX, STR6
                MOV AH, 9
                INT 21H           
                MOV AH,1
                INT 21H    
                JMP stop_prog
            NOT_ITEM_5:
                ; WAIT FOR KEY:
                MOV    AH, 00
                INT    16H    
            NOT_ENTER:
            
            
            
            ; CHECK IF OUT OF MENU BOUNDS:
            CMP    SELECTED, -1
            JNLE    OK1
            MOV    SELECTED, 0
            OK1:
                MOV AX, MENU_COUNT
                CMP    SELECTED, AX
                JNGE OK2
                DEC    AX
                MOV    SELECTED, AX
            OK2:
                JMP PRINT_MENU
            
            NO_KEY:
                JMP CHECK_FOR_KEY
        
        
        
        STOP_PROG:
            MOV AH,4CH
            INT 21H
    START_GAME:        
       
    POP     DX      
    POP     CX      
    POP     BX           
    POP     AX  
    ret      
MAIN_MENU ENDP

WELCOME_SCR PROC
    PUSH    AX      
    PUSH    BX      
    PUSH    CX      
    PUSH    DX      
                              
        CALL CLEAR_SCREEN 
        MOV AH,9
        LEA DX,WLCM
        INT 21H         
        
        MOV AH,1
        INT 21H
        
    POP     DX      
    POP     CX      
    POP     BX      
    POP     AX        

RET
WELCOME_SCR ENDP      

PAUSEE PROC
	PUSH    AX      
    PUSH    BX      
    PUSH    CX      
    PUSH    DX 
	
	SSS :
	MOV PAU_COL,9
	CALL DRAW_P
	
	MOV CX,17
	ASD:
	CALL DELAY
	MOV AH, 1				;CHECK KEYBOARD INPUT FLAG FOR KEY
	INT 16H
	JNZ K_P
	
	K_P_R :
	LOOP ASD
	
	MOV PAU_COL,0
	CALL DRAW_P
	
	MOV CX,17
	ASDF:
	CALL DELAY
	MOV AH, 1				;CHECK KEYBOARD INPUT FLAG FOR KEY
	INT 16H
	JNZ K_P1
	
	K_P1_R :
	LOOP ASDF
	
	MOV AH, 1				;CHECK KEYBOARD INPUT FLAG FOR KEY
	INT 16H
	JNZ K_P2
	
	JMP SSS
	
	R : 
	MOV PAU_COL,0
	CALL DRAW_P
	POP     DX      
    POP     CX      
    POP     BX      
    POP     AX        

RET
	K_P2 :
		MOV AX,0
		INT 16H
		CMP AL,'p'
		JE R
		JMP SSS
	
	K_P :
		MOV AX,0
		INT 16H
		CMP AL,'p'
		JE R
		JMP K_P_R

	K_P1 :
		MOV AX,0
		INT 16H
		CMP AL,'p'
		JE R
		JMP K_P1_R
PAUSEE ENDP

DRAW_P PROC
	PUSH    AX      
    PUSH    BX      
    PUSH    CX      
    PUSH    DX 
	
	XOR AX,AX
	XOR DX,DX
	XOR CX,CX
	MOV DH,P_X
	MOV DL,P_Y
	MOV AL,4
	MOV AH,13H
	MOV BH,0
	MOV BL,PAU_COL
	LEA BP,PAUSED
	MOV CX,6
	INT 10H
	
	POP     DX      
    POP     CX      
    POP     BX      
    POP     AX     
	
	RET
DRAW_P ENDP

END 
