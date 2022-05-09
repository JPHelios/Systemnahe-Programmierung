; TicTacToe

display:

; gesamtes Spielfeld wird leergerrrrräääääumt
mov p0, #0FFH
mov p1, #0FFH

; vertikale Linien zeichnen
clr p0.5
clr p0.2

clr p1.7
clr p1.6
clr p1.5
clr p1.4
clr p1.3
clr p1.2
clr p1.1
clr p1.0

; horizontale Linien zeichnen
mov p0, #0FFH
mov p1, #0FFH

clr p1.5
clr p1.2

clr p0.7
clr p0.6
clr p0.5
clr p0.4
clr p0.3
clr p0.2
clr p0.1
clr p0.0




