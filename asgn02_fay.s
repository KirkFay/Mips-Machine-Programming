# Kirk Fay

	.data	# Data declaration section
StringPrompt1: .asciiz "\nString1: "
StringPrompt2: .asciiz "\nString2: "
PositionPrompt: .asciiz "\nPosition: "
	.text

main:		# Start of code section

	#Prompt for the first string and store it
	li $v0, 4 # Syscall to Print String
	la $a0, StringPrompt1 #Load the prompt for the first String
	syscall #Print the prompt

	li $v0, 9 #take in the user's String
	la $a0, 80 #allocate memory for the String
	syscall

	move $s1, $v0
	move $t1, $s1

	#read in the first String
	li $v0, 8 #syscall to read String
	move $a0, $t1
	li $a1, 80
	syscall

	#Prompt for the second String and store it
	li $v0, 4 #Syscall to Print String
	la $a0, StringPrompt2 #Load in the prompt for the second String
	syscall #Print the prompt

	li $v0, 9 #take in the user's String
	la $a0, 80 #allocate memory for the String
	syscall
	move $s2, $v0
	move $t2, $s2

	#read in the second String
	li $v0, 8 #syscall to read String
	move $a0, $t2
	li $a1, 80
	syscall

	#load the character for ENTER
	li $s3, 10

	#set the pointer for the first String
	lb $t3,0($t1) #pointer first element array of String
	#set the pointer for the second String
	lb $t4,0($t2)
	#check
	beq $t3, $s3, notSubString
	beq $t4, $s3, notSubString

	#load the counter
	li $t5, 0


Position:
	li $v0, 4
	la $a0, PositionPrompt #print the position prompt
	syscall

	jal Loop

	j Quit

Loop:
	bne $t3, $t4, After

	addi $t2, $t2, 1 #increment the pointer for the second string
	lb $t4, 0($t2)
	beq $t4, $s3, isSubString

	addi $t1, $t1, 1
	lb $t3, 0($t1)
	beq $t3, $s3, notSubString

	b Loop

After:
	addi $t5, $t5, 1 #increment the counter
	move $t2, $s2 #reset the pointer
	addi $t1, $t1, 1 #increment the pointer for the first String

	lb $t3, 0($t1)
	lb $t4, 0($t2)

	beq $t3, $s3, notSubString

	j Loop


isSubString:
	li $v0, 1
	move $a0, $t5 #print out the counter
	syscall

	jr $ra

notSubString:
	li $v0, 1
	li $a0, -1 #prints negative 1 if not SubString
	syscall

	jr $ra


Quit:
	li $v0, 10
	syscall




# END OF PROGRAM
