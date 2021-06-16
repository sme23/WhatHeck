.thumb
.align

.global FelisRouteCommandUsability
.type FelisRouteCommandUsability, %function

.global WynRouteCommandUsability
.type WynRouteCommandUsability, %function

.global AlmarRouteCommandUsability
.type AlmarRouteCommandUsability, %function


.macro blh to,reg=r3
	push {\reg}
	ldr \reg,=\to
	mov r14,\reg
	pop {\reg}
	.short 0xF800
.endm

.equ CheckEventId,0x8083da8


FelisRouteCommandUsability:
push {r14}
ldr r0,=FelisRouteCompleteFlagLink
ldrh r0,[r0]
blh CheckEventId
cmp r0,#0
beq FelisRoute_RetTrue

mov r0,#3
b FelisRoute_GoBack

FelisRoute_RetTrue:
mov r0,#1

FelisRoute_GoBack:
pop {r1}
bx r1

.ltorg
.align



WynRouteCommandUsability:
push {r14}
ldr r0,=WynRouteCompleteFlagLink
ldrh r0,[r0]
blh CheckEventId
cmp r0,#0
beq WynRoute_RetTrue

mov r0,#3
b WynRoute_GoBack

WynRoute_RetTrue:
mov r0,#1

WynRoute_GoBack:
pop {r1}
bx r1

.ltorg
.align


AlmarRouteCommandUsability:
push {r14}
ldr r0,=AlmarRouteCompleteFlagLink
ldrh r0,[r0]
blh CheckEventId
cmp r0,#0
beq AlmarRoute_RetTrue

mov r0,#3
b AlmarRoute_GoBack

AlmarRoute_RetTrue:
mov r0,#1

AlmarRoute_GoBack:
pop {r1}
bx r1

.ltorg
.align
