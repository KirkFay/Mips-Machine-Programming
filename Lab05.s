# Kirk Fay

	.data	# Data declaration section
Alphabet: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
OutputString: .asciiz ""
OutputPrompt: .asciiz "The decoded ASCII output is: "
EncodePrompt: .asciiz "The Base 64 encoded data was: "
InputPrompt: .asciiz "Please enter the encoded data: "
newLine: .asciiz "\n"

	.text

main:		# Start of code section


	la $s4, Alphabet # Load the CharacterMap into a register
	#Take in the user's String

	#Allocate memory for the input String
	li $v0, 9
	la $a0, 80
	syscall

	move $t1, $v0
	move $s1, $t1




	#Allocate memory for the output String
	li $v0, 9
	la $a0, 80
	syscall

	move $s7, $v0
	move $t9, $s7 #move the pointer



	li $s2, 10 #Load in the Enter Key
	#li $s3, 0 #Load in the counter

Input:
	li $v0, 4
	la $a0, InputPrompt #Throw the prompt
	syscall

	#Read in the String
	li $v0, 8
	move $a0, $t1
	li $a1, 80
	syscall
	#Enter an new line
	li $v0, 4
	la $a0, newLine
	syscall
	#Print the encode prompt
	li $v0, 4
	la $a0, EncodePrompt
	syscall
	move $a0, $s1
	syscall
	lb $t2, 0($t1)

	beq $t2, $s2, Quit


Loop:

	lb $t3, 1($t1)

	lb $t4, 2($t1) #Load in the next 3 bytes

	lb $t5, 3($t1)

	move $s5, $t2 #Move the first character into a register

	jal getValue
	sb $s3, 0($t1)
	addi $t1, $t1, 1 #Increment the pointer

	move $s5, $t3

	jal getValue
	sb $s3, 0($t1)
	addi $t1, $t1, 1 #Increment the pointer

	move $s5, $t4

	jal getValue
	sb $s3, 0($t1)
	addi $t1, $t1, 1 #Increment the pointer

	move $s5, $t5
	jal getValue
	sb $s3, 0($t1)


	addi $t1, $t1, -3
	lb $t2, 0($t1)
	addi $t1, $t1, 1

	lb $t3, 0($t1)
	addi $t1, $t1, 1

	lb $t4, 0($t1)
	addi $t1, $t1, 1

	lb $t5, 0($t1)
	#addi $t1, $t1, 1

	sll $t2, $t2, 2
	srl $t7, $t3, 4

	or $t2, $t2, $t7
	sll $t3, $t3, 4
	srl $t7, $t4, 2

	or $t3, $t7, $t3

	sll $t4, $t4, 6

	or $t4, $t4, $t5

	sb $t2, 0($t9)
	addi $t9, $t9, 1

	sb $t3, 0($t9)
	addi $t9, $t9, 1

	sb $t4, 0($t9)
	addi $t9, $t9, 1

	addi $t1, $t1, 1
	lb $t2, 0($t1)

	beq $s2, $t2, Output

	b Loop

getValue:
	li $s3, 0 #Set the counter = 0
	move $t6, $s4
	lb $s6, 0($t6) #Load in the first Character of the CharacterMap

WhileLoop:
	beq $s5, $s6, Return
	addi $s3, $s3, 1 #Increment the counter
	addi $t6, $t6, 1 #Increment the pointer
	lb $s6, 0($t6) #Load in the next byte
	b WhileLoop


Return: jr $ra

Output:
	#print the output prompt
	li $v0, 4
	la $a0, OutputPrompt
	syscall

	move $a0, $s7
	syscall
	#print a newLine
	li $v0, 4
	la $a0, newLine
	syscall

	move $t1, $s1
	move $t9, $s7
	b Input



Quit:
	li $v0, 10
	syscall
# END OF PROGRAM
