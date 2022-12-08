	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 0
	.globl	__Z8compareXPKvS0_              ; -- Begin function _Z8compareXPKvS0_
	.p2align	2
__Z8compareXPKvS0_:                     ; @_Z8compareXPKvS0_
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	ldr	w9, [x0]
	ldr	w10, [x1]
	subs	w0, w9, w10
	b.ne	LBB0_2
; %bb.1:
	ldr	w8, [x8, #4]
	ldr	w9, [x1, #4]
	sub	w0, w8, w9
LBB0_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z8compareYPKvS0_              ; -- Begin function _Z8compareYPKvS0_
	.p2align	2
__Z8compareYPKvS0_:                     ; @_Z8compareYPKvS0_
	.cfi_startproc
; %bb.0:
	mov	x8, x0
	ldr	w9, [x0, #4]
	ldr	w10, [x1, #4]
	subs	w0, w9, w10
	b.ne	LBB1_2
; %bb.1:
	ldr	w8, [x8]
	ldr	w9, [x1]
	sub	w0, w8, w9
LBB1_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z4dist5PointS_                ; -- Begin function _Z4dist5PointS_
	.p2align	2
__Z4dist5PointS_:                       ; @_Z4dist5PointS_
	.cfi_startproc
; %bb.0:
	lsr	x8, x0, #32
	lsr	x9, x1, #32
	sub	w10, w0, w1
	mul	w10, w10, w10
	sub	w8, w8, w9
	madd	w8, w8, w8, w10
	scvtf	d0, w8
	fsqrt	d0, d0
	fcvt	s0, d0
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z10bruteForceP5Pointi         ; -- Begin function _Z10bruteForceP5Pointi
	.p2align	2
__Z10bruteForceP5Pointi:                ; @_Z10bruteForceP5Pointi
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB3_7
; %bb.1:
	mov	x12, #0
	mov	w8, w1
	add	x9, x0, #8
	mov	w10, #2139095039
	fmov	s0, w10
	mov	w10, #1
	b	LBB3_3
LBB3_2:                                 ;   in Loop: Header=BB3_3 Depth=1
	add	x10, x10, #1
	add	x9, x9, #8
	mov	x12, x11
	cmp	x11, x8
	b.eq	LBB3_6
LBB3_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_5 Depth 2
	add	x11, x12, #1
	cmp	x11, x8
	b.hs	LBB3_2
; %bb.4:                                ;   in Loop: Header=BB3_3 Depth=1
	add	x13, x0, x12, lsl #3
	ldp	w12, w13, [x13]
	mov	x14, x8
	mov	x15, x9
LBB3_5:                                 ;   Parent Loop BB3_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x16, [x15], #8
	lsr	x17, x16, #32
	sub	w16, w12, w16
	mul	w16, w16, w16
	sub	w17, w13, w17
	madd	w16, w17, w17, w16
	scvtf	d1, w16
	fsqrt	d1, d1
	fcvt	s1, d1
	fcmp	s0, s1
	fcsel	s0, s1, s0, gt
	sub	x14, x14, #1
	cmp	x10, x14
	b.ne	LBB3_5
	b	LBB3_2
LBB3_6:
	ret
LBB3_7:
	mov	w8, #2139095039
	fmov	s0, w8
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z3minff                       ; -- Begin function _Z3minff
	.p2align	2
__Z3minff:                              ; @_Z3minff
	.cfi_startproc
; %bb.0:
	fcmp	s0, s1
	fcsel	s0, s0, s1, mi
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z12stripClosestP5Pointif      ; -- Begin function _Z12stripClosestP5Pointif
	.p2align	2
__Z12stripClosestP5Pointif:             ; @_Z12stripClosestP5Pointif
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB5_7
; %bb.1:
	mov	x11, #0
	add	x8, x0, #12
	mov	w9, #1
	mov	w10, w1
	b	LBB5_3
LBB5_2:                                 ;   in Loop: Header=BB5_3 Depth=1
	add	x9, x9, #1
	add	x8, x8, #8
	mov	x11, x12
	cmp	x12, x10
	b.eq	LBB5_7
LBB5_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_5 Depth 2
	add	x12, x11, #1
	cmp	x12, x10
	b.hs	LBB5_2
; %bb.4:                                ;   in Loop: Header=BB5_3 Depth=1
	add	x13, x0, x11, lsl #3
	ldr	w13, [x13, #4]
	mov	x14, x10
	mov	x15, x8
LBB5_5:                                 ;   Parent Loop BB5_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w16, [x15]
	sub	w16, w16, w13
	scvtf	s1, w16
	fcmp	s0, s1
	b.le	LBB5_2
; %bb.6:                                ;   in Loop: Header=BB5_5 Depth=2
	add	x16, x0, x11, lsl #3
	ldp	w16, w17, [x16]
	ldp	w2, w1, [x15, #-4]
	sub	w16, w16, w2
	mul	w16, w16, w16
	sub	w17, w17, w1
	madd	w16, w17, w17, w16
	scvtf	d1, w16
	fsqrt	d1, d1
	fcvt	s1, d1
	fcmp	s0, s1
	fcsel	s0, s1, s0, gt
	add	x15, x15, #8
	sub	x14, x14, #1
	cmp	x9, x14
	b.ne	LBB5_5
	b	LBB5_2
LBB5_7:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z11closestUtilP5PointS0_i     ; -- Begin function _Z11closestUtilP5PointS0_i
	.p2align	2
__Z11closestUtilP5PointS0_i:            ; @_Z11closestUtilP5PointS0_i
	.cfi_startproc
; %bb.0:
	stp	d9, d8, [sp, #-96]!             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	mov	x19, x2
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-88]
	cmp	w2, #3
	b.gt	LBB6_6
; %bb.1:
	cmp	w19, #1
	b.lt	LBB6_27
; %bb.2:
	mov	w8, w19
	cmp	w19, #1
	b.ls	LBB6_28
; %bb.3:
	mov	x9, x0
	ldr	x10, [x9], #8
	lsr	x11, x10, #32
	sub	x12, x8, #1
	mov	w13, #2139095039
	fmov	s0, w13
LBB6_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x13, [x9], #8
	lsr	x14, x13, #32
	sub	w13, w10, w13
	mul	w13, w13, w13
	sub	w14, w11, w14
	madd	w13, w14, w14, w13
	scvtf	d1, w13
	fsqrt	d1, d1
	fcvt	s1, d1
	fcmp	s0, s1
	fcsel	s0, s1, s0, gt
	subs	x12, x12, #1
	b.ne	LBB6_4
; %bb.5:
	cmp	w19, #1
	b.ne	LBB6_29
	b	LBB6_35
LBB6_6:
	mov	x20, x1
	mov	x24, sp
	lsr	w2, w19, #1
	lsl	x8, x2, #3
	add	x21, x0, x8
	ldp	w25, w12, [x21]
	mov	x9, x8
Lloh3:
	adrp	x16, ___chkstk_darwin@GOTPAGE
Lloh4:
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	mov	x9, sp
	add	x8, x8, #15
	and	x8, x8, #0x7fffffff0
	sub	x1, x9, x8
	mov	sp, x1
	sub	w22, w19, w2
	lsl	x9, x22, #3
	add	x8, x9, #15
	and	x8, x8, #0xffffffff0
Lloh5:
	adrp	x16, ___chkstk_darwin@GOTPAGE
Lloh6:
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	mov	x9, sp
	sub	x23, x9, x8
	mov	sp, x23
	mov	w9, #0
	mov	w8, #0
	mov	w26, w19
	mov	x10, x26
	mov	x11, x20
	b	LBB6_9
LBB6_7:                                 ;   in Loop: Header=BB6_9 Depth=1
	mov	x13, x8
	add	w8, w8, #1
	mov	x14, x23
LBB6_8:                                 ;   in Loop: Header=BB6_9 Depth=1
	ldr	x15, [x11], #8
	str	x15, [x14, w13, sxtw #3]
	subs	x10, x10, #1
	b.eq	LBB6_14
LBB6_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x11]
	cmp	w13, w25
	b.ge	LBB6_11
; %bb.10:                               ;   in Loop: Header=BB6_9 Depth=1
	cmp	w9, w2
	b.ge	LBB6_7
	b	LBB6_13
LBB6_11:                                ;   in Loop: Header=BB6_9 Depth=1
	b.ne	LBB6_7
; %bb.12:                               ;   in Loop: Header=BB6_9 Depth=1
	ldr	w13, [x11, #4]
	cmp	w13, w12
	ccmp	w9, w2, #0, lt
	b.ge	LBB6_7
LBB6_13:                                ;   in Loop: Header=BB6_9 Depth=1
	mov	x13, x9
	add	w9, w9, #1
	mov	x14, x1
	b	LBB6_8
LBB6_14:
                                        ; kill: def $w2 killed $w2 killed $x2
	bl	__Z11closestUtilP5PointS0_i
	fmov	s8, s0
	mov	x0, x21
	mov	x1, x23
	mov	x2, x22
	bl	__Z11closestUtilP5PointS0_i
	fcmp	s8, s0
	fcsel	s0, s8, s0, mi
	lsl	x8, x26, #3
	mov	x9, x8
Lloh7:
	adrp	x16, ___chkstk_darwin@GOTPAGE
Lloh8:
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	mov	x9, sp
	add	x8, x8, #15
	and	x8, x8, #0xffffffff0
	sub	x8, x9, x8
	mov	sp, x8
	cmp	w19, #1
	b.lt	LBB6_26
; %bb.15:
	mov	w11, #0
	b	LBB6_17
LBB6_16:                                ;   in Loop: Header=BB6_17 Depth=1
	add	x20, x20, #8
	subs	x26, x26, #1
	b.eq	LBB6_19
LBB6_17:                                ; =>This Inner Loop Header: Depth=1
	ldr	w9, [x20]
	subs	w9, w9, w25
	cneg	w9, w9, mi
	scvtf	s1, w9
	fcmp	s0, s1
	b.le	LBB6_16
; %bb.18:                               ;   in Loop: Header=BB6_17 Depth=1
	ldr	x9, [x20]
	str	x9, [x8, w11, sxtw #3]
	add	w11, w11, #1
	b	LBB6_16
LBB6_19:
	cmp	w11, #1
	b.lt	LBB6_26
; %bb.20:
	mov	x12, #0
	add	x9, x8, #12
	mov	w10, #1
	mov	w11, w11
	b	LBB6_22
LBB6_21:                                ;   in Loop: Header=BB6_22 Depth=1
	add	x10, x10, #1
	add	x9, x9, #8
	mov	x12, x13
	cmp	x13, x11
	b.eq	LBB6_26
LBB6_22:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_24 Depth 2
	add	x13, x12, #1
	cmp	x13, x11
	b.hs	LBB6_21
; %bb.23:                               ;   in Loop: Header=BB6_22 Depth=1
	add	x14, x8, x12, lsl #3
	ldr	w14, [x14, #4]
	mov	x15, x9
	mov	x16, x11
LBB6_24:                                ;   Parent Loop BB6_22 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w17, [x15]
	sub	w17, w17, w14
	scvtf	s1, w17
	fcmp	s0, s1
	b.le	LBB6_21
; %bb.25:                               ;   in Loop: Header=BB6_24 Depth=2
	add	x17, x8, x12, lsl #3
	ldp	w17, w0, [x17]
	ldp	w2, w1, [x15, #-4]
	sub	w17, w17, w2
	mul	w17, w17, w17
	sub	w0, w0, w1
	madd	w17, w0, w0, w17
	scvtf	d1, w17
	fsqrt	d1, d1
	fcvt	s1, d1
	fcmp	s0, s1
	fcsel	s0, s1, s0, gt
	sub	x16, x16, #1
	add	x15, x15, #8
	cmp	x10, x16
	b.ne	LBB6_24
	b	LBB6_21
LBB6_26:
	mov	sp, x24
	b	LBB6_35
LBB6_27:
	mov	w8, #2139095039
	fmov	s0, w8
	b	LBB6_35
LBB6_28:
	mov	w9, #2139095039
	fmov	s0, w9
	cmp	w19, #1
	b.eq	LBB6_35
LBB6_29:
	cmp	w19, #3
	b.lo	LBB6_32
; %bb.30:
	ldp	w9, w10, [x0, #8]
	sub	x11, x8, #2
	add	x12, x0, #16
LBB6_31:                                ; =>This Inner Loop Header: Depth=1
	ldr	x13, [x12], #8
	lsr	x14, x13, #32
	sub	w13, w9, w13
	mul	w13, w13, w13
	sub	w14, w10, w14
	madd	w13, w14, w14, w13
	scvtf	d1, w13
	fsqrt	d1, d1
	fcvt	s1, d1
	fcmp	s0, s1
	fcsel	s0, s1, s0, gt
	subs	x11, x11, #1
	b.ne	LBB6_31
LBB6_32:
	cmp	w19, #4
	b.lo	LBB6_35
; %bb.33:
	ldp	w9, w10, [x0, #16]
	sub	x8, x8, #3
	add	x11, x0, #24
LBB6_34:                                ; =>This Inner Loop Header: Depth=1
	ldr	x12, [x11], #8
	lsr	x13, x12, #32
	sub	w12, w9, w12
	mul	w12, w12, w12
	sub	w13, w10, w13
	madd	w12, w13, w13, w12
	scvtf	d1, w12
	fsqrt	d1, d1
	fcvt	s1, d1
	fcmp	s0, s1
	fcsel	s0, s1, s0, gt
	subs	x8, x8, #1
	b.ne	LBB6_34
LBB6_35:
	ldur	x8, [x29, #-88]
Lloh9:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh10:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh11:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB6_37
; %bb.36:
	sub	sp, x29, #80
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #96               ; 16-byte Folded Reload
	ret
LBB6_37:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGot	Lloh5, Lloh6
	.loh AdrpLdrGot	Lloh3, Lloh4
	.loh AdrpLdrGot	Lloh7, Lloh8
	.loh AdrpLdrGotLdr	Lloh9, Lloh10, Lloh11
	.cfi_endproc
                                        ; -- End function
	.globl	__Z7closestP5Pointi             ; -- Begin function _Z7closestP5Pointi
	.p2align	2
__Z7closestP5Pointi:                    ; @_Z7closestP5Pointi
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	sp, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x19, x1
	mov	x22, x0
Lloh12:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh13:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh14:
	ldr	x8, [x8]
	stur	x8, [x29, #-56]
	mov	w8, w1
	lsl	x23, x8, #3
	mov	x9, x23
Lloh15:
	adrp	x16, ___chkstk_darwin@GOTPAGE
Lloh16:
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	mov	x8, sp
	add	x9, x23, #15
	and	x12, x9, #0xffffffff0
	sub	x20, x8, x12
	mov	sp, x20
	mov	x9, x23
Lloh17:
	adrp	x16, ___chkstk_darwin@GOTPAGE
Lloh18:
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	mov	x8, sp
	sub	x21, x8, x12
	mov	sp, x21
	cmp	w1, #1
	b.lt	LBB7_2
; %bb.1:
	mov	x0, x20
	mov	x1, x22
	mov	x2, x23
	bl	_memcpy
	mov	x0, x21
	mov	x1, x22
	mov	x2, x23
	bl	_memcpy
LBB7_2:
	sxtw	x22, w19
Lloh19:
	adrp	x3, __Z8compareXPKvS0_@PAGE
Lloh20:
	add	x3, x3, __Z8compareXPKvS0_@PAGEOFF
	mov	x0, x20
	mov	x1, x22
	mov	w2, #8
	bl	_qsort
Lloh21:
	adrp	x3, __Z8compareYPKvS0_@PAGE
Lloh22:
	add	x3, x3, __Z8compareYPKvS0_@PAGEOFF
	mov	x0, x21
	mov	x1, x22
	mov	w2, #8
	bl	_qsort
	mov	x0, x20
	mov	x1, x21
	mov	x2, x19
	bl	__Z11closestUtilP5PointS0_i
	ldur	x8, [x29, #-56]
Lloh23:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh24:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh25:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB7_4
; %bb.3:
	sub	sp, x29, #48
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB7_4:
	bl	___stack_chk_fail
	.loh AdrpLdrGot	Lloh17, Lloh18
	.loh AdrpLdrGot	Lloh15, Lloh16
	.loh AdrpLdrGotLdr	Lloh12, Lloh13, Lloh14
	.loh AdrpLdrGotLdr	Lloh23, Lloh24, Lloh25
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpAdd	Lloh19, Lloh20
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #144
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
Lloh26:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh27:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh28:
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
Lloh29:
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
Lloh30:
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
Lloh31:
	adrp	x1, l_.str@PAGE
Lloh32:
	add	x1, x1, l_.str@PAGEOFF
	mov	w2, #22
	bl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	mov	x19, x0
	mov	x20, sp
Lloh33:
	adrp	x8, l___const.main.P@PAGE
Lloh34:
	add	x8, x8, l___const.main.P@PAGEOFF
	ldp	q0, q1, [x8]
	stp	q0, q1, [sp, #48]
	ldr	q2, [x8, #32]
	str	q2, [sp, #80]
	stp	q0, q1, [sp]
	str	q2, [sp, #32]
Lloh35:
	adrp	x3, __Z8compareXPKvS0_@PAGE
Lloh36:
	add	x3, x3, __Z8compareXPKvS0_@PAGEOFF
	add	x0, sp, #48
	mov	w1, #6
	mov	w2, #8
	bl	_qsort
Lloh37:
	adrp	x3, __Z8compareYPKvS0_@PAGE
Lloh38:
	add	x3, x3, __Z8compareYPKvS0_@PAGEOFF
	mov	x0, sp
	mov	w1, #6
	mov	w2, #8
	bl	_qsort
	add	x0, sp, #48
	mov	x1, sp
	mov	w2, #6
	bl	__Z11closestUtilP5PointS0_i
	mov	sp, x20
	mov	x0, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
	ldur	x8, [x29, #-24]
Lloh39:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh40:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh41:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB8_2
; %bb.1:
	mov	w0, #0
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #144
	ret
LBB8_2:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh39, Lloh40, Lloh41
	.loh AdrpAdd	Lloh37, Lloh38
	.loh AdrpAdd	Lloh35, Lloh36
	.loh AdrpAdd	Lloh33, Lloh34
	.loh AdrpAdd	Lloh31, Lloh32
	.loh AdrpLdrGot	Lloh29, Lloh30
	.loh AdrpLdrGotLdr	Lloh26, Lloh27, Lloh28
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ; -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	2
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ; @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x21, x2
	mov	x20, x1
	mov	x19, x0
Ltmp0:
	add	x0, sp, #8
	mov	x1, x19
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp1:
; %bb.1:
	ldrb	w8, [sp, #8]
	cbz	w8, LBB9_11
; %bb.2:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x22, x19, x8
	ldr	x23, [x22, #40]
	ldr	w25, [x22, #8]
	ldr	w24, [x22, #144]
	cmn	w24, #1
	b.ne	LBB9_8
; %bb.3:
Ltmp2:
	add	x8, sp, #24
	mov	x0, x22
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp3:
; %bb.4:
Ltmp4:
Lloh42:
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
Lloh43:
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	add	x0, sp, #24
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp5:
; %bb.5:
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
Ltmp6:
	mov	w1, #32
	blr	x8
Ltmp7:
; %bb.6:
	mov	x24, x0
Ltmp12:
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
Ltmp13:
; %bb.7:
	str	w24, [x22, #144]
LBB9_8:
	add	x3, x20, x21
	mov	w8, #176
	and	w8, w25, w8
	cmp	w8, #32
	csel	x2, x3, x20, eq
Ltmp14:
	sxtb	w5, w24
	mov	x0, x23
	mov	x1, x20
	mov	x4, x22
	bl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp15:
; %bb.9:
	cbnz	x0, LBB9_11
; %bb.10:
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x0, x19, x8
	ldr	w8, [x0, #32]
	mov	w9, #5
	orr	w1, w8, w9
Ltmp17:
	bl	__ZNSt3__18ios_base5clearEj
Ltmp18:
LBB9_11:
Ltmp22:
	add	x0, sp, #8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp23:
LBB9_12:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB9_13:
Ltmp19:
	b	LBB9_17
LBB9_14:
Ltmp8:
	mov	x20, x0
Ltmp9:
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
Ltmp10:
	b	LBB9_18
LBB9_15:
Ltmp11:
	bl	___clang_call_terminate
LBB9_16:
Ltmp16:
LBB9_17:
	mov	x20, x0
LBB9_18:
Ltmp20:
	add	x0, sp, #8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp21:
	b	LBB9_20
LBB9_19:
Ltmp24:
	mov	x20, x0
LBB9_20:
	mov	x0, x20
	bl	___cxa_begin_catch
	ldr	x8, [x19]
	ldur	x8, [x8, #-24]
	add	x0, x19, x8
Ltmp25:
	bl	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp26:
; %bb.21:
	bl	___cxa_end_catch
	b	LBB9_12
LBB9_22:
Ltmp27:
	mov	x19, x0
Ltmp28:
	bl	___cxa_end_catch
Ltmp29:
; %bb.23:
	mov	x0, x19
	bl	__Unwind_Resume
LBB9_24:
Ltmp30:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh42, Lloh43
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table9:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 1 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp24-Lfunc_begin0            ;     jumps to Ltmp24
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp2-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp3-Ltmp2                    ;   Call between Ltmp2 and Ltmp3
	.uleb128 Ltmp16-Lfunc_begin0            ;     jumps to Ltmp16
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp4-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp7-Ltmp4                    ;   Call between Ltmp4 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin0             ;     jumps to Ltmp8
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp12-Lfunc_begin0            ; >> Call Site 4 <<
	.uleb128 Ltmp15-Ltmp12                  ;   Call between Ltmp12 and Ltmp15
	.uleb128 Ltmp16-Lfunc_begin0            ;     jumps to Ltmp16
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp17-Lfunc_begin0            ; >> Call Site 5 <<
	.uleb128 Ltmp18-Ltmp17                  ;   Call between Ltmp17 and Ltmp18
	.uleb128 Ltmp19-Lfunc_begin0            ;     jumps to Ltmp19
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp22-Lfunc_begin0            ; >> Call Site 6 <<
	.uleb128 Ltmp23-Ltmp22                  ;   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin0            ;     jumps to Ltmp24
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp9-Lfunc_begin0             ; >> Call Site 7 <<
	.uleb128 Ltmp10-Ltmp9                   ;   Call between Ltmp9 and Ltmp10
	.uleb128 Ltmp11-Lfunc_begin0            ;     jumps to Ltmp11
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp20-Lfunc_begin0            ; >> Call Site 8 <<
	.uleb128 Ltmp21-Ltmp20                  ;   Call between Ltmp20 and Ltmp21
	.uleb128 Ltmp30-Lfunc_begin0            ;     jumps to Ltmp30
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp21-Lfunc_begin0            ; >> Call Site 9 <<
	.uleb128 Ltmp25-Ltmp21                  ;   Call between Ltmp21 and Ltmp25
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp25-Lfunc_begin0            ; >> Call Site 10 <<
	.uleb128 Ltmp26-Ltmp25                  ;   Call between Ltmp25 and Ltmp26
	.uleb128 Ltmp27-Lfunc_begin0            ;     jumps to Ltmp27
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp26-Lfunc_begin0            ; >> Call Site 11 <<
	.uleb128 Ltmp28-Ltmp26                  ;   Call between Ltmp26 and Ltmp28
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp28-Lfunc_begin0            ; >> Call Site 12 <<
	.uleb128 Ltmp29-Ltmp28                  ;   Call between Ltmp28 and Ltmp29
	.uleb128 Ltmp30-Lfunc_begin0            ;     jumps to Ltmp30
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp29-Lfunc_begin0            ; >> Call Site 13 <<
	.uleb128 Lfunc_end0-Ltmp29              ;   Call between Ltmp29 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ; -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	2
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ; @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	cbz	x0, LBB10_15
; %bb.1:
	mov	x24, x5
	mov	x20, x4
	mov	x22, x3
	mov	x21, x2
	ldr	x8, [x4, #24]
	sub	x9, x3, x1
	subs	x8, x8, x9
	csel	x23, x8, xzr, gt
	sub	x25, x2, x1
	cmp	x25, #1
	b.lt	LBB10_3
; %bb.2:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x2, x25
	blr	x8
	cmp	x0, x25
	b.ne	LBB10_14
LBB10_3:
	cmp	x23, #1
	b.lt	LBB10_11
; %bb.4:
	cmp	x23, #23
	b.hs	LBB10_6
; %bb.5:
	add	x25, sp, #8
	strb	w23, [sp, #31]
	b	LBB10_7
LBB10_6:
	add	x8, x23, #16
	and	x26, x8, #0xfffffffffffffff0
	mov	x0, x26
	bl	__Znwm
	mov	x25, x0
	orr	x8, x26, #0x8000000000000000
	stp	x23, x8, [sp, #16]
	str	x0, [sp, #8]
LBB10_7:
	mov	x0, x25
	mov	x1, x24
	mov	x2, x23
	bl	_memset
	strb	wzr, [x25, x23]
	ldrsb	w8, [sp, #31]
	ldr	x9, [sp, #8]
	cmp	w8, #0
	add	x8, sp, #8
	csel	x1, x9, x8, lt
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
Ltmp31:
	mov	x0, x19
	mov	x2, x23
	blr	x8
Ltmp32:
; %bb.8:
	mov	x24, x0
	ldrsb	w8, [sp, #31]
	tbnz	w8, #31, LBB10_10
; %bb.9:
	cmp	x24, x23
	b.ne	LBB10_14
	b	LBB10_11
LBB10_10:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
	cmp	x24, x23
	b.ne	LBB10_14
LBB10_11:
	sub	x22, x22, x21
	cmp	x22, #1
	b.lt	LBB10_13
; %bb.12:
	ldr	x8, [x19]
	ldr	x8, [x8, #96]
	mov	x0, x19
	mov	x1, x21
	mov	x2, x22
	blr	x8
	cmp	x0, x22
	b.ne	LBB10_14
LBB10_13:
	str	xzr, [x20, #24]
	b	LBB10_15
LBB10_14:
	mov	x19, #0
LBB10_15:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB10_16:
Ltmp33:
	mov	x19, x0
	ldrsb	w8, [sp, #31]
	tbz	w8, #31, LBB10_18
; %bb.17:
	ldr	x0, [sp, #8]
	bl	__ZdlPv
LBB10_18:
	mov	x0, x19
	bl	__Unwind_Resume
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table10:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp31-Lfunc_begin1            ;   Call between Lfunc_begin1 and Ltmp31
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp31-Lfunc_begin1            ; >> Call Site 2 <<
	.uleb128 Ltmp32-Ltmp31                  ;   Call between Ltmp31 and Ltmp32
	.uleb128 Ltmp33-Lfunc_begin1            ;     jumps to Ltmp33
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp32-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Lfunc_end1-Ltmp32              ;   Call between Ltmp32 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	2                               ; @__const.main.P
l___const.main.P:
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.long	12                              ; 0xc
	.long	30                              ; 0x1e
	.long	40                              ; 0x28
	.long	50                              ; 0x32
	.long	5                               ; 0x5
	.long	1                               ; 0x1
	.long	12                              ; 0xc
	.long	10                              ; 0xa
	.long	3                               ; 0x3
	.long	4                               ; 0x4

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"A menor distancia eh: "

.subsections_via_symbols
