STACK SEGMENT PARA STACK
    DW 64 DUP (?)   
STACK ENDS

DATA SEGMENT PARA 'DATA'
    ;Game
    LastTimeD DW 0
    Frame DW 0

    ;Player
    SYSRA_X DW 50
    SYSRA_Y DW 50

    STATE DW 0

    FLIP DW 0
    AUXFLIP DW 0

    SYSRA_VEL_X DW 0
    SYSRA_VEL_Y DW 0

    GRAVITY DW 4

    JUMPED DW 0


    COLLX DW 0
    COLLY DW 0

    ;SYSRA_Y DW 176

    IDLE DW 0h, 0h, 0h, 810h, 810h, 1818h, 1818h, 0BD0h, 17E8h, 7E0h, 0DB0h, 0DB0h, 366Ch, 37ECh, 7E0h, 810h

    RUN1 DW 0h, 0h, 0h, 810h, 810h, 1818h, 1818h, 0BD0h, 17E8h, 7E0h, 0ED0h, 0ED0h, 3734h, 37E4h, 7D0h, 810h
    RUN2 DW 0h, 0h, 810h, 810h, 1818h, 1818h, 0BD0h, 17E8h, 7E0h, 0ED0h, 0ED0h, 3734h, 37E4h, 300h, 1B0h, 0h

    ;Sprite Renderer
    Obj_X DW 0
    Obj_Y DW 0

    Siz DW 16

    SPRITEPOINTERX DW 0
    SPRITEPOINTERY DW 0
    AUXSPRITE DW 0            
    
    TILEINDEX DW 0

    LEFT DW 09800h, 0C000h, 0DC00h, 09C00h, 09D00h, 0C000h, 0DB00h, 09B00h, 09800h, 0DA00h, 0C000h, 09C00h, 09C00h, 0DC00h, 0C000h, 09800h
    RIGHT DW 019h, 03h, 03Bh, 039h, 039h, 03h, 05Bh, 019h, 0D9h, 0DBh, 03h, 0B9h, 039h, 03Bh, 03h, 019h
    BLC DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 08000h, 08000h, 02000h, 00h, 09800h
    BRC DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 0Dh, 0Ch, 00h, 019h
    TOP DW 0FFFFh, 06666h, 00h, 0BBDDh, 0BBDDh, 0381Ch, 02C0h, 0D0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    TLC DW 09800h, 00h, 03000h, 0B000h, 08000h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    TRC DW 019h, 00h, 04h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    BOTTOM DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0B00h, 0340h, 0381Ch, 0BBDDh, 0BBDDh, 00h, 06666h, 0FFFFh
    TOPLEFT DW 0FFFFh, 0A666h, 0C000h, 09BDDh, 09BDDh, 0C01Ch, 0DB40h, 09B00h, 09800h, 0DA00h, 0C000h, 09C00h, 09C00h, 0DC00h, 0C000h, 09800h
    TOPRIGHT DW 0FFFFh, 06665h, 03h, 0BBD9h, 0BBD9h, 03803h, 05Bh, 019h, 0D9h, 0DBh, 03h, 0B9h, 039h, 03Bh, 03h, 019h
    BOTTOMLEFT DW 09800h, 0C000h, 0DC00h, 09C00h, 09C00h, 0C000h, 0D800h, 09800h, 098D0h, 0DAC0h, 0C01Ch, 09BDDh, 09BDDh, 0C000h, 0A666h, 0FFFFh
    BOTTOMRIGHT DW 019h, 03h, 03Bh, 039h, 039h, 03h, 05Bh, 019h, 0D9h, 02DBh, 03803h, 0BBD9h, 0BBD9h, 03h, 06665h, 0FFFFh
    ALLCOVER DW 0FFFFh, 0A665h, 0C003h, 09A01h, 09801h, 0C003h, 0D003h, 08001h, 08009h, 0C003h, 0C03Bh, 081B9h, 081B9h, 0C003h, 0A665h, 0FFFFh
    CLOSEM DW 0FFFFh, 06666h, 00h, 0BBDDh, 0BBDDh, 0381Ch, 02C0h, 0D0h, 00h, 00h, 00h, 00h, 00h, 00h, 06666h, 0FFFFh
    CLOSELEFT DW 0FFFFh, 0A666h, 0C000h, 09BDDh, 09BDDh, 0C01Ch, 0DB40h, 09B00h, 09800h, 0DA00h, 0C000h, 09000h, 08000h, 0C000h, 0A666h, 0FFFFh
    CLOSERIGHT DW 0FFFFh, 06665h, 03h, 0BBD9h, 0BBD9h, 03803h, 05Bh, 019h, 0D9h, 0DBh, 03h, 029h, 01h, 03h, 06665h, 0FFFFh
    CLOSEMID DW 08001h, 0C003h, 0C003h, 08001h, 08001h, 0C003h, 0C003h, 08001h, 08001h, 0C003h, 0C003h, 08001h, 08001h, 0C003h, 0C003h, 08001h
    CLOSETOP DW 0FFFFh, 0A665h, 0C003h, 09BB9h, 09BB9h, 0C03Bh, 0C583h, 081A1h, 08001h, 0C003h, 0C003h, 08001h, 08001h, 0C003h, 0C003h, 08001h
    CLOSEBOTTOM DW 08001h, 0C003h, 0C003h, 08001h, 08001h, 0C003h, 0C00Bh, 08001h, 08019h, 0D01Bh, 0C383h, 09BB9h, 09BB9h, 0C003h, 0A665h, 0FFFFh


    LEVEL DW 0FFF0h, 00010h, 00010h, 00210h, 00210h, 00210h, 00010h, 00010h, 00010h, 000F0h
          DW 02080h, 00080h, 000F0h, 00010h, 00010h, 00010h, 00710h, 00010h, 00010h, 00010h
          DW 00000h, 00000h, 00010h, 00000h, 00000h, 00010h, 00810h, 00010h, 00110h, 00110h
          DW 00810h, 00010h, 00010h, 00010h, 00000h, 00010h, 00010h, 00010h, 00070h, 00050h
          DW 00050h, 00070h, 00010h, 00010h, 00010h, 00010h, 00030h, 00060h, 000C0h, 00180h
          DW 00100h, 00100h, 00100h, 00100h, 00100h, 00100h, 00180h, 000C0h, 00060h, 00030h
          DW 00010h, 00010h, 00010h, 00010h, 01010h, 01E10h, 01010h, 00010h, 01E10h, 01410h
          DW 01410h, 01E10h, 00010h, 01E10h, 01010h, 01010h, 01E10h, 00010h, 00010h, 01F10h
          DW 01410h, 01410h, 01C10h, 00010h, 05E10h, 00010h, 00010h, 00010h, 00010h, 00010h
          DW 00010h, 00010h, 00010h, 00010h, 00110h, 00010h, 00010h, 00010h, 00010h, 00110h
          DW 00110h, 00110h, 00910h, 00110h, 00110h, 00110h, 00010h, 00010h, 00010h, 00010h
          DW 00010h, 00010h, 00010h, 00010h, 00010h, 00010h, 00010h, 00010h, 00010h, 0FFF0h
    
    TILES DW OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT
          DW OFFSET RIGHT, OFFSET TRC, OFFSET TOP, OFFSET TOP, OFFSET CLOSELEFT, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET CLOSERIGHT, OFFSET TOP
          DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPLEFT, OFFSET LEFT, OFFSET LEFT, OFFSET TLC, OFFSET ALLCOVER, OFFSET TOP, OFFSET TOP
          DW OFFSET TOPRIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET TRC, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET CLOSETOP, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM
          DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT, OFFSET CLOSETOP, OFFSET TOPLEFT, OFFSET ALLCOVER, OFFSET TOP, OFFSET TOP, OFFSET CLOSELEFT
          DW OFFSET TOP, OFFSET CLOSERIGHT, OFFSET TOP, OFFSET ALLCOVER, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT, OFFSET TOPLEFT, OFFSET TOP
          DW OFFSET TOP, OFFSET TOPLEFT, OFFSET LEFT, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT, OFFSET RIGHT
          DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPLEFT, OFFSET TLC, OFFSET TOPLEFT, OFFSET TLC, OFFSET TOPLEFT
          DW OFFSET TLC, OFFSET TOPLEFT, OFFSET TLC, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT
          DW OFFSET TRC, OFFSET TOPRIGHT, OFFSET TRC, OFFSET TOPRIGHT, OFFSET TRC, OFFSET TOPRIGHT, OFFSET TRC, OFFSET TOP, OFFSET TOP, OFFSET TOP
          DW OFFSET TOP, OFFSET CLOSELEFT, OFFSET TOP, OFFSET TOP, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET CLOSERIGHT, OFFSET TOP
          DW OFFSET TOP, OFFSET TOPLEFT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET TOP
          DW OFFSET CLOSEM, OFFSET TOP, OFFSET TOPRIGHT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET TOP, OFFSET TOPLEFT, OFFSET CLOSEMID
          DW OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT, OFFSET CLOSEMID, OFFSET CLOSEMID
          DW OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPLEFT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP
          DW OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET TOPRIGHT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET TOP
          DW OFFSET TOP, OFFSET ALLCOVER, OFFSET CLOSETOP, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
          DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET ALLCOVER, OFFSET TOP, OFFSET TOP, OFFSET TOP
          DW OFFSET TOP, OFFSET TOP, OFFSET CLOSELEFT, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET ALLCOVER, OFFSET CLOSEM
          DW OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET CLOSERIGHT, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
          DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
          DW OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT
          DW OFFSET LEFT, OFFSET TLC
    TILEOFFSETINDEX DW 0, 24, 26, 28, 32, 36, 40, 42, 44, 46
                    DW 54, 58, 60, 68, 70, 72, 74, 82, 84, 86
                    DW 88, 88, 88, 90, 90, 90, 92, 96, 98, 102
                    DW 106, 110, 112, 114, 116, 116, 118, 120, 122, 128
                    DW 132, 136, 142, 144, 146, 148, 150, 154, 158, 162
                    DW 166, 168, 170, 172, 174, 176, 178, 182, 186, 190
                    DW 194, 196, 198, 200, 202, 206, 216, 220, 222, 232
                    DW 238, 244, 254, 256, 266, 270, 274, 284, 286, 288
                    DW 300, 306, 312, 320, 322, 334, 336, 338, 340, 342
                    DW 344, 346, 348, 350, 352, 356, 358, 360, 362, 364
                    DW 368, 372, 376, 382, 386, 390, 394, 396, 398, 400
                    DW 402, 404, 406, 408, 410, 412, 414, 416, 418, 420
                    DW 444

    TILEMAPX DW 0
    SCROLLX DW 0
    
    TILEPOINTERX DW 0
    TILEPOINTERY DW 0

    AUXMAP DW 0


DATA ENDS

CODE SEGMENT PARA 'CODE'

MAIN PROC FAR

    ASSUME CS:CODE, DS:DATA, SS:STACK    
    MOV AX, DATA                         
    MOV DS, AX   

    MOV AX, 13h       
    INT 10h           
    MOV AX, 0A000h    ; Load VGA memory segment
    MOV ES, AX        ; Set ES to point to VGA memory                        
    
    
    GameLoop:
        inc Frame
        mov ah, 00h   
        int 1Ah       
        mov LastTimeD, dx
    
    call RESET
    call INPUT
    call TILEMAPEDITOR
    call PHYSICSUPDATE
    call ANIMATION

    checkTime:
        mov ah, 00h   
        int 1Ah       
        mov bx, LastTimeD
        cmp bx, dx
        jnz GameLoop
        jmp checkTime

    jmp GameLoop
    RET
MAIN ENDP

RESET PROC
    MOV DI, 0         
    MOV AX, 0         
    MOV CX, 32000     

    REP STOSW      
    mov ah, 01h   
    int 16h   

    RET 
RESET ENDP

INPUT PROC
    mov STATE, 0
    mov ah, 01h   
    int 16h       

    jz done
    mov ah, 00h   
    int 16h       
    
    cmp al, 061h    
    je left_arrow  

    cmp al, 064h    
    je right_arrow

    cmp al, 20h
    je jumped_key

    
    
    jmp clear_buffer

    left_arrow:
        
        sub SYSRA_X, 3
        mov FLIP, 1   
        mov STATE, 1
        jmp clear_buffer
        
    right_arrow:
        ADD SYSRA_X, 3
        mov FLIP, 0
        mov STATE, 1
        jmp clear_buffer

    jumped_key:
        mov JUMPED, 1
        jmp clear_buffer


    clear_buffer:
        mov ah, 01h      
        int 16h
        jz done          
        mov ah, 00h      
        int 16h
        cmp al, 20h
        je jumped_key
        jmp clear_buffer 

    done:
        mov ah, 01h      
        int 16h
    RET
Input ENDP

JUMPINPUT PROC
    
    mov ax, JUMPED
    cmp ax, 1
    jz jump_key 
    jmp doneJump

    jump_key:
        sub SYSRA_Y, 30
        
    doneJump:
    mov JUMPED, 0
    RET
JUMPINPUT ENDP

PHYSICSUPDATE PROC
    
    mov ax, GRAVITY
    add SYSRA_Y, ax
    
    call JUMPINPUT
    
    call COLLISIONDEDECTION

    RET    
PHYSICSUPDATE ENDP

DRAW PROC
    RET
DRAW ENDP

DRAWSPRITE PROC
    ;lea si, RUN1
    mov ax, 0
    mov bx, 0
    mov dx, 0
    mov cx, Siz
    mov SPRITEPOINTERY, 0
    mov SPRITEPOINTERX, 0
    ROW:
        push cx
        mov cx, Siz

        mov SPRITEPOINTERX, 0
        
        lea di, SPRITEPOINTERY
        mov bx, [di]
        add bx, bx
        mov bx, [si + bx]
        call FLIPSPRITE
        mov AUXSPRITE, bx
        mov ax, 00h
        cmp ax, bx
        jz skipRow
        COL:
            push cx
            mov bx, AUXSPRITE        
            test bx, 8000h  
            jz zero
            mov cx, Obj_X
            mov dx, Obj_Y
            mov ax, Siz
            mov bl, 2
            div bl
            mov ah, 0
            sub cx, ax
            sub dx, Siz

            add cx, SPRITEPOINTERX
            CMP CX, 320
            JGE zero  
            CMP CX, 0
            JLE zero 

            add dx, SPRITEPOINTERY
  
            MOV AX, 320        
            MUL DX             
            ADD AX, CX         
            MOV DI, AX         

            MOV AL, 0Fh        
            MOV BYTE PTR ES:[DI], AL  

            zero:
            shl AUXSPRITE, 1
            inc SPRITEPOINTERX

            pop cx
        loop COL
    skipRow:inc SPRITEPOINTERY

    pop cx
    loop ROW
    
    RET
DRAWSPRITE ENDP

ANIMATION PROC
    mov ax, FLIP
    mov AUXFLIP, ax
    mov ax, SYSRA_X
    mov bx, 320
    cmp ax, bx
    jle jump
    mov SYSRA_X, 0 

    jump:
    ;mov SYSRA_Y, 176
    mov ax, SYSRA_X
    mov Obj_X, ax
    mov ax, SYSRA_Y

    mov Obj_Y, ax
    mov ax, Frame
    mov dx, 0        ; Clear DX before division
    mov bx, 6
    div bx           ; AX = Frame / 3, DX = Frame % 3

    mov cx, STATE
    cmp cx, 0
    jz DefaultFrame

    cmp dx, 3
    jl Frame1

    cmp dx, 6
    jle Frame2

    

    Frame1:
        lea si, RUN1
        call DRAWSPRITE
        jmp QuitFrame

    Frame2:
        lea si, RUN2
        call DRAWSPRITE
        jmp QuitFrame


    DefaultFrame:
        lea si, RUN1
        call DRAWSPRITE
        jmp QuitFrame

    QuitFrame:
    mov AUXFLIP, 0
    RET 
ANIMATION ENDP

TILEMAPEDITOR PROC
    
    mov ax, SCROLLX
    mov bl, 16
    div bl
    mov cx, 0
    mov cl, ah
    mov TILEMAPX, cx

    mov ah, 0
    add ax, ax


    lea si, TILEOFFSETINDEX
    add si, ax
    mov bx, [si]
    mov TILEINDEX, bx
    
    lea si, LEVEL
    add si, ax
    mov ax, 0
    mov bx, 0
    mov dx, 0
    mov cx, 21

    mov TILEPOINTERX, 0
    mov TILEPOINTERY, 0 
    
    TILEROW:
        push cx
        mov cx, 12
        
        lea di, TILEPOINTERX
        mov bx, [di]
        add bx, bx
        mov bx, [si + bx]
        mov AUXMAP, bx
        mov ax, 00h
        cmp ax, bx
        jz skipRow1
        TILECOL:
            push cx
            push si
            
            mov bx, AUXMAP        
            test bx, 8000h  
            jz zero1

            mov ax, TILEPOINTERX
            mov bx, 16
            mul bl
            add ax, 8
            sub ax, TILEMAPX
            mov Obj_X, ax

            mov ax, TILEPOINTERY
            mov bx, 16
            mul bl
            add ax, 16
            mov Obj_Y, ax

            
            lea si, TILES
            add si, TILEINDEX
            mov si, [si]

            call DRAWSPRITE
            add TILEINDEX, 2


            zero1:
            shl AUXMAP, 1
            pop si
            ;lea si, LEVEL
            inc TILEPOINTERY

            pop cx
        loop TILECOL
    skipRow1:
    inc TILEPOINTERX
    mov TILEPOINTERY, 0
    pop cx
    loop TILEROW
    ;inc SCROLLX
    RET
TILEMAPEDITOR ENDP

FLIPSPRITE PROC
    push cx
    mov ax, AUXFLIP
    cmp ax, 1
    jnz NOFlip

    mov ax, bx

    MOV DX, AX  
    XOR AX, AX  
    MOV CX, 16  

    ReverseLoop:
        ROL DX, 1   
        RCR AX, 1   
    LOOP ReverseLoop

    
    mov bx, ax
    NOFlip:
    pop cx
    ret
FLIPSPRITE ENDP

COLLISIONDEDECTION PROC

    mov cx, SYSRA_X
    mov dx, SYSRA_Y
    sub dx, 16

    mov Obj_X, cx
    mov Obj_Y, dx
   
    mov bx, 0
    mov cx, 16
    COLLUPDW:
        push cx
        mov cx, Obj_X
        mov dx, Obj_Y
        call COPYPIXEL
        pop cx
        cmp al, 0Fh
        je ADDBX
        jmp NOBX

        ADDBX:
            cmp cx, 8
            jle TOBL 
            jmp TOBH

            TOBL:
                add bl, 1 
            TOBH:
                add bh, 1
        NOBX:
        inc Obj_Y
        loop COLLUPDW
        add bl ,bh
        mov bh, 0
        sub SYSRA_Y, bx

    mov cx, SYSRA_X
    mov dx, SYSRA_Y
    sub dx, 8
    sub cx, 10 

    mov Obj_X, cx
    mov Obj_Y, dx

    mov bx, 0
    mov cx, 20
    COLLSIDE:
        push cx
        mov cx, Obj_X
        mov dx, Obj_Y
        call COPYPIXEL
        pop cx
        cmp al, 0Fh
        je ADDBXS
        jmp NOBXS

        ADDBXS:
            cmp cx, 10
            jg TOBLS 
            jmp TOBHS

            TOBLS:
                add bh, 1 
            TOBHS:
                add bl, 1
        NOBXS:
        inc Obj_X
        loop COLLSIDE

        mov ax, bx
        mov al, ah
        mov ah, 0
        mov bh, 0
        add ax, ax      ;dont ask me why, it works
        add SYSRA_X, ax
        sub SYSRA_X, bx

    RET
COLLISIONDEDECTION ENDP

COPYPIXEL PROC
    MOV AX, 320        
    MUL dx             
    ADD ax, cx         
    MOV DI, AX  

    mov ax, 0
    mov AL, BYTE PTR ES:[DI]

    ret  
COPYPIXEL ENDP

CODE ENDS
END MAIN

hlt