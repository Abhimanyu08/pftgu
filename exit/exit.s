
# Anythign starting with period(.) in assembly is not translated to machine code but is just an instruction to the assembler. .section .data means we're starting a section where we specify all the data that'll be used in our program
.section .data
# .section .text means we'll starting the write instructions. 
.section .text
# _start below is a symbol. symbols are just placeholders for other things. they'll be replaces by instructions or data later. .globl tells the assembler to not discard the _start symbol because linker will need it later.
.globl _start
# A symbol followed by a colon in a label. labels define symbol's values.
_start:
# movl stands for move long. We summon long integer 1 using immediate addressing mode. movl is an instruction that takes two operands - a source operand and a destination operand. It moves the source operand into destination operand. In this case we move number 1 into register %eax
movl $1, %eax
#mov number 0 into %ebx register
movl $0, %ebx
#interrupt and handle over the control to linux kernel. 0x80 is the interrupt number
int $0x80

# the linux kernel looks at the number stored in %eax register to determine what system call to execute. since we have 1 stored which corresponds to exit system call, the program will simply exit.

# if we exit the program, we need to specify what should be the exit status in %ebx register. 
