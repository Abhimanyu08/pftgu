.section .data
number:
.long 2

.section .text
.global _start
_start:

movl $number, %edi
movl (%edi), %ebx
movl $1, %eax
int $0x80

