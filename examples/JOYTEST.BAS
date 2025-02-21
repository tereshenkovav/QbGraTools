DEFINT A-Z
'$INCLUDE: 'gratools.bi'

DIM Event1A AS STRING
DIM Event2A AS STRING
DIM Event1B AS STRING
DIM Event2B AS STRING

DIM J201X AS INTEGER
DIM J201Y AS INTEGER
DIM J201A AS INTEGER
DIM J201B AS INTEGER
DIM J201FOUND AS INTEGER

start:

CLS
PRINT "  *************************************"
PRINT "  *  Test DOS joystick [Esc to exit]  *"
FOR i = 1 TO 20
  PRINT "  *                                   *"
NEXT i
PRINT "  *************************************"

WHILE 1 = 1
  CALL readJoystickByPort(J201X, J201Y, J201A, J201B, J201FOUND)
 
  LOCATE 3, 6
  COLOR 4
  IF isJoystickPortPresent% = 1 THEN
    COLOR 2
    PRINT "[Gameport Found]"
  ELSE
    COLOR 4
    PRINT "[GamePort NOT found]"
  END IF
 
  LOCATE 4, 6
  IF J201FOUND = 1 THEN
    COLOR 2
    PRINT "[Joystick at port 201 Found]"
  ELSE
    COLOR 4
    PRINT "[Joystick at port 201 NOT found]"
  END IF

  COLOR 7

  LOCATE 6, 6
  PRINT "X of Joystick A:" + STR$(STICK(0)) + "  "
  LOCATE 7, 6
  PRINT "Y of Joystick A:" + STR$(STICK(1)) + "  "
  LOCATE 8, 6
  PRINT "X of Joystick B:" + STR$(STICK(2)) + "  "
  LOCATE 9, 6
  PRINT "Y of Joystick B:" + STR$(STICK(3)) + "  "
  
  LOCATE 11, 6
  PRINT "Key1 of Joystick A:" + STR$(STRIG(1)) + "  "
  LOCATE 12, 6
  PRINT "Key2 of Joystick A:" + STR$(STRIG(5)) + "  "
  LOCATE 13, 6
  PRINT "Key1 of Joystick B:" + STR$(STRIG(3)) + "  "
  LOCATE 14, 6
  PRINT "Key2 of Joystick B:" + STR$(STRIG(7)) + "  "
 
  LOCATE 16, 6
  PRINT "Event1 of Joystick A: " + Event1A
  LOCATE 17, 6
  PRINT "Event2 of Joystick A: " + Event2A
  LOCATE 18, 6
  PRINT "Event1 of Joystick B: " + Event1B
  LOCATE 19, 6
  PRINT "Event2 of Joystick B: " + Event2B
 
  LOCATE 21, 6
  PRINT "Port201 reading Joystick A:"
  LOCATE 22, 6
  PRINT "X:" + STR$(J201X) + "  Y:" + STR$(J201Y) + "  Key1:" + STR$(J201A) + "  Key2:" + STR$(J201B) + " "

  IF INKEY$ = CHR$(27) THEN END

  IF STRIG(0) THEN Event1A = Event1A + "+ "
  IF STRIG(4) THEN Event2A = Event2A + "+ "
  IF STRIG(2) THEN Event1B = Event1B + "+ "
  IF STRIG(6) THEN Event2B = Event2B + "+ "

  IF LEN(Event1A) > 30 THEN
    Event1A = ""
    GOTO start
  END IF
  IF LEN(Event2A) > 30 THEN
    Event2A = ""
    GOTO start
  END IF
  IF LEN(Event1B) > 30 THEN
    Event1B = ""
    GOTO start
  END IF
  IF LEN(Event2B) > 30 THEN
    Event2B = ""
    GOTO start
  END IF
WEND
