   PROGRAM 4
   BR L1
L0:
   PROC 4
   LDLADDR 8
   LDGADDR 0
   LOADW
   STOREW
   LDCSTR "n = "
   PUTSTR
   LDLADDR 8
   LOADW
   PUTINT
   PUTEOL
   RET 0
L1:
   LDGADDR 0
   LDCINT 5
   STOREW
   CALL L0
   HALT
