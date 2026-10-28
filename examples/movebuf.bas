' Примитивный пример движения буфера по экрану с загрузкой сырых данных из файла
DEFINT A-Z
'$DYNAMIC
'$INCLUDE: 'gratools.bi'

CLS
SCREEN 13

DIM SHARED back(32008) AS INTEGER
DIM SHARED buf(1024) AS INTEGER

OPEN "sprite.dat" FOR BINARY AS #1

    buf(0) = 8 * 32
    buf(1) = 32

    DEF SEG = VARSEG(buf(2))
    bufp = VARPTR(buf(2))

ps$ = "*"
FOR i = 1 TO 1024
  GET #1, i, ps$
  IF i = 1 THEN ps$ = CHR$(0)
  IF ps$ = CHR$(0) THEN ps$ = CHR$(255)
  POKE bufp, ASC(ps$)
  bufp = bufp + 1
NEXT i

    DEF SEG

CLOSE #1

DIM t0 AS SINGLE

  i = 0
  di = 1

DO WHILE 1 = 1
  t0 = TIMER
  CALL setUpBuffer(back(), 320, 200, 10)
  CALL drawSpriteTransp(back(), buf(), 0, i, i)
  CALL drawSpriteTransp(back(), buf(), 0, i + 40, i)
  CALL drawSpriteTransp(back(), buf(), 0, i, i + 40)
  CALL drawSpriteTransp(back(), buf(), 0, i + 40, i + 40)
  PUT (0, 0), back(0), PSET
  i = i + di
  IF i = 120 THEN di = -1
  IF i = 0 THEN di = 1
  IF INKEY$ <> "" THEN END

  DO WHILE t0 = TIMER: LOOP
LOOP
