	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func
	.global get_gcd
	.type get_gcd, function

get_gcd:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	@r0 is the "big"
	@r1 is the "small"
	push {r2,r3,lr}
loop:
	mov r2,r0       @backup r0
	mov r3,r1       @backup r1

	cmp r0,r1
	itt hi
	subhi r0,r0,r1	@if (big > small) big -= small;
	bhi loop

	cmp r0,r1
	itt lo
	sublo r1,r1,r0  @else if (big < small) small -= big;
	blo loop

	pop {r2,r3,pc}  @else return a;
	
	.size get_gcd, .-get_gcd
	.end
	
	
