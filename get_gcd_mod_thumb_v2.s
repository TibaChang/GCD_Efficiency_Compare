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
	
	
	push {r2,r5,r6,lr}

  mov r5,r0            @r0==r5 is the "big"
	mov r6,r1            @r1==r6 is the "small"
loop:
    mov r0,r5
    mov r2,r6            @big is dividend(r0);small is divisor(r2)
    bl MOD                @big %= small
    mov r5,r1
    
    cmp r5,#0         @if (big == 0) return small;
    beq r_small           

    cmp r5,#1         @if (big == 1) return 1;
    beq r_1

    mov r0,r6            @small is dividend(r0);
    mov r2,r5            @big is divisor(r2)
    bl MOD                @small %= big
    mov r6,r1            

    cmp r6,#0         @if (small == 0) return big;
    beq r_big           

    cmp r6,#1         @if (small == 1) return 1;
    beq r_1

	b loop



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
MOD:
        

@ Entry  r0: low (remainder low) must be postive<input:Dividend>
@        r1: high (remainder high) any number
@        r2: Divisor (divisor) must be non-zero and positive<input:Divisor>

         low .req r0;
         high .req r1;
         divisor .req r2;


        mov high,#0
        .rept 33                          @ repeat 33 times
          subs high,high,divisor  @remainder = remainder - divisor
          it lo
          addlo high,high,divisor
          adcs low,low,low                @low<<1;  ((high-divisor)>0) ? (new bit=1) : (new bit=0)
          adc high,high,high  @divisor>>1 == high(64bit for high&low)<<1
        .endr

        lsr high,#1                   @shift remainder to correct position(because last divide don't know this is the last divide,it still prepare for the next divide<shift>)

@ Exit   r0: Quotient (remainder low)
@        r1: remainder (remainder high)
  
        mov pc,lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


r_small:                  @return small
	mov r0,r6
	pop {r2,r5,r6,pc}

r_1:                  @return 1
	mov r0,#1
	pop {r2,r5,r6,pc}

r_big:                  @return big
    mov r0,r5
	pop {r2,r5,r6,pc}
	
	.size get_gcd, .-get_gcd
	.end
	
	
