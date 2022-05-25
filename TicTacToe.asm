; TicTacToe

R8 data 0x08

F1 data 0x09
F2 data 0x0A
F3 data 0x0B
F4 data 0x0C
F5 data 0x0D
F6 data 0x0E
F7 data 0x0F
F8 data 0x10
F9 data 0x11

Johannes data 0x12

; gesamtes Spielfeld wird leergeräumt
mov p0, #0FFH
mov p1, #0FFH

; Spielstart

; Spielfeld register
mov R0, #0DBH ; Zeile 1
mov R1, #0DBH ; Zeile 2
mov R2, #00H  ; Zeile 3
mov R3, #0DBH ; Zeile 4
mov R4, #0DBH ; Zeile 5
mov R5, #00H  ; Zeile 6
mov R6, #0DBH ; Zeile 7
mov R7, #0DBH ; Zeile 8
mov R8, #00H  ; Spieler 

mov F1, #0FFH
mov F2, #0FEH
mov F3, #0FDH
mov F4, #0FCH
mov F5, #0FBH
mov F6, #0FAH
mov F7, #0F9H
mov F8, #0F8H

JMP display

;--------------------------------

; Spieler wechseln
switch: mov A, R8
	CJNE A, #00H, setzero
	mov R8, #01H
	JMP checkrow1

setzero:
	mov R8, #00H
	jmp checkrow1

checkrow1:
	mov A, F1
	cjne A, F2, checkrow2
	cjne A, F3, checkrow2
	mov Johannes, A
	jmp getwinner

checkrow2:
	mov A, F4
	cjne A, F5, checkrow3
	cjne A, F6, checkrow3
	mov Johannes, A
	jmp getwinner

checkrow3:
	mov A, F7
	cjne A, F8, checkcol1
	cjne A, F9, checkcol1
	mov Johannes, A
	jmp getwinner

checkcol1:
	mov A, F1
	cjne A, F4, checkcol2
	cjne A, F7, checkcol2
	mov Johannes, A
	jmp getwinner

checkcol2:
	mov A, F2
	cjne A, F5, checkcol3
	cjne A, F8, checkcol3
	mov Johannes, A
	jmp getwinner

checkcol3:
	mov A, F3
	cjne A, F6, checkdiag1
	cjne A, F9, checkdiag1
	mov Johannes, A
	jmp getwinner

checkdiag1:
	mov A, F1
	cjne A, F5, checkdiag2
	cjne A, F9, checkdiag2
	mov Johannes, A
	jmp getwinner

checkdiag2:
	mov A, F3
	cjne A, F5, nope
	cjne A, F7, nope
	mov Johannes, A
	jmp getwinner

nope:
	ljmp display

getwinner:
	mov A, Johannes
	cjne A, #2H, winner1
	jmp winner2

winner1:
	mov R0, #0FFH
	mov R1, #0FFH
	mov R2, #0C3H
	mov R3, #0C3H
	mov R4, #0C3H
	mov R5, #0C3H
	mov R6, #0FFH
	mov R7, #0FFH
	ljmp display

winner2:
	mov R0, #0FFH
	mov R1, #0FFH
	mov R2, #0DFH
	mov R3, #0EFH
	mov R4, #0F7H
	mov R5, #0FBH
	mov R6, #0FFH
	mov R7, #0FFH
	ljmp display

schalter:
	setb P2.2
	setb P2.1
	; Abfrage 1te Zeile
	CLR P2.0

	; jetzt jede Spalte prüfen
	JB P2.4,Check1
loop1:
	mov A, P2
	cjne A, #0FEH, loop1

	MOV A, R8
	CJNE A, #00H, f1p1
	JMP f1p2

f1p1:
	mov F1, #1H
	mov A, R0
	subb A, #0C0H
	mov R0, A

	mov A, R1
	subb A, #0C0H
	mov R1, A
	LJMP switch

f1p2:
	mov F1, #2H
	mov A, R0
	subb A, #80H
	mov R0, A

	mov A, R1
	subb A, #40H
	mov R1, A
	LJMP switch
	
           
Check1: setb P2.2
	setb P2.1
	CLR P2.0
	JB P2.5,Check2
loop2:
	mov A, P2
	cjne A, #0FEH, loop2
	
	MOV A, R8
	CJNE A, #00H, f2p1

	JMP f2p2

f2p1:
	mov F2, #1H
	mov A, R0
	subb A, #18H
	mov R0, A

	mov A, R1
	subb A, #18H
	mov R1, A
	LJMP switch

f2p2:
	mov F2, #2H
	mov A, R0
	subb A, #10H
	mov R0, A

	mov A, R1
	subb A, #8H
	mov R1, A
	LJMP switch
        
Check2: setb P2.2
	setb P2.1
	CLR P2.0
	JB P2.6, Check3

loop3:
	mov A, P2
	cjne A, #0FEH, loop3
        MOV A, R8
	CJNE A, #00H, f3p1

	JMP f3p2

f3p1:
	mov F3, #1H
	mov A, R0
	subb A, #3H
	mov R0, A

	mov A, R1
	subb A, #3H 
	mov R1, A
	LJMP switch

f3p2:
	mov F3, #2H
	mov A, R0
	subb A, #2H
	mov R0, A

	mov A, R1
	subb A, #1H
	mov R1, A
	LJMP switch

Check3: Setb P2.0
	setb P2.2
	; Abfrage 2te Zeile
        CLR P2.1
	; jetzt jede Spalte prüfen
        JB P2.4,Check4

loop4:
	mov A, P2
	cjne A, #0FDH, loop4
	
        MOV A, R8
        CJNE A, #00H, f4p1

        JMP f4p2

f4p1:
	mov F4, #1H
	mov A, R3
	subb A, #0C0H
	mov R3, A

	mov A, R4
	subb A, #0C0H
	mov R4, A
	LJMP switch

f4p2:
	mov F4, #2H
	mov A, R3
	subb A, #80H
	mov R3, A

	mov A, R4
	subb A, #40H
	mov R4, A
	LJMP switch
        
Check4: Setb P2.0
	setb P2.2
        CLR P2.1
        JB P2.5,Check5

loop5:
	mov A, P2
	cjne A, #0FDH, loop5
	
        MOV A, R8
	CJNE A, #00H, f5p1

	JMP f5p2

f5p1:
	mov F5, #1H
	mov A, R3
	subb A, #18H
	mov R3, A

	mov A, R4
	subb A, #18H
	mov R4, A
	LJMP switch

f5p2:
	mov F5, #2H
	mov A, R3
	subb A, #10H
	mov R3, A

	mov A, R4
	subb A, #8H
	mov R4, A
	LJMP switch
        
Check5: Setb P2.0
	setb P2.2
        CLR P2.1
        JB P2.6,Check6

loop6:
	mov A, P2
	cjne A, #0FDH, loop6
        
        MOV A, R8
        CJNE A, #00H, f6p1

        JMP f6p2

f6p1:
	mov F6, #1H
	mov A, R3
	subb A, #3H
	mov R3, A

	mov A, R4
	subb A, #3H
	mov R4, A
	LJMP switch


f6p2:
	mov F6, #2H
	mov A, R3
	subb A, #2H
	mov R3, A

	mov A, R4
	subb A, #1H
	mov R4, A
	LJMP switch
        
Check6: Setb P2.1
	setb P2.0
	; Abfrage 3te Zeile
        CLR P2.2
	; jetzt jede Spalte prüfen
        JB P2.4,Check7

loop7: 
	mov A, P2
	cjne A, #0FBH, loop7
        MOV A, R8
        CJNE A, #00H, f7p1

        JMP f7p2

f7p1:
	mov F7, #1H
	mov A, R6
	subb A, #0C0H
	mov R6, A

	mov A, R7
	subb A, #0C0H
	mov R7, A
	LJMP switch	

f7p2:
	mov F7, #2H
	mov A, R6
	subb A, #80H
	mov R6, A

	mov A, R7
	subb A, #40H
	mov R7, A
	LJMP switch
        
Check7: Setb P2.1
	setb P2.0
        CLR P2.2
        JB P2.5,Check8

loop8:
	mov A, P2
	cjne A, #0FBH, loop8
	
        MOV A, R8
        CJNE A, #00H, f8p1

        JMP f8p2

f8p1:
	mov F8, #1H
	mov A, R6
	subb A, #18H
	mov R6, A

	mov A, R7
	subb A, #18H
	mov R7, A
	LJMP switch

f8p2:
	mov F8, #2H
	mov A, R6
	subb A, #10H
	mov R6, A

	mov A, R7
	subb A, #8H
	mov R7, A
	LJMP switch

Check8: Setb P2.1
	setb P2.0
        CLR P2.2
        JB P2.6, Check9

loop9:
	mov A, P2
	cjne A, #0FBH, loop9
        MOV A, R8
        CJNE A, #00H, f9p1

        JMP f9p2

f9p1:
	mov F9, #1H
	mov A, R6
	subb A, #3H
	mov R6, A

	mov A, R7
	subb A, #3H
	mov R7, A
	LJMP switch

f9p2:
	mov F9, #2H
	mov A, R6
	subb A, #2H
	mov R6, A

	mov A, R7
	subb A, #1H
	mov R7, A
	LJMP switch

Check9: Setb P2.2
	setb P2.0
	setb P2.1


display:
mov P0, R0
clr p1.7
setb p1.7

mov P0, R1
clr p1.6
setb p1.6

mov P0, R2
clr p1.5
setb p1.5

mov P0, R3
clr p1.4
setb p1.4

mov P0, R4
clr p1.3
setb p1.3

mov P0, R5
clr p1.2
setb p1.2

mov P0, R6
clr p1.1
setb p1.1

mov P0, R7
clr p1.0
setb p1.0

;JMP schalter
LJMP schalter







