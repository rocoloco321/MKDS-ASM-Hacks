
goToTTCMenu:
MOV R0, #2 // make single player menu go to course select
LDR     R1, =gStruct217B488
LDR     R1, [R1]
STR     R0, [R1,#8]
LDR     R1, =logo_sLogoState
BX LR

ncp_over(0x02001AA0)
    BL goToTTCMenu
    MOV R0, #1
    STR R0, [R4, #4]
ncp_endover()



ncp_tcall(0x020CBC74)
    BL SPM_inithook
    BL menu_process_getCurrentHeapHandle
    BLX sub_211E480
    BLX 0x020CBC7C

SPM_inithook:
    push {r0-r2, lr}
    BL rconf_reset
    LDR R0, =gRaceMultiConfig
    LDR R2, [R0]
    //set race mode to time trials
    MOV R1, #1
    STR R1, [R2, #8]
    pop {r0-r2, lr}
    BX LR


//BL menu_createRaceConfig
