STACK SEGMENT PARA STACK
    DW 64 DUP (?)   
STACK ENDS

DATA SEGMENT PARA 'DATA'
    ;Game
    LastTimeD DW 0
    Frame DW 0

    ;Player
    SYSRA_X DW 50
    SYSRA_Y DW 176

    IDLE DW 0h, 0h, 0h, 810h, 810h, 1818h, 1818h, 0BD0h, 17E8h, 7E0h, 0DB0h, 0DB0h, 366Ch, 37ECh, 7E0h, 810h

    RUN1 DW 0h, 0h, 0h, 810h, 810h, 1818h, 1818h, 0BD0h, 17E8h, 7E0h, 0ED0h, 0ED0h, 3734h, 37E4h, 7D0h, 810h
    RUN2 DW 0h, 0h, 810h, 810h, 1818h, 1818h, 0BD0h, 17E8h, 7E0h, 0ED0h, 0ED0h, 3734h, 37E4h, 300h, 1B0h, 0h

    ;Sprite Renderer
    Obj_X DW 0
    Obj_Y DW 0

    Siz DW 16

    TILEMAP DW 08h
    
    SPRITEPOINTERX DW 0
    SPRITEPOINTERY DW 0
    AUXSPRITE DW 0            
    
    BOXA DW 0h, 3FFCh, 4002h, 500Ah, 4002h, 4002h, 4002h, 4002h, 4002h, 4002h, 4002h, 4002h, 500Ah, 4002h, 3FFCh, 0h    
    GROUNDTILE DW 0FFFFh, 0h, 0FFFFh, 5555h, 0AAAAh, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h, 0h

    
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


    LEVEL DW 0FFF0h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 08010h, 0FFF0h
    TILES DW OFFSET BRC, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT, OFFSET RIGHT
        DW OFFSET RIGHT, OFFSET TRC, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
        DW OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP, OFFSET TOP
        DW OFFSET BLC, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT, OFFSET LEFT
        DW OFFSET LEFT, OFFSET TLC

    
    TILEPOINTERX DW 0
    TILEPOINTERY DW 0

    AUXMAP DW 0


DATA ENDS

CODE SEGMENT PARA 'CODE'

MAIN PROC FAR

    ASSUME CS:CODE, DS:DATA, SS:STACK    
    MOV AX, DATA                         
    MOV DS, AX                                                          
    
    
    GameLoop:
        inc Frame
        mov ah, 00h   
        int 1Ah       
        mov LastTimeD, dx
    
    call RESET
    call INPUT
    call UPDATE
    call TILEMAPEDITOR
    ;call DRAWTILE
    call ANIMATION

    ;ADD SYSRA_X, 3

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
    MOV AH, 00h                          ; set the configuration to video mode
    MOV AL, 13h                          ; choose the video mode
    INT 10h                              ; execute the configuration

    MOV AH, 0Bh                          ; set the configuration
    MOV BH, 00h                          ; to the background color
    MOV BL, 00h                          ; choose black as background color
    INT 10h                              ; execute the configuration

    MOV AH, 0Ch                          ; set the configuration to writing a pixel
    MOV AL, 0Fh                          ; choose white as color
    MOV BH, 00h                          ; set the page number
    

    RET
RESET ENDP

INPUT PROC
    mov ah, 01h   
    int 16h       

    jz done
    mov ah, 00h   
    int 16h       
    
    cmp al, 061h    
    je left_arrow  

    cmp al, 064h    
    je right_arrow

    jmp clear_buffer

    left_arrow:
        sub SYSRA_X, 3
        jmp clear_buffer
    right_arrow:
        add SYSRA_X, 3 
        jmp clear_buffer

    clear_buffer:
        mov ah, 01h      
        int 16h
        jz done          
        mov ah, 00h      
        int 16h
        jmp clear_buffer 

    done:

    RET
Input ENDP

UPDATE PROC
    RET    
UPDATE ENDP

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
            add dx, SPRITEPOINTERY

            MOV AH, 0Ch                          
            MOV AL, 0Fh                          
            MOV BH, 00h                          
            int 10h

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

    mov ax, SYSRA_X
    mov bx, 320
    cmp ax, bx
    jle jump
    mov SYSRA_X, 0 

    jump:
    mov SYSRA_Y, 176
    mov ax, SYSRA_X
    mov Obj_X, ax
    mov ax, SYSRA_Y

    mov Obj_Y, ax
    mov ax, Frame
    mov dx, 0        ; Clear DX before division
    mov bx, 6
    div bx           ; AX = Frame / 3, DX = Frame % 3


    cmp dx, 3
    jl Frame1

    cmp dx, 6
    jle Frame2

    DefaultFrame:
        lea si, IDLE
        call DRAWSPRITE
        jmp QuitFrame

    Frame1:
        lea si, RUN1
        call DRAWSPRITE
        jmp QuitFrame

    Frame2:
        lea si, RUN2
        call DRAWSPRITE
        jmp QuitFrame


    QuitFrame:

    RET 
ANIMATION ENDP

DRAWTILE PROC
    mov cx, 12
    mov TILEMAP, 8
    Tile:
        push cx
        lea si, TOP
        mov ax, TILEMAP
        mov Obj_X, 8
        mov Obj_Y, ax
        call DRAWSPRITE
        add TILEMAP, 16
        pop cx
    loop Tile
    ret    
DRAWTILE ENDP


TILEMAPEDITOR PROC
    lea si, LEVEL
    mov ax, 0
    mov bx, 0
    mov dx, 0
    mov cx, 20
    mov TILEPOINTERX, 0
    mov TILEPOINTERY, 0
    mov TILEINDEX, 0
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
            mov bx, AUXMAP        
            test bx, 8000h  
            jz zero1

            mov ax, TILEPOINTERX
            mov bx, 16
            mul bl
            add ax, 8
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
            lea si, LEVEL
            inc TILEPOINTERY

            pop cx
        loop TILECOL
    skipRow1:
    inc TILEPOINTERX
    mov TILEPOINTERY, 0
    pop cx
    loop TILEROW
    
    RET
TILEMAPEDITOR ENDP


CODE ENDS
END MAIN

hlt