.thumb
.align

.global StaffAlwaysHitOnSameAllegiance
.type StaffAlwaysHitOnSameAllegiance, %function




.equ ReturnPoint,0x802CD2F

StaffAlwaysHitOnSameAllegiance:
@r0 and r1 are free here, use them for allegiance comparison
@r5 = attacker, r6 = defender
add r2,r1,r0 @overwritten by hook

ldrb r0,[r5,#0xB]
ldrb r1,[r6,#0xB]
lsr r0,r0,#6
lsl r0,r0,#6
lsr r1,r1,#6
lsl r1,r1,#6
cmp r0,r1
bne GoBack

mov r4,#100

GoBack:
ldr r0,=ReturnPoint
bx r0

.ltorg
.align
