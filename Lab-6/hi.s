
#include <WProgram.h>

/* define all global symbols here */
.global T1Setup
.global T1Stop
.global T1Start
.global milliseconds

.text
.set noreorder

/*********************************************************************
 * Start Timer 1
 ********************************************************************/
.ent T1Start
T1Start:

.end T1Start

/*********************************************************************
 * Stop Timer 1
 ********************************************************************/
.ent T1Stop
T1Stop:

.end T1Stop


/*********************************************************************
 * Setup Timer 1 and interrupts (called it once)
 ********************************************************************/
.ent T1Setup
T1Setup:
# Clear TICON
li $t0, 0x0000
la $t1, T1CON
sw $t0, 0($t1)

# Set TIPCKPS
li $t0, 0x0030
la $t1, T1CON
sw $t0, 8($t0)

# Clear TMRI
li $t0, 0x0000
la $t1, TMR1
sw $t0, 0($t2)

# Set PRI
lw $t0, periodreg
sw $t0, PR1

# Set T1IP
li $t0, 0x0010
la $t1, IPC1
sw $t0, 8($t1)

# Clear T1IF
li $t0, 0x0010
la $t1, IFS0
sw $t0, 4($t1)

# Enable interupts
li $t0, 0x0010
la $t1, IEC0
sw $t0, 8($t1)

jr $ra
.end T1Setup


/*********************************************************************
 * This is your ISR implementation. It is called from the vector table jump.
 ********************************************************************/
T1_ISR:
#inrament milliseconds by 100 which is what we set time 
lw $t0, milliseconds
li $t1, 100
add $t1, $t1, $t0
sw $t1, milliseconds



	
/*********************************************************************
 * This is the actual interrupt handler that gets installed
 * in the interrupt vector table. It jumps to the T1 timer
 * interrupt handler function.
 ********************************************************************/
.section .vector_4, code
	j T1_ISR
	nop


.data
milliseconds: .word 0
periodreg: .float 7812.5
count: .word 0