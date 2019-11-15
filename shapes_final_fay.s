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
Prompt7: .asciiz "\n Area of Rectangle: "
MenuPrompt: .asciiz "\n To quit enter 0 \n To calculate the area of a circle enter 1 \n To calculate the area of a square enter 2 \n To calculate the area of a rectangle enter 3 \n"
QuitPrompt: .asciiz "\n Have a nice day!"
	.globl main
	.text

main:		# Start of code section
	#User Menu: 0 - quit; 1 - circle; 2 - square; 3- rectangle
	
	li $v0, 4 #System call code for print String
	la $a0, MenuPrompt #Load address of the menu prompt into $a0
	syscall #Reads the value for MenuPrompt
	
	li $v0, 5 #System call code to read in an integer
	syscall
	move $s3, $v0
	
	#Branch conditions to check against
	li $s4, 1
	li $s5, 2
	li $s6, 3
	li $s7, 0
	
	bne $s7, $s3, Circle
	
	#Quit
	li $v0, 4 #System call code for print String
	la $a0, QuitPrompt #Load address of the quit prompt into $a0
	syscall #Reads the value for MenuPrompt
	
	#Quit the program
	li $v0, 10
	syscall	
	
	Circle: 
	
	bne $s4, $s3, Square
		

	li $v0, 4 #System call code for Print String
	la $a0, Prompt1 #Load address of the first prompt into $a0
	syscall #Print the first prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x1
	
	
	move $t0, $v0 #Move $v0 into $t0
	
	
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt2 #Load address of the second prompt into $a0
	syscall #Print the second prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y1
	
	move $t1, $v0 #Move $v0 into $t1
	
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt3 #Load address of the third prompt into $a0
	syscall #Print the third prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x2
	
	move $t2, $v0 #Move $v0 into $t2
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt4 #Load address of the fourth prompt into $a0
	syscall #Print the fourth prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y2
	move $t3, $v0 #Move $v0 into $t3
		
	
	#Beginning of Calculations
	sub $t4, $t2, $t0 #subtract to find the x-value
	sub $t5, $t3, $t1 #subtract to find the y-value
	
	
	mult $t4,$t4 #square the x-value
	mflo $t6 #Load the current LO into t5 (x squared value)
	
	mult $t5, $t5 #square the y-value
	mflo $t7 # Load the current LO into t7 (y squared value)
	
	add $t9, $t6, $t7 #add both the squared values
		
	li $t8, 314156 #Load pi into t8
	mult $t9, $t8 #multiply by pi
	mflo $t0
	
	li $t1, 100000
	div $t0, $t1
	mflo $s0
	
	#Print out results for Circle
	li $v0, 4 #System call code for Print String
	la $a0, Prompt5 #Load address of the fifth prompt into $a0
	syscall #Print the fifth prompt
	li $v0, 1 #print out the value
	move $a0, $s0
	syscall
	
	#Quit the program
	li $v0, 10
	syscall	
	
	Square: 
	
	bne $s3, $s5, Rectangle
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt1 #Load address of the first prompt into $a0
	syscall #Print the first prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x1
	
	move $t0, $v0 #Move $v0 into $t0

	li $v0, 4 #System call code for Print String
	la $a0, Prompt2 #Load address of the second prompt into $a0
	syscall #Print the second prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y1
	
	move $t1, $v0 #Move $v0 into $t1
	
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt3 #Load address of the third prompt into $a0
	syscall #Print the third prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x2
	
	move $t2, $v0 #Move $v0 into $t2
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt4 #Load address of the fourth prompt into $a0
	syscall #Print the fourth prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y2
	move $t3, $v0 #Move $v0 into $t3
		
	
	#Beginning of Calculations
	sub $t4, $t2, $t0 #subtract to find the x-value
	sub $t5, $t3, $t1 #subtract to find the y-value
	
	
	mult $t4,$t4 #square the x-value
	mflo $t6 #Load the current LO into t5 (x squared value)
	
	mult $t5, $t5 #square the y-value
	mflo $t7 # Load the current LO into t7 (y squared value)
	
	add $t9, $t6, $t7 #add both the squared values
	
	move $s1, $t9

	#Print out results for square
	li $v0, 4 #System call code for Print String
	la $a0, Prompt6 #Load address of the sixth prompt into $a0
	syscall #Print the sixth prompt
	li $v0, 1 #print out the value
	move $a0, $s1
	syscall
	
	#Quit the program
	li $v0, 10
	syscall	
	
	Rectangle: 
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt1 #Load address of the first prompt into $a0
	syscall #Print the first prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x1
	
	#li $t0, 0 #clear register $t0 to 0
	move $t0, $v0 #Move $v0 into $t0
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt2 #Load address of the second prompt into $a0
	syscall #Print the second prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y1
	
	move $t1, $v0 #Move $v0 into $t1
	
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt3 #Load address of the third prompt into $a0
	syscall #Print the third prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of x2
	
	move $t2, $v0 #Move $v0 into $t2
	
	li $v0, 4 #System call code for Print String
	la $a0, Prompt4 #Load address of the fourth prompt into $a0
	syscall #Print the fourth prompt
	
	li $v0, 5 #System call code for Read Integer
	syscall #Reads the value of y2
	move $t3, $v0 #Move $v0 into $t3
		
	
	#Beginning of Calculations
	sub $t4, $t2, $t0 #subtract to find the x-value
	sub $t5, $t3, $t1 #subtract to find the y-value
	
	
	mult $t4,$t4 #square the x-value
	mflo $t6 #Load the current LO into t5 (x squared value)
	
	mult $t5, $t5 #square the y-value
	mflo $t7 # Load the current LO into t7 (y squared value)
	
	add $t9, $t6, $t7 #add both the squared values
	
	#Beginning of Rectangle area calculation

	mult $t4, $t5
	mflo $s2
		
	#Print out results for Rectangle
	li $v0, 4 #System call code for Print String
	la $a0, Prompt7 #Load address of the seventh prompt into $a0
	syscall #Print the seventh prompt
	li $v0, 1 #print out the value
	move $a0, $s2
	syscall
	
	#Quit the program
	li $v0, 10
	syscall	
	
# END OF PROGRAM