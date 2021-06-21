.thumb
.align

.global StaffAlwaysHits
.type StaffAlwaysHits, %function

.equ ReturnPoint,0x802CD2F

StaffAlwaysHits:
@r0 and r1 are free here, use them for allegiance comparison
@r4 = base value for hitrate, r5 = attacker, r6 = defender
add r2,r1,r0 @overwritten by hook

mov r4,#100

GoBack:
ldr r0,=ReturnPoint
bx r0

.ltorg
.align
