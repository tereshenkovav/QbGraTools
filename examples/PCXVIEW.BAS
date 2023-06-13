DEFINT A-Z
'$INCLUDE: 'gratools.bi'
'$DYNAMIC

IF COMMAND$ = "" THEN
  PRINT "Parameter - PCX file name"
  END
END IF

DIM buf(32102) AS INTEGER
DIM sprites(32102) AS INTEGER
DIM pic AS Sprite

CLS
SCREEN 13

CALL ResetSpriteLoader(1)
CALL LoadSpriteInBuf(sprites(), pic, COMMAND$)
CALL SetNewPalette
CALL setUpBuffer(buf(), 320, 200, 0)
CALL drawSpriteTransp(buf(), sprites(), pic.BufPos, 0, 0)

PUT (0, 0), buf(0), PSET

DO WHILE INKEY$ = "": LOOP

