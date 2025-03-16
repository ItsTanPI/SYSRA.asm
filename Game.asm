.MODEL SMALL  
.STACK 64h

Entity STRUC
    X DW ?            ;0     
    Y DW ?            ;2  
    Image DW ?        ;4
    PosOffset DW ?    ;6 
    MaxMovement DW ?  ;8
    Movement DB ?     ;10
    ;76543210
    ;||||||||+-- Bit 0: Can Move (1 = can move, 0 = cannot move)
    ;|||||||+--- Bit 1: Direction (1 = Up, 0 = Down)
    ;||||||+---- Bit 2: Side (1 = +, 0 = -)
    ;|||||+----- Bit 3: Collision (1 = no collision, 0 = collision)
    ;||||+------ Bit 4: speed

    ;11
Entity ENDS


.DATA
    ;Game
    FrameBuffer DW 0
    LastTimeD DW 0
    
    Frame DW 0

    PLAYERDEAD db 0
    SYSRA_X DW 50
    SYSRA_Y DW 50

    SYSRA_VEL_X DW 0
    SYSRA_VEL_Y DW 0

    FORCEX DW 0
    FORCEY DW 0


    isGROUNDED dW 0

    COYOTETIME dw 0 

    SCROLLX DW 0


    ;Player
    STATE DW 0
    FLIP DW 0
    AUXFLIP DW 0
    GRAVITY DW 1
    JUMPED DW 0


    COLLX DW 0
    COLLY DW 0

    ;SYSRA_Y DW 176

    IDLE DW 00h, 00h, 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 07E0h, 0ED0h, 0ED0h, 03734h, 037E4h, 07D0h, 0810h
    RUN1 DW 00h, 00h, 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 07E0h, 0ED0h, 036D4h, 03734h, 07E0h, 07C8h, 0C18h
    RUN2 DW 00h, 00h, 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 07E0h, 0ED0h, 0ED0h, 03734h, 037E4h, 0300h, 01B0h
    RAISE DW 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 0FF0h, 0ED0h, 0ED0h, 06F36h, 0FE0h, 0FD8h, 01808h, 00h, 00h
    FALL DW 00h, 00h, 0810h, 0810h, 01818h, 01818h, 0BD0h, 017E8h, 04DB2h, 04DB2h, 02E74h, 0FF0h, 0FF0h, 07E0h, 0810h, 0810h
    DEAD DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0408h, 0408h, 0C0Ch, 0C0Ch, 05E8h, 0BF4h, 07F8h, 016E8h, 03718h

    SPIKE DW 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01818h, 01818h, 02C2Ch, 02C2Ch, 02C2Ch, 04E4Eh, 04E4Eh, 0FFFFh, 08001h

    ENEMYHORN1 DW 00h, 00h, 00h, 0810h, 01008h, 01818h, 01BD8h, 07E0h, 01FF8h, 01FF8h, 013C8h, 013C8h, 0FF0h, 01248h, 01018h, 01800h
    ENEMYHORN2 DW 00h, 00h, 00h, 0810h, 01008h, 01818h, 01BD8h, 07E0h, 01FF8h, 01FF8h, 013C8h, 013C8h, 0FF0h, 01248h, 01808h, 018h

    FLYINGENEMY1 DW 00h, 00h, 00h, 00h, 04002h, 063C6h, 077EEh, 057EAh, 06FF6h, 0990h, 02994h, 06FF6h, 04242h, 00h, 00h, 00h
    FLYINGENEMY2 DW 00h, 00h, 00h, 00h, 03C0h, 07E0h, 077EEh, 0FF0h, 0990h, 02994h, 02FF4h, 01248h, 00h, 00h, 00h, 00h

    ;Sprite Renderer
    Obj_X DW 0
    Obj_Y DW 0

    Siz DW 16

    SPRITEPOINTERX DW 0
    SPRITEPOINTERY DW 0
    AUXSPRITE DW 0          
    

    NULL DW 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
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


    TILEMAPX DW 0
    TILEINDEX DW 0
    
    TILEPOINTERX DW 0
    TILEPOINTERY DW 0

    AUXMAP DW 0

    LEFTED DW 0
    RIGHTED DW 0
    JUMPEDED DW 0

    
    LEVEL DW 0FFE0h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00030h, 00000h, 00000h
        DW 00030h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00030h, 00000h
        DW 00100h, 00100h, 00100h, 00000h, 00000h, 00100h, 00000h, 00000h, 00100h, 00100h
        DW 00100h, 00000h, 00000h, 00000h, 00030h, 00020h, 00020h, 00020h, 00020h, 00020h
        DW 00020h, 00060h, 000C0h, 00180h, 00300h, 00200h, 00200h, 00200h, 00200h, 00200h
        DW 00200h, 003F0h, 00000h, 00000h, 00000h, 00200h, 00000h, 00000h, 00000h, 00200h
        DW 00000h, 00000h, 00000h, 00200h, 00000h, 00000h, 00000h, 00200h, 00000h, 00000h
        DW 00000h, 003F0h, 00200h, 00200h, 00200h, 00200h, 00200h, 00200h, 00300h, 00180h
        DW 000C0h, 00060h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h
        DW 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h
        DW 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 00020h, 0FFE0h
        
    TILES DW OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT
        DW OFFSET TRC, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT, OFFSET RIGHT, OFFSET TOPLEFT
        DW OFFSET LEFT, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT, OFFSET RIGHT
        DW OFFSET CLOSELEFT, OFFSET CLOSEM, OFFSET CLOSERIGHT, OFFSET ALLCOVER, OFFSET CLOSELEFT, OFFSET CLOSEM, OFFSET CLOSERIGHT, OFFSET TOPLEFT, OFFSET LEFT, OFFSET TOP
        DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPLEFT, OFFSET TLC, OFFSET TOPLEFT, OFFSET TLC, OFFSET TOPLEFT
        DW OFFSET TLC, OFFSET TOPLEFT, OFFSET TLC, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOPRIGHT
        DW OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET ALLCOVER, OFFSET ALLCOVER, OFFSET ALLCOVER, OFFSET ALLCOVER, OFFSET TOPLEFT
        DW OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
        DW OFFSET TOP, OFFSET TOPRIGHT, OFFSET TRC, OFFSET TOPRIGHT, OFFSET TRC, OFFSET TOPRIGHT, OFFSET TRC, OFFSET TOPRIGHT, OFFSET TRC, OFFSET TOP
        DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
        DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
        DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT
        DW OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET TLC
    
    TILEOFFSETINDEX DW 0, 22, 24, 26, 28, 30, 32, 34, 38, 38
                    DW 38, 42, 44, 46, 48, 50, 52, 54, 56, 60
                    DW 60, 62, 64, 66, 66, 66, 68, 68, 68, 70
                    DW 72, 74, 74, 74, 74, 78, 80, 82, 84, 86
                    DW 88, 90, 94, 98, 102, 106, 108, 110, 112, 114
                    DW 116, 118, 130, 130, 130, 130, 132, 132, 132, 132
                    DW 134, 134, 134, 134, 136, 136, 136, 136, 138, 138
                    DW 138, 138, 150, 152, 154, 156, 158, 160, 162, 166
                    DW 170, 174, 178, 180, 182, 184, 186, 188, 190, 192
                    DW 194, 196, 198, 200, 202, 204, 206, 208, 210, 212
                    DW 214, 216, 218, 220, 222, 224, 226, 228, 250


    Entities Entity <56, 160, OFFSET ENEMYHORN1, 0, 50, 11111101b>
             Entity <700, 100, OFFSET FLYINGENEMY1, -10, 50, 11111111b>, <760, 100, OFFSET FLYINGENEMY1, 35, 50, 11111111b>, <820, 100, OFFSET FLYINGENEMY1, -50, 50, 11111111b>
             Entity <890, 100, OFFSET FLYINGENEMY1, 23, 50, 11111111b>, <950, 100, OFFSET FLYINGENEMY1, -43, 50, 11111111b>
             Entity <1500, 160, OFFSET SPIKE, 0, 50, 00001101b>, <1040, 96, OFFSET SPIKE, 0, 55, 00001101b>
    NoOfEnt DW 8

    

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
    call ALLOCATEFRAMEBUFFER        
    pop ds             
    retf       
_Setup ENDP

_FrameUpdate PROC FAR
    push ds  
    call GAMECYCLE
    pop ds             
    retf               
_FrameUpdate ENDP

_Input PROC FAR
    push bp          
    mov bp, sp       

    mov ax, [bp+6]   
    mov bx, [bp+8]   
    mov cx, [bp+10]   

    mov LEFTED, ax
    mov RIGHTED, bx
    mov JUMPEDED, cx
    
    pop bp          
    retf
_Input ENDP

_Exit PROC
    MOV AH, 00
    MOV AL, 03h    
    INT 10h        
    retf
_Exit ENDP

ALLOCATEFRAMEBUFFER PROC
    MOV AH, 48h        
    MOV BX, 4000h      
    INT 21h            
    MOV FrameBuffer, AX 
    RET

ALLOCATEFRAMEBUFFER ENDP

GAMECYCLE PROC
    
    GameLoop:
    
    inc Frame
    
    call RESET
    call INPUT
    call TILEMAPEDITOR
    call PHYSICSUPDATE
    call CLAMPPOS
    call DRAWENTITY
    call ANIMATION

    lea si, Frame
    mov Obj_X, 40
    mov Obj_Y, 40
    call DRAWSPRITE
    call PLAYERKILL
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
    Ypox:
    mov ax, SYSRA_Y
    cmp ax, 200
    jge GTY200
    cmp ax, 0
    jle LEX200
    jmp posout

    GTY200:
        mov PLAYERDEAD, 1
        jmp posout
    LEX200:
        mov PLAYERDEAD, 1
        jmp posout
    posout:
        ret

CLAMPPOS ENDP

PLAYERKILL PROC

    cmp PLAYERDEAD, 1
    jne dontKill

    mov SYSRA_Y, 50
    mov SYSRA_x, 50
    mov SCROLLX, 0

    mov SYSRA_VEL_y, 0
    mov FORCEX, 0
    mov FORCEY, 0


    dontKill:
    mov PLAYERDEAD, 0
    ret
PLAYERKILL ENDP

JUMPINPUT PROC

    cmp COYOTETIME, 0
    jle doneJump

    mov ax, JUMPED
    cmp ax, 1
    jz jump_key
    jmp doneJump

    jump_key:
        mov SYSRA_VEL_Y, 0
        mov COYOTETIME, 0
        mov FORCEY, 2
        mov ax, 3
        sub SYSRA_VEL_Y, ax
   
    doneJump:    
    
    mov ax, FORCEY
    sub SYSRA_VEL_Y, ax
    
    cmp FORCEY, 0
    jle damp
    sub FORCEY, 1
    jmp doneJump2

    damp:
    mov FORCEY, 0

    doneJump2:
    mov JUMPED, 0
    mov JUMPEDED, 0
    RET
JUMPINPUT ENDP

COYOTE PROC
    cmp isGROUNDED, 1
    je setCy
    jmp deccy

        setCy:
        mov COYOTETIME, 10
        jmp exitCY

    deccy:
    cmp isGROUNDED, 0
    jne exitCY
    dec COYOTETIME
    cmp COYOTETIME, 0
    jnle exitCY
    mov COYOTETIME, 0
    exitCY:
    RET
COYOTE ENDP

PHYSICSUPDATE PROC
    call GROUNDCHEK
    call COYOTE

    mov ax, Frame
    mov bx, 3
    idiv bx
    cmp dx, 0
    jne skipG

    call JUMPINPUT

    cmp isGROUNDED, 1
    jz skipG
    

    mov ax, GRAVITY
    add SYSRA_VEL_Y, ax


    cmp SYSRA_VEL_Y, 5
    jl clampVelo
    mov SYSRA_VEL_Y, 5
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
            CMP dX, 200
            JGE zero  
            CMP dX, 0
            JLE zero

            call RENDER

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

RENDER PROC
    MOV AX, 320        
    MUL DX             
    ADD AX, CX         
    MOV DI, AX         

    MOV AL, 0fh        
    MOV BYTE PTR ES:[DI], AL
    RET
RENDER ENDP

ANIMATION PROC

    cmp PLAYERDEAD, 1
    jnge nextani

    mov STATE, 4
    jmp Anima

    nextani:
    cmp isGROUNDED, 0
    je AIR
    jmp Anima
    
    AIR:
        cmp SYSRA_VEL_Y, 0
        jl RAINSING
        cmp SYSRA_VEL_Y, 0
        jge FALLING
        
        jmp Anima

        RAINSING:
            mov STATE, 2
            jmp Anima
        FALLING:
            mov STATE, 3
            jmp Anima

    Anima:

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
    mov bx, 15
    div bx           

    mov cx, STATE
    cmp cx, 0
    jz DefaultFrame

    cmp cx, 2
    jz RAINSINGFrame

    cmp cx, 3
    jz FALLINGFrame

    cmp cx, 4
    jz DEADSpr

    cmp dx, 8
    jl Frame1

    cmp dx, 15
    jle Frame2

    Frame1:
        lea si, RUN1
        call DRAWSPRITE
        jmp QuitFrame

    Frame2:
        lea si, RUN2
        call DRAWSPRITE
        jmp QuitFrame

    RAINSINGFrame:
        lea si, RAISE
        call DRAWSPRITE
        jmp QuitFrame

    FALLINGFrame:
        lea si, FALL
        call DRAWSPRITE
        jmp QuitFrame

    DEADSpr:
        lea si, DEAD
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

DRAWENTITY PROC
    lea si, Entities
    mov cx, NoOfEnt

    EntityLoop:
        
        push cx
        mov ax, [si]
        sub ax, SCROLLX

        ;cmp ax, 168
        ;jg skipentity

        ;cmp ax, -168
        ;jl skipentity

        add ax, 160
        mov Obj_X, ax
        mov ax, [si + 2]
        mov Obj_Y, ax

        call ENTITYUPDATE
        call ENTITYCOLLISION
        call ENTITYANIMATION
        

        skipentity:
        add si, 11
        pop cx
        loop EntityLoop
    
    ret
DRAWENTITY ENDP

ENTITYANIMATION PROC
    mov ax, 0
    MOV al, byte ptr [si + 10]  
    AND al, 0F0h           
    MOV CL, 4    ; Load shift count
    SHR AX, CL   
    cmp ax, 0
    je defaultEntity

    
    MOV BX, 15
    MOV AX, Frame  ; Load AX
CWD            ; Sign-extend AX into DX:AX (sets DX = 0 if AX is positive)
IDIV BX        ; Safe division

    CMP dx, 0
    JNL noneg
    NEG dx
    noneg:
    CMP dx, 8
    jle Frame1Entity
    jmp Frame2Entity
    
    Frame1Entity:

    push si
    mov si, [si + 4]
    call DRAWSPRITE
    pop si
    jmp exitEntityAnimation

    Frame2Entity:
    push si
    mov si, [si + 4]
    add si, 32 
    call DRAWSPRITE
    pop si
    jmp exitEntityAnimation

    defaultEntity:
    push si
    mov si, [si + 4]
    call DRAWSPRITE
    pop si
    jmp exitEntityAnimation

    exitEntityAnimation:

    ret    
ENTITYANIMATION ENDP

ENTITYUPDATE PROC
    mov al, [si + 10]
    TEST al, 00000001b  
    JZ NoMovement            

    TEST AL, 00000100b  
    JNZ MovePositive        
    JMP MoveNegative
    
    MovePositive:
        add word PTR [si + 6], 1
        mov bx, [si + 8]
        mov cx, [si + 6] 
        cmp bx, cx
        jl SwapSidePo
        jmp directionVe
        SwapSidePo:
        XOR BYTE PTR [si + 10], 00000100b  
        jmp directionVe

    MoveNegative:
        sub word PTR [si + 6], 1
        mov bx, [si + 8]
        mov cx, [si + 6] 
        neg bx
        cmp bx, cx
        jg SwapSideNe
        jmp directionVe
        SwapSideNe:
        XOR BYTE PTR [si + 10], 00000100b
        jmp directionVe
    
    directionVe:

    TEST AL, 00000010b
    JNZ MoveUp          
    JMP MoveDown        
  
    MoveDown:
        mov cx, [si + 6]
        add Obj_X, cx
        jmp NoMovement
    MoveUp:
        mov cx, [si + 6]
        add Obj_Y, cx
        jmp NoMovement
    NoMovement:

    ret
ENTITYUPDATE ENDP

ENTITYCOLLISION PROC
    
    mov ax, SYSRA_X
    sub ax, 6        
    mov bx, SYSRA_X
    add bx, 6        

    mov cx, Obj_X
    sub cx, 8        
    mov dx, Obj_X
    add dx, 8        

    cmp bx, cx        
    jl QuitCollisioncheck
    cmp ax, dx        
    jg QuitCollisioncheck

    
    mov ax, SYSRA_Y
    sub ax, 12       
    mov bx, SYSRA_Y  

    mov cx, Obj_Y
    sub cx, 10      
    mov dx, Obj_Y    

    
    cmp bx, cx        
    jl QuitCollisioncheck
    cmp ax, dx        
    jg QuitCollisioncheck
    
    mov PLAYERDEAD, 1

    QuitCollisioncheck:
    ret
ENTITYCOLLISION ENDP

SWAPVGABUFFER PROC
    push ds
    mov cx, 320 * 100  ; 64,000 pixels to copy
    mov si, 0          ; Start of buffer
    mov di, 0          ; Start of VGA memory

    mov ax, 0A000h     ; VGA memory segment
    mov es, ax         ; Set ES to VGA

    mov ax, FrameBuffer  ; Off-screen buffer segment
    mov ds, ax          ; Set DS to our buffer

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
            cmp cx, 10
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
        add bx, bx
        add bx, bx
        add SYSRA_Y, ax
        sub SYSRA_Y, bx

        cmp ax, 0
        jnz updateYvelocity
        jmp xcoll

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
            cmp cx, 8
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