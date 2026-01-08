'$INCLUDE: 'gratools.bi'

DEFINT A-Z
CLS

mouseok = isMouseDriverPresent%
CALL getMouseResolution(mouserx, mousery)

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

LOCATE 3, 2: PRINT "Resolution:"; mouserx; "x"; mousery

CALL getMouse(oldmx, oldmy, ml, mb)

WHILE (1 = 1)
  CALL getMouse(mx, my, ml, mb)
  LOCATE 4, 2: PRINT "Mouse X:"; mx; "   "
  LOCATE 5, 2: PRINT "Mouse Y:"; my; "   "
  LOCATE 6, 2: PRINT "Mouse LB:"; ml
  LOCATE 7, 2: PRINT "Mouse RB:"; mb
 
  LOCATE 9, 2: PRINT "Hold both left and right button and"
  LOCATE 10, 2: PRINT "moving to borders for jump mouse to other border"
  LOCATE 12, 2: PRINT "Press Esc to exit"

  IF (ml <> 0) AND (mb <> 0) THEN
    IF (mx = 0) AND (mx < oldmx) THEN
      CALL setMousePos(mouserx, my): mx = mouserx
    ELSE
      IF (mx = mouserx) AND (mx > oldmx) THEN CALL setMousePos(0, my): mx = 0
    END IF
    IF (my = 0) AND (my < oldmy) THEN
      CALL setMousePos(mx, mousery): my = mousery
    ELSE
      IF (my = mousery) AND (my > oldmy) THEN CALL setMousePos(mx, 0): my = 0
    END IF
  END IF
 
  oldmx = mx
  oldmy = my
  IF INKEY$ = CHR$(27) THEN END

WEND

