; wLinkMode
	const_def 2
	const LINK_TRADECENTER ; 2
	const LINK_COLOSSEUM   ; 3
	const LINK_MOBILE      ; 4

; hSerialReceive high nybbles
DEF SERIAL_TRADECENTER EQU $70
DEF SERIAL_BATTLE      EQU $80

DEF ESTABLISH_CONNECTION_WITH_INTERNAL_CLOCK EQU $01
DEF ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK EQU $02

; hSerialConnectionStatus
DEF USING_EXTERNAL_CLOCK       EQU $01
DEF USING_INTERNAL_CLOCK       EQU $02
DEF CONNECTION_NOT_ESTABLISHED EQU $ff

; length of a patch list
DEF SERIAL_PATCH_LIST_LENGTH          EQU 200
; size of the patch area (offsets into this area may not have special values)
DEF SERIAL_PATCH_DATA_SIZE            EQU $fc
; signals the start of an array of bytes transferred over the link cable
DEF SERIAL_PREAMBLE_BYTE              EQU $fd
; this byte is used when there is no data to send
DEF SERIAL_NO_DATA_BYTE               EQU $fe
; signals the end of one part of a patch list (there are two parts) for player/enemy party data
DEF SERIAL_PATCH_LIST_PART_TERMINATOR EQU $ff
; used to replace SERIAL_NO_DATA_BYTE
DEF SERIAL_PATCH_REPLACEMENT_BYTE     EQU $ff

DEF SERIAL_PREAMBLE_LENGTH       EQU 6
DEF SERIAL_RN_PREAMBLE_LENGTH    EQU 7
DEF SERIAL_PATCH_PREAMBLE_LENGTH EQU 3
DEF SERIAL_RNS_LENGTH            EQU 10

DEF SERIAL_MAIL_PREAMBLE_BYTE    EQU $20
DEF SERIAL_MAIL_PREAMBLE_LENGTH  EQU 5
; used to replace SERIAL_NO_DATA_BYTE
DEF SERIAL_MAIL_REPLACEMENT_BYTE EQU $21

; timeout duration after exchanging a byte
DEF SERIAL_LINK_BYTE_TIMEOUT EQU $5000
