.text

multiply:				# the start/initializing before going into the loop of addition to simulate multiplication

	li $t0,0			# $t0 = 0
	li $t1,0			# $t1 = 0
	move $t2,$a0			# $t2 = $a0, assuming it's the first inputted parameter
	move $t3,$a1			# $t3 = $a1, assuming it's the second inputted parameter
	j multiply_loop			# jump to multiply_loop

multiply_loop:				# the actual loop where the second number $t3 gets addedd $t2 timmes to simulate/calculate a multiplication

	add $t1,$t1,$t3			# $t1 += $t3, keep adding the second number
	addi $t0,$t0,1			# $t0 += 1, keep incrementing $0 by 1
	beq $t0,$t2, multiply_end	# if $t0 = $t2, if you have added the second number $t2 times (the first number), then jump to multiply_end
	j multiply_loop			# keep looping
	
	
multiply_end: 				# routine to put the result of the multiplication into the function return register and jump back to wherever this function was called from

	move $v0, $t1			# $v0 = $t1, the product of the mutliplication is put into the function return register
	jr $ra				# jump back to where this was called from
	
faculty: 				# the start/initializing before going into the loop of multiplication to simulate faculty

	move $t4, $a0			# $t4 = $a0, assuming it's the inputted number
	li $t5,1			# $t5 = 1
	
	addi $sp, $sp, -4		# decrement the stack pointer to put the orriginal return address on there
	sw $ra, 0($sp)			# put the original stack pointer in the return adddress
	
	move $a1, $t5			# $a1 = $t5, $a1 = 1
	
	
	j faculty_loop			# jump to faculty_loop
	
	
faculty_loop:				# the actual loop where the number $t5 (1) gets multiplied by $t4, then $t4 -1, ..., 1 to simulate/calculate a faculty operation

	ble $t4, 1, faculty_end		# if $t4 is equal to or less than 1, jump to faculty_end
	jal multiply			# jump to multiply and return, $v0 is changed to the product of $t5 and $t4
	move $t5, $v0			# $t5 = $v0, $t5 = the product of itself and $t4
	addi $t4, $t4, -1		# decrement $t4 by 1
	move $a0, $t4			# $a0 = $t4, the current number that multiplies into the total
	move $a1, $t5			# $a1 = $t5, the current total
	j faculty_loop			# keep looping
	
faculty_end:				# routine to put the result of the faculty into the function return register and jump back to wherever this function was called from

	move $v0, $t5			# $v0 = $t5, the result of faculty is put into the function return register
	
	lw $ra, 0($sp)			# loads back the original return address from stack pointer
	addi $sp, $sp, 4		# increases stack pointer address back to what it was
	jr $ra				# jump back into what called this routine in the first place
