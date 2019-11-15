##############################################
# Program Name: Shapes
# Programmer: (Kirk Fay)
# Date (1/29/18)
#############################################

	.data	# Data declaration section
Prompt1: .asciiz "\n Please enter the first x-coordinate(x1): "
Prompt2: .asciiz "\n Please enter the first y-coordinate(y1): "
Prompt3: .asciiz "\n Please enter the second x-coordinate(x2): "
Prompt4: .asciiz "\n Please enter the second y-coordinate(y2): "
Prompt5: .asciiz "\n Area of Circle: "
Prompt6: .asciiz "\n Area of Square: "
	.globl main
	.text

main:		# Start of code section
	li $v0, 4 #System call code for Print String
	la $a0, Prompt1 #Load address of the first prompt into $a0
	syscall #Print the first prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x1
	
	li $t0, 0 #clear register $t0 to 0
	move $t0, $v0 #Move $v0 into $t0
	
	
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt2 #Load address of the second prompt into $a0
	syscall #Print the first prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y1
	
	#li $t0, 0 #clear register $t0 to 0
	move $t1, $v0 #Move $v0 into $t1
	
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt3 #Load address of the third prompt into $a0
	syscall #Print the first prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x2
	
	#li $t0, 0 #clear register $t0 to 0
	move $t2, $v0 #Move $v0 into $t2
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt4 #Load address of the fourth prompt into $a0
	syscall #Print the fourth prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y2
	
	#li $t3, 0 #clear register $t0 to 0
	move $t3, $v0 #Move $v0 into $t3
	
	sub $t4, $t2, $t0 #subtract to find the x-value
	sub $t5, $t3, $t1 #subtract to find the y-value
	
	
	mult $t4,$t4 #square the x-value
	mflo $t5 #Load the current LO into t6
	
	mult $t5, $t5 #square the y-value
	mflo $t7
	
	add $t9, $t4, $t5 #add both the squared values
	
	
	
	#li $t8, 314156 #Load pi into t8
	#mult $t9, $t8 #multiply by pi
	#mflo $t0
	
	li $t1, 2
	#div $t0, $t1
	mult $t9, $t1
	mflo $t2
	li $v0, 4 #System call code for Print String
	la $a0, Prompt5 #Load address of the fifth prompt into $a0
	syscall #Print the fifth prompt
	li $v0, 1 #print out the value
	move $a0, $t2
	syscall
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
# END OF PROGRAM