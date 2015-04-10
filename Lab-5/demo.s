/*Elizabeth Harris
Lab5 Part 1
Section 4: Tues/Thurs 9-11
*/

.ent getDelay
.text
.global getDelay
getDelay:

# put PC counter $ra, on stack so we can exit
/* addi $sp, $sp, -4 # Decrement stack pointer by 4
sw $ra, 0($sp) # Save $s3 to stack



# print out hello world! and the count
la $a0, hello
lw $a1, count
jal printf
nop

# incrament the count and store back into variable
lw $t1, count
addi $t1, $t1, 1
sw $t1, count



# take PC counter $ra off stack so we can return
lw $ra, 0($sp)
addi $sp, $sp, 4


# load delay 0x80000 into v0 to output delay
lw $v0, delay

jr $ra
nop */
.end getDelay



.data
delay: .word 524288
hello: .asciiz "Hello, world!%d\n"
count: .word 1
