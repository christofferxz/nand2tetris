@color
M=0
@oldkbd
M=0

(LOOP)
  //SETUP PAINT
  @8192
  D=A
  @ri
  M=D
  @SCREEN
  D=A
  @r
  M=D

  @WATCHKBD
  0;JMP

(WATCHKBD)
  @KBD
  D=M
  @oldkbd
  D=D&M
  @LOOP
  D;JGT

  @KBD
  D=M
  @oldkbd
  M=D
  @UPDATECOLOR
  0;JMP

(UPDATECOLOR)
  @KBD
  D=M

  @WHITE
  D;JEQ
  @BLACK
  D;JGT
  
(WHITE)
  @color
  M=0
  @PAINT
  0;JMP

(BLACK)
  @color
  M=-1
  @PAINT
  0;JMP

(PAINT)
   // Se ri === 0 => LOOP
  @ri
  D=M
  @LOOP
  D;JEQ

  // Seleciona o address da row e pinta
  @color
  D=M
  @r
  A=M
  M=D

  // Pega a proxima row
  @r
  M=M+1

  // i--
  @ri
  M=M-1

  // Chama o PAINT
  @PAINT
  0;JMP