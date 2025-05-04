;
; AssemblerApplication1.asm
;
; Created: 03.04.2025 09:53:34
; Author : Piotr
CWICZENIE 2.3:
ldi r16, 0xFF
out $04, r16
ldi r17, 5

start:
out $05, r17

delay:
ldi r20, 0xFF
ldi r19, 0xFF
ldi r18, 0x7B
delay_loop:
dec r20
brne delay_loop
dec r19
brne delay_loop
dec r18
brne delay_loop

inc r17
cpi r17, 15
brne start

ldi r17, 5
rjmp start

