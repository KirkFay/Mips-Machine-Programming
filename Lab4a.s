# Kirk Fay

	.data	# Data declaration section
WelcomePrompt: .asciiz "\n This program will check for the following bit strings: 0xaaaaaaaa and 0x24924924\n"
Prompt1: .asciiz "\n Initial Set: "
IntersectionPrompt: .asciiz "\n Intersection of the sets: \n"
UnionPrompt: .asciiz "\n Union of the sets: "
EndPrompt: .asciiz "Have a nice day. Exitting..."
NotSpace: .asciiz " "
in: .asciiz "\n 20 is in the set "
isntin: .asciiz "\n 20 is not in the set"

check1: .asciiz "\n Checking for element 20 in set 1 \n"
check2: .asciiz "\n Checking for element 20 in set 2 \n"
	.text

main:		# Start of code section
li $s7, 20
la $s6, union
la $s4, intersection
li $s0, 32
li $s1, 1
li $s2, 0xaaaaaaaa
li $s3, 0x24924924
li $v0, 4 #System call code for print String
la $a0, WelcomePrompt #Load the input prompt
syscall #Print the String
	move $t3, $s2

	jal print
	move $t3, $s3
	jal print #second is jump to first is where saved

	li $v0, 4 #System call code for print String
	la $a0, IntersectionPrompt #Load the input prompt
	syscall #Print the String
	jalr $s5, $s4
	move $t3, $t4
	jal print
	li $v0, 4 #System call code for print String
	la $a0, UnionPrompt #Load the input prompt
	syscall #Print the String
	jalr $s5, $s6
	move $t3, $t4
	jal print

	j ElementCheck

	#j done

print:

li $t0, 1
li $t1, 0x1
 while:
	#Start Checking the Bit String

	and $t2, $t1, $t3 #and with mask

	bnez $t2, output
 print2:

	sll $t1, $t1, 1   #Load the bit String that corresponds with the loops counter
	addi $t0, $t0, 1 #increment the counter
	ble $t0, $s0, while #Check to see if $t0 is greater than 32

	jr $ra #jump to $s5



output:
	li $v0, 1
	move $a0, $t0 #print the counter
	syscall

	li $v0, 4 #call to print String
	la $a0, NotSpace
	syscall

	j print2 #jump to print 2

intersection:
	and $t4, $s2, $s3 #and the sets to find intersection and store into $t4
	j $s5
union:
	or $t4, $s2, $s3
	j $s5

ElementCheck:

	li $t1, 0x1 #load in the mask

	addi $t5, $s7, -1
	sllv $t1, $t1, $t5 #shift by the

	and $t6, $s2, $t1
	and $t7, $s3, $t1
	li $v0, 4
	la $a0, check1 #Print the first check propmt
	syscall
	li $t8, 0
	bnez $t6, isIn

	j notIn

elementCheck2:
	addi $t8, $t8, 1
	li $v0, 4
	la $a0, check2 #Print the second check prompt
 	syscall

	bnez $t7, isIn

	j notIn
isIn:
	li $v0, 4
	la $a0, in
	syscall
	beqz $t8, elementCheck2
		j done

notIn:
	li $v0, 4
	la $a0, isntin
	syscall
	beqz $t8, elementCheck2

	j done
done:

li $v0, 4
la $a0, EndPrompt
syscall
#Quit the program
li $v0, 10
syscall
