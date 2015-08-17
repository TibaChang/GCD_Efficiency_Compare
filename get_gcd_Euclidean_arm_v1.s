	.syntax unified
	.arch armv7-a
	.text
	.align 4
	.arm
	@.thumb_func
	.global get_gcd
	.type get_gcd, function

get_gcd:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	@r0 is the "big"
	@r1 is the "small"
	push {lr}
loop:
	cmp r0,r1
	subhi r0,r0,r1	@if (big > small) big -= small;
	bhi loop
	sublo r1,r1,r0  @else if (big < small) small -= big;
	blo loop
	moveq r0,r0     @else return a;
	pop {pc}
	
	.size get_gcd, .-get_gcd
	.end
	
	
