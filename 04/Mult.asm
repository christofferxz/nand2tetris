// [Setup]
// Index
  @R1
  D=M
  @i
  M=D
// R2
  @R2
  M=0

(LOOP)
  // [(i === 0) => goto END]
  @i
  D=M
  @END
  D;JEQ 

  // Add R2 = R2 + R0
  @R0
  D=M
  @R2
  M=D+M

  // i--
  @i
  M=M-1

  // goto LOOP
  @LOOP
  0;JMP

(END)
  @END
  0;JMP