; TicTacToe

R8 data 0x08

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
JMP switch

; Spieler wechseln
switch: 
mov A, R8
CJNE A, #00H, setzero
mov R8, #01H
JMP schalter

setzero:
mov R8, #00H
jmp schalter

;drawplayer:
;mov A, R8
;CJNE A, #00H, drawplayerone

playerone:


schalter:
; Abfrage 1te Zeile
	CLR P2.0
; jetzt jede Spalte prüfen
        JB P2.4,Check1
        MOV A, R8
	CJNE A, #00H, playerone

	mov A, R0
	subb A, #0C0H
	mov R0, A

	mov A, R1
	subb A, #0C0H
	mov R1, A
	JMP display
	
        
        
Check1: JB P2.5,Check2
        MOV A, #02h
Check2: JB P2.6, Check3 
        MOV A, #03h
Check3: JB P2.7, Check4
        MOV A, #0Ah
Check4: Setb P2.0

; Abfrage 2te Zeile
        CLR P2.1
; jetzt jede Spalte prüfen
        JB P2.4,Check5
        MOV A, #04h
Check5: JB P2.5,Check6
        MOV A, #05h
Check6: JB P2.6,Check7 
        MOV A, #06h
Check7: JB P2.7, Check8
        MOV A, #0Bh
Check8: Setb P2.1

; Abfrage 3te Zeile
        CLR P2.2
; jetzt jede Spalte prüfen
        JB P2.4,Check9
        MOV A, #07h
Check9: JB P2.5,Check10
        MOV A, #08h
Check10: JB P2.6, Check11 
        MOV A, #09h
Check11: JB P2.7, Check12
        MOV A, #0Ch
Check12: Setb P2.2


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
JMP switch







