##################################################################

#

#   Template for subassignment "Inbyggda System-mastern, här kommer jag!"

#

#   Author: Viola Söderlund <violaso@kth.se>

#

#   Created: 2020-10-25

#

#   See: MARS Syscall Sheet (https://courses.missouristate.edu/KenVollmar/mars/Help/SyscallHelp.html)

#   See: MIPS Documentation (https://ecs-network.serv.pacific.edu/ecpe-170/tutorials/mips-instruction-set)

#   See: Sieve of Eratosthenes (https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)

#

##################################################################



### Data Declaration Section ###



.data



primes:		.space  1000            # reserves a block of 1000 bytes in application memory

err_msg:	.asciiz "Invalid input! Expected integer n, where 1 < n < 1001.\n"



### Executable Code Section ###



.text



main:

    # get input

    li      $v0,5                   # set system call code to "read integer"

    syscall                         # read integer from standard input stream to $v0



    # validate input

    li 	    $t0,1001                # $t0 = 1001

    slt	    $t1,$v0,$t0		        # $t1 = input < 1001

    beq     $t1,$zero,invalid_input # if !(input < 1001), jump to invalid_input

    nop				    # null operation, jumps can run the next command so this stops it from doing something?

    li	    $t0,1                   # $t0 = 1

    slt     $t1,$t0,$v0		        # $t1 = 1 < input

    beq     $t1,$zero,invalid_input # if !(1 < input), jump to invalid_input

    nop 			    # null operation, jumps can run the next command so this stops it from doing something?

    

    # initialise primes array

    la	    $t0,primes              # $s1 = address of the first element in the array

    li 	    $t2,0		    # $t2 = 0

    li	    $t3,1		    # $t3 = 1
    
    move    $t4, $v0		    # $t4 = $v0, the inputted number
    
    
    sb	    $t3, ($t0)              # primes[0] = 1 (0 isn't prime)

    addi    $t0, $t0, 1             # increment pointer
    
    sb	    $t3, ($t0)              # primes[1] = 1 (1 isn't prime)

    addi    $t0, $t0, 1             # increment pointer
    
    addi    $t2, $t2, 2		    # add 2
    

init_loop:			    #the main loop that starts counting numbers. If the number is = 0, it's prime and continues, if it's 1, it's not prime and skips

    lb      $t7, 0($t0)		    # $t7 = 0 or 1, depending on what value is at address ($t0)
    beq     $t7, $t3, skip_loop	    # if $t7 = 1/is not a prime number, jump to skip_loop

    sb	    $zero, ($t0)              # primes[i] = 1
    
    jal     print_prime		    # jump to print_prime and then back
    
    move      $t5, $t2		    # $t5 = $t2, current number/count
    
    move      $t6, $t0		    # $t6 = $t0, copies the adress to $t6
    
    jal sieve_loop		    # jump to sieve_loop and back

    addi    $t0, $t0, 1             # increment pointer

    addi    $t2, $t2, 1             # increment counter
    
    bne     $t2, $t4, init_loop	    # loop back if the current number isn't equal to the inputted number
    
    nop				    # null operation, jumps can run the next command so this stops it from doing something?
    
    j       exit_program	    # jump to exit_program
    nop				    # null operation, jumps can run the next command so this stops it from doing something?
    
    

skip_loop:			    # routine to skip numbers that are already counted as not prime

    addi    $t0, $t0, 1		    # increment address
    
    addi    $t2, $t2, 1             # increment counter
    
    bne     $t2, $t4, init_loop     # jump back to loop if $t2 is not equal to the inputted number
    
    j       exit_program	    # jump to exit_program
    
    nop				    # null operation, jumps can run the next command so this stops it from doing something?

    ### Continue implementation of Sieve of Eratosthenes ###
sieve_loop:                         # second main loop, marks all multiples of a prime as non-prime

    add     $t5, $t5, $t2           # increment pointer

    add     $t6, $t6, $t2           # increment counter
    
    sb	    $t3, ($t6)              # primes[i] = 0
    
    ble     $t5, $t4, sieve_loop    # if $t5 is less than or equal $t4/the inputted number, keep looping
    
    jr $ra			    # jumps back to init_loop where this routine was called
    
    nop				    # null operation, jumps can run the next command so this stops it from doing something?


    ### Print nicely to output stream ###
print_prime:			    # routine to print the prime numbers as it calculates them

    li $v0, 1			    # $v0 = 1, print number
    move $a0, $t2		    # $a0 = $t2,number to output is current count/prime number
    
    syscall			    # run the operation in $v0
    
    li $v0, 11			    # $v0 = 11. print character
    li $a0, 10			    # $a0 = 10, newline character
    
    syscall			    # run the operation in $v0
    
    jr $ra			    # jump back to init_loop where this routine was called
    
    nop  			    # null operation, jumps can run the next command so this stops it from doing something?


    # exit program

    j       exit_program	    # jump to exit_program

    nop				    # null operation, jumps can run the next command so this stops it from doing something?



invalid_input:			    # routine to tell the user their input wasn't valid

    # print error message

    li      $v0, 4                  # set system call code "print string"

    la      $a0, err_msg            # load address of string err_msg into the system call argument registry

    syscall                         # print the message to standard output stream



exit_program:

    # exit program

    li $v0, 10                      # set system call code to "terminate program"

    syscall                         # exit program
