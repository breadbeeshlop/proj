IDEAL
MODEL small
P486
STACK 100h

DATASEG

CODESEG
proc tile
	pusha
	mov ax,320*8
	mul si
	mov si,ax
	shl bx,3
	add bx,8
	mov ax, 30
	A:
		
		mov cx,8
		sub bx,8
	B:
		mov [byte es:bx+si],15
		inc bx
		loop B
	inc dx 
	cmp dx,8 
	je ET
	add si,320
	jmp A
	ET:
		popa
		ret 
endp


start:
	mov ax, @data
	mov ds, ax

	mov ax, 13h
	int 10h
	mov ax, 0a000h
	mov es, ax
	
	mov bx,1
	mov si,0
	call tile 


	w:
	jmp w
exit:
	mov ax, 4c00h
	int 21h
END start
