.section .data
data_items:
.long 10,20,1,200,21,50,30,0

.section .text
.global _start
_start:

movl $0, %edi
movl data_items(,%edi,4), %eax
movl %eax, %ebx

start_loop:
cmpl $0, %eax
je exit_loop

incl %edi
movl data_items(,%edi,4),%eax
cmpl %ebx,%eax
jle start_loop

movl %eax,%ebx
jmp start_loop

exit_loop:
movl $1, %eax
int $0x80
