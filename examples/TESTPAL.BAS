'$INCLUDE: 'gratools.bi'

DEFINT A-Z

CLS
SCREEN 13

FOR i = 20 TO 119
  LINE (0, i)-(200, i), i
NEXT i

DIM bufpal(0 TO 1024) AS INTEGER

DEF SEG = VARSEG(bufpal(0))
bufp = VARPTR(bufpal(0))

FOR i = 0 TO 119
  POKE bufp, 0: bufp = bufp + 1
  POKE bufp, i / 3: bufp = bufp + 1
  POKE bufp, 0: bufp = bufp + 1
NEXT i

DO WHILE INKEY$ = "": LOOP

CALL SetPalette(bufpal())

DO WHILE INKEY$ = "": LOOP

