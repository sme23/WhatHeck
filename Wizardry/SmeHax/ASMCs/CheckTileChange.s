.thumb
.align

.global CheckTileChangeASMC
.type CheckTileChangeASMC, %function

.global ClearMoveRestrictionASMC
.type ClearMoveRestrictionASMC, %function

.macro blh to,reg=r3
	push {\reg}
	ldr \reg,=\to
	mov r14,\reg
	pop {\reg}
	.short 0xF800
.endm

.equ AreMapChangeTriggered,0x802E639
.equ MemorySlot1, 0x30004BC
.equ MemorySlotC, 0x30004E8

CheckTileChangeASMC:
push {r14}
ldr r0,=MemorySlot1
ldr r0,[r0]
blh AreMapChangeTriggered
ldr r1,=MemorySlotC
str r0,[r1]
pop {r0}
bx r0

.ltorg
.align


.equ GetUnitStructFromEventParameter,0x800BC51

ClearMoveRestrictionASMC:
push {r14}
ldr r0,=MemorySlot1
ldr r0,[r0]
blh GetUnitStructFromEventParameter
mov r1,#0
add r0,#0x41
strb r1,[r0]
pop {r0}
bx r0

.ltorg
.align


