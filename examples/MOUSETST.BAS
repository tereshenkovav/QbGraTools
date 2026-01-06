'$INCLUDE: 'gratools.bi'

DEFINT A-Z
CLS

mouseok = isMouseDriverPresent%

LOCATE 2, 2: PRINT "Mouse driver:";
LOCATE 2, 16
IF mouseok = 1 THEN
  COLOR 2
  PRINT "[Found]"
ELSE
  COLOR 4
  PRINT "[Not Found]"
END IF

COLOR 7

WHILE (1 = 1)
  CALL getMouse(mx, my, ml, mb)
  LOCATE 4, 2: PRINT "Mouse X:"; mx; "   "
  CALL getMouse(mx, my, ml, mb)
  LOCATE 5, 2: PRINT "Mouse Y:"; my; "   "
  CALL getMouse(mx, my, ml, mb)
  LOCATE 6, 2: PRINT "Mouse LB:"; ml
  CALL getMouse(mx, my, ml, mb)
  LOCATE 7, 2: PRINT "Mouse RB:"; mb
 
  LOCATE 9, 2: PRINT "Press Esc to exit"
  IF INKEY$ = CHR$(27) THEN END
WEND

