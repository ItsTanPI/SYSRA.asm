    masm Game.asm;
link Game.obj
nasm Keyboard.asm -o Keyboard.obj -f obj
tcc -c -IC:\TURBOC3\INCLUDE -LC:\TURBOC3\LIB SYSRA.c
tlink SYSRA.obj Game.obj keyboard.obj, SYSRA.exe, Game.map, C:\TURBOC3\LIB\C0S.OBJ C:\TURBOC3\LIB\CS.LIB
SYSRA.exe