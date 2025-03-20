; MobileAPI calls (see lib/mobile/main.asm:_MobileAPI)
	const_def 0, 2
	const MOBILEAPI_00
	const MOBILEAPI_01
	const MOBILEAPI_02
	const MOBILEAPI_03
	const MOBILEAPI_04
	const MOBILEAPI_05
	const MOBILEAPI_06
	const MOBILEAPI_07
	const MOBILEAPI_08
	const MOBILEAPI_09
	const MOBILEAPI_0A
	const MOBILEAPI_0B
	const MOBILEAPI_0C
	const MOBILEAPI_0D
	const MOBILEAPI_0E
	const MOBILEAPI_0F
	const MOBILEAPI_10
	const MOBILEAPI_11
	const MOBILEAPI_12
	const MOBILEAPI_13
	const MOBILEAPI_14
	const MOBILEAPI_15
	const MOBILEAPI_16
	const MOBILEAPI_17
	const MOBILEAPI_SETTIMER
	const MOBILEAPI_TELEPHONESTATUS
	const MOBILEAPI_1A
	const MOBILEAPI_1B
	const MOBILEAPI_1C
	const MOBILEAPI_1D
	const MOBILEAPI_1E
	const MOBILEAPI_1F
	const MOBILEAPI_20
	const MOBILEAPI_21

DEF MOBILE_LOGIN_PASSWORD_LENGTH EQU 17
DEF MOBILE_PHONE_NUMBER_LENGTH EQU 20

; Maximum amount of time allowed for mobile battles each day
DEF MOBILE_BATTLE_ALLOWED_SECONDS EQU 0
DEF MOBILE_BATTLE_ALLOWED_MINUTES EQU 10

; Trade corner request size
; DION addr $1e + request $8 + Name $5
; + party struct $30 + OT $5 + NICK $5
; + JP Mail struct $2a
DEF MOBILE_EMAIL_LENGTH EQU $1e
DEF TRADE_CORNER_REQUEST_LENGTH EQU $8f

DEF EASY_CHAT_MESSAGE_WORD_COUNT EQU 6
DEF EASY_CHAT_MESSAGE_LENGTH EQU EASY_CHAT_MESSAGE_WORD_COUNT * 2 ; every word uses 2 bytes
