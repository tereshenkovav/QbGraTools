'$INCLUDE: 'gratools.bi'

PRINT "Test FPU"
PRINT isFPUPresent%
IF isFPUPresent% = 1 THEN PRINT "FPU OK" ELSE PRINT "FPU missing!"

