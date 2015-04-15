// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

//  @KBD
//  D=M
//  @255
//  D=A

(LOOP0)
  // ptr = SCREEN
  @SCREEN
  D=A
  @ptr
  M=D

  // i = 0
  @i
  M=0

  // Keyboard
  @KBD
  D=M
  @BLACK
  D,JNE
(WHITE)
  // data = $0000
  D=0
  @SETD
  0,JMP
(BLACK)
  // data = $ffff
  D=-1
(SETD)
  @data
  M=D
  
(LOOP1)
  @data
  D=M

  // *ptr = D
  @ptr
  A=M
  M=D
  // ptr++
  @ptr
  M=M+1

  @i
  M=M+1
  D=M
  @8191
  D=A-D
  @LOOP1
  D;JGE 

  @LOOP0
  0;JMP