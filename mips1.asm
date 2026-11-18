.data
msg1:   .asciiz "Digite o numero de termos (n > 0): "
msgerr: .asciiz "Valor invalido! n deve ser maior que zero.\n"
msgH:   .asciiz "H = "

.text
leitura:
    li  $v0, 4
    la  $a0, msg1
    syscall                     

    li  $v0, 5
    syscall                     
    add $t0, $v0, $zero         

    bgt $t0, $zero, calcula     

    li  $v0, 4
    la  $a0, msgerr
    syscall                     
    j   leitura                 


calcula:
    li  $t1, 1                  
    li  $t2, 0                
    li  $t4, 4                 


laco:
    bgt $t1, $t0, fim           

    add $t3, $t1, $t1           
    addi $t3, $t3, -1          
    add $t5, $t1, $t1          

    mul $t6, $t3, $t4          
    sub $t6, $t6, $t5           
    add $t2, $t2, $t6           

    addi $t1, $t1, 1            
    j   laco


fim:
    li  $v0, 4
    la  $a0, msgH
    syscall                     

    li  $v0, 1
    add $a0, $t2, $zero
    syscall                      

    li  $v0, 10
    syscall                    
