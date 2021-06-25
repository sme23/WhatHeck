.thumb
.align

.global DeleteAllItemsASMC
.type DeleteAllItemsASMC, %function

.global GiveNewClawASMC
.type GiveNewClawASMC, %function

.macro blh to,reg=r3
	push {\reg}
	ldr \reg,=\to
	mov r14,\reg
	pop {\reg}
	.short 0xF800
.endm

.equ GetUnitStructFromEventParameter,0x800bc51
.equ MemorySlot1,0x30004BC

DeleteAllItemsASMC:

push {r14}

ldr r0,=MemorySlot1
ldr r0,[r0]
blh GetUnitStructFromEventParameter
mov r3,r0 @r3 = unit struct

mov r0,#0
add r3,#0x1E
strh r0,[r3]
strh r0,[r3,#2]
strh r0,[r3,#4]
strh r0,[r3,#6]
strh r0,[r3,#8]

pop {r0}
bx r0

.ltorg
.align


GiveNewClawASMC: @the unit we get given will always have an empty inventory

push {r14}

ldr r0,=MemorySlot1
ldr r0,[r0]
blh GetUnitStructFromEventParameter
mov r3,r0 @r3 = unit struct

ldr r0,=#0x01BD @1-use cat claw halfword
strh r0,[r3,#0x1E]

pop {r0}
bx r0

.ltorg
.align
