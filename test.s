.globl main
main:

mov $0x8b4,%rdx
movb $0x0, -0xc(%rsp)
movabs $0xedd5a792ef95fa9e,%r10
mov $0xffffffcc, %r9d
nop

L0:
cmp $0x2,%edi
jne ERR

L1:
xor %ecx,%ecx

L2:
cmp $0x7,%ecx
ja L6

L3:
movq 0x8(%rsi),%r11
movsxd %ecx,%rax

movzxb (%r11,%rax,1), %r11d
movb %r11b,-0x8(%rsp,%rax,1)

L4:
movsxd %ecx,%rax
cmpb $0x0,-0x8(%rsp,%rax,1)
je L6

L5:
add $0x1,%ecx
jmp L2

L6:
cmp $0x8,%ecx
jne ERR

L7:
mov %r9d,%r8d

L8:
xor %ecx,%ecx

L9:
cmp $0x7,%ecx
jbe La
jmp Ld

La:
movsxd %ecx,%rax
lea (%r8,%rcx,1),%r11d
xorb %r11b,-0x8(%rsp,%rax,1)

Lb:
movsxd %ecx,%rax
movzxb -0x8(%rsp,%rax,1), %r8d

Lc:
movl -0xc(%rsp),%eax
add $0x1,%ecx
cmp $0xd,%eax
jbe L9

Ld:
cmpq %r10,-0x8(%rsp)
je OK
jmp ERR

OK:
movl $4,%eax
movl $1,%ebx
movl $msg,%ecx
movl $13,%edx
int $0x80

movl $1,%eax
movl $0,%ebx
int $0x80

ERR:
movl $4,%eax
movl $1,%ebx
movl $msg2,%ecx
movl $13,%edx
int $0x80

movl $1,%eax
movl $0,%ebx
int $0x80

mov $0x1,%eax
retq

.data
msg: .asciz "Hello,world!\n"
msg2: .asciz "ERR!\n"
