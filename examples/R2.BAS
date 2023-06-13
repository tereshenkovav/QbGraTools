DEFINT A-Z
'$INCLUDE: 'gratools.bi'
'$DYNAMIC

DIM buf(32000) AS INTEGER
DIM sprites(32000) AS INTEGER
DIM pic AS Sprite

CONST COLORGROUND = 16
CONST COLORSEA = 17
CONST COLORSHORE = 18

CLS
SCREEN 13

CALL ResetSpriteLoader(20)
CALL InitSpriteBuf(sprites())
CALL LoadTranspSpriteInBuf(sprites(), pic, "r2.pcx", 0, 0)
CALL SetNewPalette
CALL setUpBuffer(buf(), 200, 200, COLORGROUND)
CALL drawSpriteTransp(buf(), sprites(), pic.BufPos, 100, 100)

PALETTE COLORGROUND, 65536 * 22 + 256 * 42 + 28
PALETTE COLORSEA, 65536 * 50 + 256 * 38 + 8
PALETTE COLORSHORE, 65536 * 55 + 256 * 46 + 41

' landing
X = 50
Y = 10
CALL fillRect(buf(), X, Y, 25, 175, 8)
FOR i = 0 TO 7
  CALL fillRect(buf(), X + 11, Y + 20 + 18 * i, 3, 14, 15)
NEXT i
CALL fillRect(buf(), X + 4, Y + 38, 5, 7, 15)
CALL fillRect(buf(), X + 16, Y + 38, 5, 7, 15)
CALL fillRect(buf(), X + 4, Y + 164, 5, 7, 15)
CALL fillRect(buf(), X + 16, Y + 164, 5, 7, 15)

CALL fillRect(buf(), X + 2, Y + 4, 9, 10, 15)
CALL fillRect(buf(), X + 14, Y + 4, 9, 10, 15)
' end landing

CALL fillRect(buf(), 150, 0, 50, 200, COLORSEA)
FOR i = 0 TO 199
  IF i < 120 THEN
    CALL drawLineHorz(buf(), 170 - i / 5, 199, i, COLORSEA)
  ELSE
    CALL drawLineHorz(buf(), 170 - 120 / 5 - (i - 120) / 2, 199, i, COLORSEA)
    CALL drawLineHorz(buf(), 170 - 120 / 5 - (i - 120) / 2, 170 - 120 / 5 + (i - 120) / 3, i, COLORSHORE)
  END IF
NEXT
CALL fillRect(buf(), 140, 0, 10, 200, COLORSHORE)

PUT (0, 0), buf(0), PSET

DO WHILE INKEY$ = "": LOOP

