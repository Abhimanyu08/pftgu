.section .data
#this time we define an array of longs in our data section named data_items. To do so we define a symbol called data_items below
data_items:
.long 3,18,20,40,10,7,5,0

.section .text
.global _start
_start:
# %edi register keeps track of index in the array we are currently examining
movl $0, %edi
# %eax stores the element in the array we're currently at. We access the current element using intedexed addressing method
movl data_items(,%edi,4), %eax
# %ebx stores the maximum element yet. At the start it's just the first element in the array.
movl %eax, %ebx
#we define a label (symbol followed by a colon) for the symbol start_loop so that we can jump back to it later.
start_loop:
#if we the current element is 0 we exit by jumping to symbol loop_exit which handles the necessary exit operations
cmpl $0,%eax
je loop_exit
#we increment the current index.
incl %edi
movl data_items(,%edi,4), %eax
#cmpl takes two operands and compares them. 
cmpl %ebx,%eax

jle start_loop
movl %eax, %ebx
jmp start_loop

loop_exit:
movl $1, %eax
int $0x80
