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
JMP display

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

JMP display






