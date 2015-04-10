/*Elizabeth Harris
Lab5
Section 4: Tues/Thurs 9-11
11/24/2014
*/

.ent getDelay
.text
.global getDelay
getDelay:

# PART 3
# put PC counter $ra, on stack so we can exit
# Decrement stack pointer by 4
addi $sp, $sp, -4
# Save $ra to stack
sw $ra, 0($sp) 


# PART 3
# print out hello world! and the count
# load "hello world!" into $a0 to print
la $a0, hello
# load the count variable which starts at 1 to print
lw $a1, count
# print hello world in a0 + the count in a1 to console
jal printf
nop

# PART 3
# incrament the count and store back into variable
# load the count into temporary register $t1
lw $t1, count
# add one to $t1 to incrament the count
addi $t1, $t1, 1
# store the new incramented count back into the variable count
sw $t1, count


# PART 3
# take PC counter $ra off stack so we can return
# load PC from the stack into register $ra
lw $ra, 0($sp)
# add 4 to the stack to reinitialize it
addi $sp, $sp, 4

# PART 4
# get the input from the switches, put into temporary register
lw $t1, PORTD
# shift the word input 8 bits so that the 4 registers that hold the switches
# are in the lower 4 bits
sra $t2,$t1, 8
# load the delay x80000 x 2, #1048576 into temporary register
lw $t3, delay
# multiply the delay and the word with the switch input in lower 4-bits.
mul $t2, $t2, $t3
# Since the new word that is multiplied is stored the LO register
# this operation loads LO into the output register $v0
MFLO $v0



# load delay 0x80000 into v0 to output delay
# this was used in PART 3
# lw $v0, delay

# return from the subroutine
jr $ra
nop 
.end getDelay



# data and labels used in above code
.data
delay: .word 1048576
hello: .asciiz "Hello, world!%d\n"
count: .word 1



