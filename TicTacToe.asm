; TicTacToe

; gesamtes Spielfeld wird leergerrrrräääääumt
mov p0, #0FFH
mov p1, #0FFH

; Spielstart
mov R0, #0DBH
mov R1, #0DBH
mov R2, #00H
mov R3, #0DBH
mov R4, #0DBH
mov R5, #00H
mov R6, #0DBH
mov R7, #0DBH
JMP anfang


anfang:
; Abfrage 1te Zeile
	CLR P2.0
; jetzt jede Spalte prüfen
        JB P2.4,Check1
        MOV A, #01h
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

JMP anfang






