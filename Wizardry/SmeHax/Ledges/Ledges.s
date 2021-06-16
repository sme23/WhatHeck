.thumb
.align

.global LedgeHitBonus
.type LedgeHitBonus, %function


.equ gChapterData,0x202BCF0

LedgeHitBonus:
push {r4-r7,r14}
mov r4,r0 @attacker
mov r5,r1 @defender

@since this gets run twice we only need to apply the change to the attacker

@check if valid chapter for bonuses

ldr r2,=LedgeChapterList
ldr r1,=gChapterData
ldrb r1,[r1,#0xE]
mov r3,#0

LoopStart:
ldrb r0,[r2]
cmp r0,#0xFF
beq GoBack
cmp r0,r1
beq LoopExit
add r2,#1
add r3,#1
b LoopStart

.ltorg
.align

LoopExit:

ldr r0,=HeightMapTable
lsl r1,r3,#2
add r0,r1
ldr r3,[r0]

@get height values of attacker and defender
ldrb r0,[r4,#0x10]
ldrb r1,[r4,#0x11]
lsl r1,r1,#2
add r1,r3
ldr r1,[r1]
add r0,r1
ldrb r6,[r0] @r6 = attacker height

ldrb r0,[r5,#0x10]
ldrb r1,[r5,#0x11]
lsl r1,r1,#2
add r1,r3
ldr r1,[r1]
add r0,r1 
ldrb r7,[r0] @r7 = defender height


@want to give attacker a hit buff or debuff of 10*(attacker height-defender height)
@ if aHeight = bHeight, b GoBack
@ if aHeight < bHeight, sub aHit,(bHeight-aHeight)*10
@ if aHeight > bHeight, add aHit,(aHeight-bHeight)*10

cmp r6,r7
beq GoBack

cmp r6,r7
blt DoHitDebuff

DoHitBuff:
sub r3,r6,r7
mov r2,#10
mul r3,r2
mov r0,r4
add r0,#0x60
ldrh r1,[r0]
add r1,r3
strh r1,[r0]
b GoBack

.ltorg
.align

DoHitDebuff:
sub r3,r7,r6
mov r2,#10
mul r3,r2
mov r0,r4
add r0,#0x60
ldrh r1,[r0]
sub r1,r3
strh r1,[r0]

GoBack:
pop {r4-r7}
pop {r0}
bx r0

.ltorg
.align
