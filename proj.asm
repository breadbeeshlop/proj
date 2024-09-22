IDEAL
MODEL small
P486
STACK 100h

DATASEG

CODESEG

start:
	mov ax, @data
	mov ds, ax

	mov ax, 13h
	int 10h
	mov ax, 0a000h
	mov es,ax
	mov dx,0
	mov bx,10
	S:
	mov cx,10
	add bx,dx
	mov di,10
	p:

	mov [byte es:bx], 15
	dec bx
	loop p
	add dx,320
	cmp di,0
	jne s 
exit:
	mov ax, 4c00h
	int 21h
END start
