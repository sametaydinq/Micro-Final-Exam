include 'emu8086.inc'

;Student Number -> 2020555013
;Student Name and Surname -> Abdulsamet Aydın   
;Github Username  -> sametaydinq
.code 
student_No db ' 2020555013'

mov di, offset student_No


mov bx, -1
mov cx, 11
call sendMemory
  
 
  
mov cx, 11
mov bx, 200h
mov es, bx
mov di, 2000h
call moveMemory

mov al, byte ptr [2006h]
cmp al, '6'
jne mornings
jmp evening

mornings:
mov ah, 0eh
mov al,' '
int 10h
mov al, 'M'
int 10h
mov al, 'o'
int 10h
mov al, 'r'
int 10h
mov al, 'n'
int 10h
mov al, 'i'
int 10h
mov al, 'n'
int 10h
mov al, 'g'
int 10h
jmp exit
     
evening:
mov ah, 0eh
mov al,' '
int 10h
mov al, 'E'
int 10h
mov al, 'v'
int 10h
mov al, 'e'
int 10h
mov al, 'n'
int 10h
mov al, 'i'
int 10h
mov al, 'n'
int 10h
mov al, 'g'
int 10h 
jmp exit

exit:
ret

sendMemory proc 
    
    mov al, [di]
    mov [2000h+bx],al
    
    mov ah, 0eh
    int 10h
    inc di
    inc bx
    loop sendMemory
    ret
sendMemory endp

moveMemory proc
    rep movsb
    ret
moveMemory endp

end
