;
; AssemblerApplication1.asm
;
; Created: 03.04.2025 09:53:34
; Author : Piotr
               .ORG 0x00
RJMP MAIN
.cseg
.org 0x32
HEX_CODES: .DB 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
.org 0x100


MAIN:
LDI ZH, HIGH(2*HEX_CODES)
LDI ZL, LOW(2*HEX_CODES)
LDI R16, 0xFF
OUT DDRD, R16
OUT DDRB, R16
LDI R16, 0x08 ; (1000)
COM R16 ; (1000)
OUT PORTB, r16 ; (0111) -> aktywacja tylko 1 wyswietlacza (aktywacja gdy bit = 0)
ldi r25, 16

LOOP:
LPM R17, Z+
COM R17
OUT PORTD, R17

RCALL DELAY

dec r25
BRNE LOOP

rjmp main
DELAY:
LDI R18, 120
D1: LDI R19, 255
D2: LDI R20, 255
D3:
DEC R20
BRNE D3
DEC R19
BRNE D2
DEC R18
BRNE D1
RET

