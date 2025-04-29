'$INCLUDE: 'gratools.bi'

DEFINT A-Z
CALL setNewKeyHandler

CLS
PRINT "Map of pressed keys (use Esc for exit)"
WHILE 1 = 1
  LOCATE 3, 1
  FOR I = 1 TO 127
    A = isKeyPressed(I)
    SI$ = STR$(I)
    IF LEN(SI$) = 2 THEN SI$ = "  " + SI$
    IF LEN(SI$) = 3 THEN SI$ = " " + SI$
    IF A = 1 THEN SA$ = "+" ELSE SA$ = " "
    PRINT SI$; ": "; SA$; "  ";
    IF I MOD 8 = 0 THEN PRINT
  NEXT I%

  S$ = INKEY$
  IF S$ = CHR$(27) THEN GOTO FIN

WEND

FIN:

CALL setOldKeyHandler

