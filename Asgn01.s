# Assignment 1
# @author Kirk Fay

	.data	# Data declaration section
Prompt1: .asciiz "Please enter a positive integer: "
ErrorMessage: .asciiz "Error! Not a positve integer! "
FinalMessage: .asciiz "\nHave a nice day "
PrimeMessage: .asciiz "\nThe number is prime! "
NotPrimeMessage: .asciiz "\nThe number is not prime! "
Space: .asciiz " "
	.text

main:		# Start of code section
	li $t1, 0
	li $t2, 0
	li $t3, 2
	
	li $v0, 4 #System call for print String
	la $a0, Prompt1 #Load address of Prompt1 into $a0
	syscall #Print the Prompt1 String
	
	li $v0, 5 #System call to read an integer
	syscall
	move $s0, $v0
	
	bgtz $s0, Factors
	
	li $v0, 4 #System call to print String
	la $a0, ErrorMessage #Load the address of ErrorMessage into $a0
	syscall
	
	
	
	#Quit the Program
	li $v0, 10
	syscall
	
	
	Factors:
	#move $t1, 
	addi $t1, $t1, 1
	bgt $t1, $s0, finish 
	div $s0, $t1
	mfhi $s2
	beqz $s2, eqzero
		b Factors
	eqzero: 
	addi $t2, $t2, 1
	li $v0, 1 #print out the factors
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, Space
	syscall
	b Factors
	
	finish:
	bne $t2, $t3, NotPrime
	li $v0, 4
	la $a0, PrimeMessage
	syscall
	li $v0, 4
	la $a0, FinalMessage
	syscall
	li $v0, 10
	syscall
	
	NotPrime:
	li $v0, 4
	la $a0, NotPrimeMessage
	syscall
	li $v0, 4
	la $a0, FinalMessage
	syscall
	li $v0, 10
	syscall
	

# END OF PROGRAM