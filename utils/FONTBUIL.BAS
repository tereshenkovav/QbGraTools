DEFINT A-Z

CLS
SCREEN 13

OPEN "font.8x8" FOR BINARY AS #1

COLOR 1
Poz = 32 * 8 + 1
FOR i = 32 TO 255
  LOCATE 1, 1
  PRINT CHR$(i)
  FOR y = 0 TO 7
    sum = 0
    tek = 1
    FOR x = 0 TO 7
      IF POINT(x, y) = 1 THEN sum = sum + tek
      tek = tek * 2
    NEXT x
    s$ = CHR$(sum)
    PUT #1, Poz, s$
    Poz = Poz + 1
  NEXT y
NEXT i


CLOSE #1

