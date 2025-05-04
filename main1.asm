;
; AssemblerApplication1.asm
;
; Created: 03.04.2025 09:53:34
; Author : Piotr
.ORG 0x00
RJMP MAIN

.ORG 0x32
HEX_CODES: .DB 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71


.ORG 0x100
MAIN:

    LDI R16, 0xFF
    OUT DDRD, R16
    OUT PORTD, R16
    LDI R16, 0X0F
    OUT DDRB, R16
    OUT PORTB, R16
    LDI R16, 0b00001110
    OUT PORTB, R16
    LDI R28, 0 ; 1 rejestr 8-bitowy
    LDI R29, 0 ; 2 rejestr 8-bitowy
    LDI R16, 1
    MOV R1, R16
    LDI R16, 0
    MOV R0, R16

COUNTING_LOOP:
    LDI R20, 4 ;4 razy wyswietla cyfry na wyswietlaczach 1-4, zanim inkrementuje wartosc
DISPLAY_LOOP:
    LDI R16, 0b00001110 ; 1 wyswietlacz
    OUT PORTB, R16
    MOV R16,R28
    ANDI R16, 0X0F
    CALL SEVEN_SEG
    COM R16
    OUT PORTD, R16
    CALL DELAY

    LDI R16, 0b00001101 ; 2 wyswietlacz
    OUT PORTB, R16
    MOV R16,R28
    SWAP R16
    ANDI R16, 0X0F
    CALL SEVEN_SEG
    COM R16
    OUT PORTD, R16
    CALL DELAY

    LDI R16, 0b00001011 ; 3 wyswietlacz
    OUT PORTB, R16
    MOV R16,R29
    ANDI R16, 0X0F
    CALL SEVEN_SEG
    COM R16
    OUT PORTD, R16
    CALL DELAY

    LDI R16, 0b00000111 ; 4 wyswietlacz
    OUT PORTB, R16
    MOV R16,R29
    SWAP R16
    ANDI R16, 0X0F
    CALL SEVEN_SEG
    COM R16
    OUT PORTD, R16
    CALL DELAY
    DEC R20
    BRNE DISPLAY_LOOP
    CLC
    ADD R28, R1 ; inkrementacja 16 bitowego licznika
    ADC R29, R0
    JMP COUNTING_LOOP


SEVEN_SEG:
     LDI R31, HIGH(2*HEX_CODES)
     LDI R30, LOW(2*HEX_CODES)
     ADD R30, R16
     LPM R16, Z
     RET

DELAY:
    PUSH R18
    PUSH R19
    LDI R18, 140
    LDI R19, 200
D1:
    DEC R19
    BRNE D1
    DEC R18
    BRNE D1
    POP R18
    POP R19
    RET                

