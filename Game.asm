.MODEL SMALL  
.STACK 100h

.DATA
    ;Game
    FrameBuffer DW 0
    LastTimeD DW 0
    Frame DW 0

    ;Player
    SYSRA_X DW 50
    SYSRA_Y DW 50

    isGROUNDED db 0

    STATE DW 0

    FLIP DW 0
    AUXFLIP DW 0

    SYSRA_VEL_X DW 0
    SYSRA_VEL_Y DW 0

    FORCEX DW 0
    FORCEY DW 0

    GRAVITY DW 1

    JUMPED DW 0


    COLLX DW 0
    COLLY DW 0

    ;SYSRA_Y DW 176

    IDLE DW 00h, 00h, 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 07E0h, 0ED0h, 0ED0h, 03734h, 037E4h, 07D0h, 0810h
    RUN1 DW 00h, 00h, 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 07E0h, 0ED0h, 036D4h, 03734h, 07E0h, 07C8h, 0C18h
    RUN2 DW 00h, 00h, 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 07E0h, 0ED0h, 0ED0h, 03734h, 037E4h, 0300h, 01B0h

    ;Sprite Renderer
    Obj_X DW 0
    Obj_Y DW 0

    Siz DW 16

    SPRITEPOINTERX DW 0
    SPRITEPOINTERY DW 0
    AUXSPRITE DW 0            
    
    TILEINDEX DW 0

    LEFT DW 0D800h, 0C000h, 0DC00h, 0DC00h, 0DD00h, 0C000h, 0DB00h, 0DB00h, 0D800h, 0DA00h, 0C000h, 0DC00h, 0DC00h, 0DC00h, 0C000h, 0D800h
    RIGHT DW 01Bh, 03h, 03Bh, 03Bh, 03Bh, 03h, 05Bh, 01Bh, 0DBh, 0DBh, 03h, 0BBh, 03Bh, 03Bh, 03h, 01Bh
    BLC DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 08000h, 08000h, 02000h, 00h, 09800h
    BRC DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 0Dh, 0Ch, 00h, 019h
    TOP DW 0FFFFh, 0FFFFh, 00h, 0BBDDh, 0BBDDh, 0381Ch, 02C0h, 0D0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    TLC DW 09800h, 00h, 03000h, 0B000h, 08000h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    TRC DW 019h, 00h, 04h, 01h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
    BOTTOM DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0B00h, 0340h, 0381Ch, 0BBDDh, 0BBDDh, 00h, 0FFFFh, 0FFFFh
    TOPLEFT DW 0FFFFh, 0FFFFh, 0C000h, 0DBDDh, 0DBDDh, 0C01Ch, 0DB40h, 0DB00h, 0D800h, 0DA00h, 0C000h, 0DC00h, 0DC00h, 0DC00h, 0C000h, 0D800h
    TOPRIGHT DW 0FFFFh, 0FFFFh, 03h, 0BBDBh, 0BBDBh, 03803h, 05Bh, 01Bh, 0DBh, 0DBh, 03h, 0BBh, 03Bh, 03Bh, 03h, 01Bh
    BOTTOMLEFT DW 0D800h, 0C000h, 0DC00h, 0DC00h, 0DC00h, 0C000h, 0D800h, 0D800h, 0D8D0h, 0DAC0h, 0C01Ch, 0DBDDh, 0DBDDh, 0C000h, 0FFFFh, 0FFFFh
    BOTTOMRIGHT DW 01Bh, 03h, 03Bh, 03Bh, 03Bh, 03h, 05Bh, 01Bh, 0DBh, 02DBh, 03803h, 0BBDBh, 0BBDBh, 03h, 0FFFFh, 0FFFFh
    ALLCOVER DW 0FFFFh, 0FFFFh, 0C003h, 0DA03h, 0D803h, 0C003h, 0D003h, 0C003h, 0C00Bh, 0C003h, 0C03Bh, 0C1BBh, 0C1BBh, 0C003h, 0FFFFh, 0FFFFh
    CLOSEM DW 0FFFFh, 0FFFFh, 00h, 0BBDDh, 0BBDDh, 0381Ch, 02C0h, 0D0h, 00h, 00h, 00h, 00h, 00h, 00h, 0FFFFh, 0FFFFh
    CLOSELEFT DW 0FFFFh, 0FFFFh, 0C000h, 0DBDDh, 0DBDDh, 0C01Ch, 0DB40h, 0DB00h, 0D800h, 0DA00h, 0C000h, 0D000h, 0C000h, 0C000h, 0FFFFh, 0FFFFh
    CLOSERIGHT DW 0FFFFh, 0FFFFh, 03h, 0BBDBh, 0BBDBh, 03803h, 05Bh, 01Bh, 0DBh, 0DBh, 03h, 02Bh, 03h, 03h, 0FFFFh, 0FFFFh
    CLOSEMID DW 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h
    CLOSETOP DW 0FFFFh, 0FFFFh, 0C003h, 0DBBBh, 0DBBBh, 0C03Bh, 0C583h, 0C1A3h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h
    CLOSEBOTTOM DW 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C003h, 0C00Bh, 0C003h, 0C01Bh, 0D01Bh, 0C383h, 0DBBBh, 0DBBBh, 0C003h, 0FFFFh, 0FFFFh


    LEVEL DW 0FFF0h, 08010h, 08010h, 08210h, 08210h, 08210h, 08010h, 08010h, 08010h, 08F10h
      DW 0A910h, 08910h, 08F10h, 08010h, 08010h, 08010h, 08710h, 08010h, 08010h, 08010h
      DW 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08810h, 08010h, 08110h, 08110h
      DW 08810h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08070h, 08050h
      DW 08050h, 08070h, 08010h, 08010h, 08010h, 08010h, 08030h, 08060h, 080C0h, 08180h
      DW 08100h, 08100h, 08100h, 08100h, 08100h, 08100h, 08180h, 080C0h, 08060h, 08030h
      DW 08010h, 08010h, 08010h, 08010h, 09010h, 09E10h, 09010h, 08010h, 09E10h, 09410h
      DW 09410h, 09E10h, 08010h, 09E10h, 09010h, 09010h, 09E10h, 08010h, 08010h, 09F10h
      DW 09410h, 09410h, 09C10h, 08010h, 0DE10h, 08010h, 08010h, 08010h, 08010h, 08010h
      DW 08010h, 08010h, 08010h, 08010h, 08110h, 08010h, 08010h, 08010h, 08010h, 08110h
      DW 08110h, 08110h, 08910h, 08110h, 08110h, 08110h, 08010h, 08010h, 08010h, 08010h
      DW 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 0FFF0h
    TILES DW OFFSET BRC, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT
        DW OFFSET RIGHT, OFFSET TRC, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSELEFT, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSERIGHT, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOPLEFT, OFFSET LEFT, OFFSET LEFT, OFFSET BOTTOMLEFT, OFFSET TOP, OFFSET BOTTOM, OFFSET ALLCOVER, OFFSET TOP
        DW OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOPRIGHT, OFFSET RIGHT, OFFSET RIGHT
        DW OFFSET BOTTOMRIGHT, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSETOP
        DW OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET ALLCOVER, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSELEFT, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET CLOSERIGHT, OFFSET TOP, OFFSET BOTTOM, OFFSET ALLCOVER, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOPLEFT, OFFSET LEFT, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOPRIGHT, OFFSET RIGHT, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOPLEFT, OFFSET TLC, OFFSET BOTTOM, OFFSET TOPLEFT, OFFSET TLC, OFFSET BOTTOM, OFFSET TOPLEFT, OFFSET TLC
        DW OFFSET BOTTOM, OFFSET TOPLEFT, OFFSET TLC, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOPRIGHT, OFFSET TRC, OFFSET BOTTOM, OFFSET TOPRIGHT
        DW OFFSET TRC, OFFSET BOTTOM, OFFSET TOPRIGHT, OFFSET TRC, OFFSET BOTTOM, OFFSET TOPRIGHT, OFFSET TRC, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSELEFT, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP
        DW OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSERIGHT, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOPLEFT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOPRIGHT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOPLEFT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET TOP
        DW OFFSET BOTTOM, OFFSET TOP, OFFSET TOP, OFFSET BOTTOM, OFFSET TOPRIGHT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOPLEFT, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET CLOSEBOTTOM, OFFSET TOP
        DW OFFSET BOTTOM, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOPRIGHT
        DW OFFSET CLOSEMID, OFFSET CLOSEMID, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET ALLCOVER, OFFSET CLOSETOP, OFFSET CLOSEMID, OFFSET CLOSEMID
        DW OFFSET CLOSEBOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP
        DW OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP
        DW OFFSET BOTTOM, OFFSET ALLCOVER, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSELEFT, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSEM, OFFSET TOP
        DW OFFSET BOTTOM, OFFSET ALLCOVER, OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSEM, OFFSET TOP, OFFSET BOTTOM, OFFSET CLOSEM, OFFSET TOP
        DW OFFSET BOTTOM, OFFSET CLOSERIGHT, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM
        DW OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BOTTOM, OFFSET TOP, OFFSET BLC
        DW OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT
        DW OFFSET TLC
    TILEOFFSETINDEX DW 0, 24, 28, 32, 38, 44, 50, 54, 58, 62
                    DW 74, 84, 92, 104, 108, 112, 116, 126, 130, 134
                    DW 138, 142, 146, 150, 154, 158, 162, 168, 172, 178
                    DW 184, 190, 194, 198, 202, 206, 210, 214, 218, 226
                    DW 232, 238, 246, 250, 254, 258, 262, 268, 274, 280
                    DW 286, 290, 294, 298, 302, 306, 310, 316, 322, 328
                    DW 334, 338, 342, 346, 350, 356, 368, 374, 378, 390
                    DW 398, 406, 418, 422, 434, 440, 446, 458, 462, 466
                    DW 480, 488, 496, 506, 510, 524, 528, 532, 536, 540
                    DW 544, 548, 552, 556, 560, 566, 570, 574, 578, 582
                    DW 588, 594, 600, 608, 614, 620, 626, 630, 634, 638
                    DW 642, 646, 650, 654, 658, 662, 666, 670, 674, 678
                    DW 702

    TILEMAPX DW 0
    SCROLLX DW 0
    
    TILEPOINTERX DW 0
    TILEPOINTERY DW 0

    AUXMAP DW 0

    LEFTED DW 0
    RIGHTED DW 0
    JUMPEDED DW 0


.CODE

PUBLIC _FrameUpdate   
PUBLIC _Setup 
PUBLIC _Input
PUBLIC _Exit

_Setup PROC
    push ds  
    MOV AX, 13h       
    INT 10h           
    MOV AX, 0A000h    
    MOV ES, AX 
    call ALLOCATE_FRAME_BUFFER        
    pop ds             
    retf       
_Setup ENDP

_FrameUpdate PROC FAR
    push ds  
    call GAMECYCLE
    pop ds             ; Restore DS
    retf               ; Return far (needed for Turbo C)
_FrameUpdate ENDP

_Input PROC FAR
    push bp          ; Save old base pointer
    mov bp, sp       ; Set new base pointer

    mov ax, [bp+6]   ; First parameter (a)
    mov bx, [bp+8]   ; Second parameter (b)
    mov cx, [bp+10]   ; Third parameter (c)

    mov LEFTED, ax
    mov RIGHTED, bx
    mov JUMPEDED, cx
    ; Do something with a, b, c (AX, BX, CX)
    
    pop bp           ; Restore base pointer
    retf             ; Return FAR (for Turbo C)
_Input ENDP


_Exit PROC
    MOV AH, 00
    MOV AL, 03h    
    INT 10h        
    retf
_Exit ENDP

ALLOCATE_FRAME_BUFFER PROC
    MOV AH, 48h        
    MOV BX, 4000h      
    INT 21h            
    MOV FrameBuffer, AX 
    RET

ALLOCATE_FRAME_BUFFER ENDP

GAMECYCLE PROC
    
    GameLoop:
    
    inc Frame
    
    call RESET
    call INPUT
    call TILEMAPEDITOR
    call PHYSICSUPDATE
    call CLAMPPOS
    call ANIMATION
    call SWAPVGABUFFER

    mov LEFTED, 0
    mov RIGHTED, 0
    mov JUMPEDED, 0
    RET
GAMECYCLE ENDP

RESET PROC
    mov ax, FrameBuffer  
    mov es, ax      

    xor di, di      
    mov cx, 320 * 200  
    xor al, al      

    mov ah, 02h     
    rep stosb   

    RET 
RESET ENDP

INPUT PROC
    mov ax, LEFTED
    cmp al, 1    
    je left_arrow  

    back:
        mov ax, RIGHTED
        cmp al, 1     
        je right_arrow

    back1:
        mov ax, JUMPEDED
        cmp al, 1      
        je jumped_key

    jmp done

    left_arrow:
        
        add SYSRA_VEL_X, 1



        sub SYSRA_X, 2
        mov FLIP, 1   
        mov STATE, 1
        jmp back
        
    right_arrow:

        mov ax, SYSRA_X
        cmp ax, 160
        jge MOVSCROLL


        MOVSYSRA:
            add SYSRA_X, 2
            jmp FLIPState
        MOVSCROLL:
            add SCROLLX, 2
            mov SYSRA_X, 160
            
        FLIPState:   
        mov FLIP, 0
        mov STATE, 1
        jmp back1

    jumped_key:
        mov JUMPED, 1
    done:
        
    RET
Input ENDP

CLAMPPOS PROC
    Xpox:
    mov ax, SYSRA_X
    cmp ax, 320
    jge GTX320
    cmp ax, 0
    jle LEX320
    jmp Ypox

    GTX320:
        mov SYSRA_X, 312
        jmp Ypox
    LEX320:
        mov SYSRA_X, 8
        jmp Ypox
    
    Ypox:
    mov ax, SYSRA_Y
    cmp ax, 200
    jge GTY200
    cmp ax, 0
    jle LEX200
    jmp posout

    GTY200:
        mov SYSRA_Y, 150
        jmp posout
    LEX200:
        mov SYSRA_Y, 50
        jmp posout

    posout:
        ret

CLAMPPOS ENDP

JUMPINPUT PROC
    

    cmp isGROUNDED, 0
    je doneJump

    mov ax, JUMPED
    cmp ax, 1

    jz jump_key
    jmp doneJump

    jump_key:
        mov FORCEY, 3
        mov ax, 3
        sub SYSRA_VEL_Y, ax

        mov FORCEY, 3    
    doneJump:
    
    mov ax, FORCEY
    sub SYSRA_VEL_Y, ax
    
    mov bx, 2


    cmp FORCEY, 0
    jle damp
    sub FORCEY, 1
    jmp doneJump2


    damp:
    mov FORCEY, 0

    doneJump2:
    mov JUMPED, 0
    RET
JUMPINPUT ENDP

PHYSICSUPDATE PROC
    
    
    call GROUNDCHEK

    call JUMPINPUT

    cmp isGROUNDED, 1
    jz skipG
    

    mov ax, GRAVITY
    add SYSRA_VEL_Y, ax

    cmp SYSRA_VEL_Y, 10
    jl clampVelo
    mov SYSRA_VEL_Y, 10
    clampVelo:

    skipG:
    call COLLISIONDEDECTION

    mov ax, SYSRA_VEL_Y
    add SYSRA_Y, ax
    
    call GROUNDCHEK
    cmp isGROUNDED, 1
    je setYZero
    jmp outofG
    setYZero:
        mov SYSRA_VEL_Y, 0

    outofG:

    RET    
PHYSICSUPDATE ENDP

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
    ;add ax, 1
    mov Obj_Y, ax
    mov ax, Frame
    mov dx, 0        
    mov bx, 20
    div bx           

    mov cx, STATE
    cmp cx, 0
    jz DefaultFrame

    cmp dx, 10
    jl Frame1

    cmp dx, 20
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
        lea si, IDLE
        call DRAWSPRITE
        jmp QuitFrame

    QuitFrame:
    mov STATE, 0
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

SWAPVGABUFFER PROC
    push ds
    mov cx, 320 * 100  ; 64,000 pixels to copy
    mov si, 0          ; Start of buffer
    mov di, 0          ; Start of VGA memory

    mov ax, 0A000h     ; VGA memory segment
    mov es, ax         ; Set ES to VGA

    mov ax, FrameBuffer     ; Off-screen buffer segment
    mov ds, ax         ; Set DS to our buffer

    rep movsw       

    mov ax, FrameBuffer     ; Off-screen buffer segment
    mov es, ax         ; Set DS to our buffer

    pop ds
    ret
SWAPVGABUFFER ENDP

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
    sub dx, 14

    mov Obj_X, cx
    mov Obj_Y, dx
   
    mov bx, 0
    mov cx, 14
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
        mov ax, bx
        mov al, ah
        mov ah, 0
        mov bh, 0
        add ax, ax
        add SYSRA_Y, bx
        sub SYSRA_Y, ax

        cmp bx, 0
        jnz updateYvelocity
        jmp xcoll

        updateYvelocity: mov SYSRA_VEL_Y, 0

        xcoll:
    mov cx, SYSRA_X
    mov dx, SYSRA_Y
    sub dx, 8
    sub cx, 8 

    mov Obj_X, cx
    mov Obj_Y, dx

    mov bx, 0
    mov cx, 16
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

GROUNDCHEK PROC
    mov isGROUNDED, 0
    mov cx, SYSRA_X
    mov dx, SYSRA_Y
    add dx, 1

    mov Obj_X, cx
    mov Obj_Y, dx
   
    mov bx, 0
    mov cx, 2
    GNDDW:
        push cx
        mov cx, Obj_X
        mov dx, Obj_Y
        call COPYPIXEL
        pop cx
        cmp al, 0Fh
        je GND
        jmp NOTGND

        GND:
            mov isGROUNDED, 1
        NOTGND:
        inc Obj_Y
        loop GNDDW
    
    
    ret
GROUNDCHEK ENDP

COPYPIXEL PROC
    MOV AX, 320        
    MUL dx             
    ADD ax, cx         
    MOV DI, AX  

    mov ax, FrameBuffer
    mov es, ax
    mov ax, 0
    mov AL, BYTE PTR ES:[DI]

    ret  
COPYPIXEL ENDP

END
hlt