##############################################################################
# Example: Displaying Pixels
#
# This file demonstrates how to draw pixels with different colours to the
# bitmap display.
##############################################################################
######################## Bitmap Display Configuration ########################
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
##############################################################################
    .data
virus_positions: .space 512  # 64 viruses * 2 positions (X, Y) * 4 bytes each
virus_colors:    .space 256  # 64 viruses * 1 color * 4 bytes each
ADDR_KBRD: .word 0xffff0000 
ADDR_DSPL:
    .word 0x10008000
    .text
	.globl main
main:
    li $t1, 0xff0000        # $t1 = red
    li $t2, 0x00ff00        # $t2 = green
    li $t3, 0x0000ff        # $t3 = blue
    li $t4, 0x808080        # $t4 = grey
    li $t5, 4               # $t5 = 4
    li $t6, 0xffff00        # $t6 = yellow
    lw $t0, ADDR_DSPL       # $t0 = base address for display
    # neck of the bottle
    sw $t4, 432($t0)
    sw $t4, 420($t0)
    #top of the bottle
    sw $t4, 516($t0)
    sw $t4, 520($t0)
    sw $t4, 524($t0)
    sw $t4, 528($t0)
    sw $t4, 532($t0)
    sw $t4, 536($t0)
    sw $t4, 540($t0)
    sw $t4, 544($t0)
    sw $t4, 548($t0)
    sw $t4, 560($t0)
    sw $t4, 564($t0)
    sw $t4, 568($t0)
    sw $t4, 572($t0)
    sw $t4, 576($t0)
    sw $t4, 580($t0)
    sw $t4, 584($t0)
    sw $t4, 588($t0)
    sw $t4, 592($t0)
    #left side of the bottle
    sw	$t4,	644	($t0)
    sw	$t4,	772	($t0)
    sw 	$t4,	900	($t0)
    sw	$t4,	1028	($t0)
    sw	$t4,	1156	($t0)
    sw 	$t4,	1284	($t0)
    sw	$t4,	1412	($t0)
    sw	$t4,	1540	($t0)
    sw 	$t4,	1668	($t0)
    sw	$t4,	1796	($t0)
    sw	$t4,	1924	($t0)
    sw 	$t4,	2052	($t0)
    sw	$t4,	2180	($t0)
    sw	$t4,	2308	($t0)
    sw 	$t4,	2436	($t0)
    sw	$t4,	2564	($t0)
    sw	$t4,	2692	($t0)
    sw 	$t4,	2820	($t0)
    sw	$t4,	2948	($t0)
    sw	$t4,	3076	($t0)
    sw 	$t4,	3204	($t0)
    sw	$t4,	3332	($t0)
    sw	$t4,	3460	($t0)
    sw 	$t4,	3588	($t0)
    sw	$t4,	3716	($t0)
    sw	$t4,	3844	($t0)
    #right side of the bottle
    sw	$t4,	720	($t0)
    sw	$t4,	848	($t0)
    sw	$t4,	976	($t0)
    sw	$t4,	1104	($t0)
    sw	$t4,	1232	($t0)
    sw	$t4,	1360	($t0)
    sw	$t4,	1488	($t0)
    sw	$t4,	1616	($t0)
    sw	$t4,	1744	($t0)
    sw	$t4,	1872	($t0)
    sw	$t4,	2000	($t0)
    sw	$t4,	2128	($t0)
    sw	$t4,	2256	($t0)
    sw	$t4,	2384	($t0)
    sw	$t4,	2512	($t0)
    sw	$t4,	2640	($t0)
    sw	$t4,	2768	($t0)
    sw	$t4,	2896	($t0)
    sw	$t4,	3024	($t0)
    sw	$t4,	3152	($t0)
    sw	$t4,	3280	($t0)
    sw	$t4,	3408	($t0)
    sw	$t4,	3536	($t0)
    sw	$t4,	3664	($t0)
    sw	$t4,	3792	($t0)
    sw	$t4,	3920	($t0)
    #bottom of the bottle
    sw  $t4,    3916    ($t0)
    sw  $t4,    3912    ($t0)
    sw	$t4,	3908	($t0)
    sw	$t4,	3904	($t0)
    sw	$t4,	3900	($t0)
    sw	$t4,	3896	($t0)
    sw	$t4,	3892	($t0)
    sw	$t4,	3888	($t0)
    sw	$t4,	3884	($t0)
    sw	$t4,	3880	($t0)
    sw	$t4,	3876	($t0)
    sw	$t4,	3872	($t0)
    sw	$t4,	3868	($t0)
    sw	$t4,	3864	($t0)
    sw	$t4,	3860	($t0)
    sw	$t4,	3856	($t0)
    sw  $t4,    3852    ($t0)
    sw  $t4,    3848    ($t0)
    # Dr. Mario
    sw $t3,    1000     ($t0)
    sw $t6,    1128     ($t0)
    # 4 viruses randomly generated ################
    li $s5, 0
    li $s6, 3
    # Now, choosing a random colour between $t1, $t3, and $t6
loop_start:
    # Generate a random number between 0 and 2
    li $v0, 42
    li $a0, 0
    li $a1, 3
    syscall
    move $t9, $a0
    beq $t9, 0, choose_red
    beq $t9, 1, choose_blue
    beq $t9, 2, choose_yellow
choose_red:
    move $t7, $t1
    j done
choose_blue:
    move $t7, $t3
    j done
choose_yellow:
    move $t7, $t6
    j done
done:
    # Generate a random number among 0 to 18
    li $v0, 42
    li $a0, 0
    li $a1, 18
    syscall
    mul $t0, $a0, 4
    addi $t4, $t0, 2184
    # Generate a number between 0 and 10 and multiply it by 128
    li $v0, 42
    li $a0, 0
    li $a1, 11
    syscall
    mul $t5, $a0, 128
    # Compute final pixel position
    add $t8, $t4, $t5
    # Store the position in the correct register
    beq $s5, 0, store_s0
    beq $s5, 1, store_s1
    beq $s5, 2, store_s2
store_s0:
    move $s0, $t8
    j store_done
store_s1:
    move $s1, $t8
    j store_done
store_s2:
    move $s2, $t8
store_done:
    # Store the randomly chosen color
    sw $t7, 0x10008000($t8)
    addi $s5, $s5, 1
    beq $s5, $s6, loop_end
    j loop_start
loop_end:
  #Capsules
Capsules:
    lw   $t0, ADDR_DSPL
    jal  choose_color
    sw   $t7, 424($t0)   # Store the chosen color at offset 424.
    move $a0, $t7
    li $v0, 34
    syscall
    # --- Second Pixel ---
    jal  choose_color
    sw   $t7, 428($t0)   # Store the chosen color at offset 428.
    sw   $t7, 424($t0)   # Store the chosen color at offset 424.
    move $a0, $t7
    li $v0, 34
    j    moves           # Jump to exit

choose_color:
    li   $v0, 42         # System call: random integer generator.
    li   $a0, 0
    li   $a1, 3          # Generate random integer in range 0..2.
    syscall
    move $t9, $a0        # Save random number in $t9.
    beq  $t9, 0, pix_red
    beq  $t9, 1, pix_blue
    beq  $t9, 2, pix_yellow
pix_red:
    li $t7, 0xff0000        # Set $t7 to red.
    j    return_color
pix_blue:
    li $t7, 0x0000ff        # Set $t7 to blue.
    j    return_color
pix_yellow:
    li $t7, 0xffff00        # Set $t7 to yellow.
return_color:
    jr   $ra            # Return to the caller.

moves:
    # Enable keyboard input
    li   $v0, 32
    li   $a0, 1
    syscall
    jal choose_color
    li   $s3, 424 
    move $t6, $t7
    sw   $t6, 424($t0) 
    jal choose_color
    li  $s4, 428
    sw  $t7, 428($t0)

    # Enable keyboard input
    li   $v0, 32
    li   $a0, 1
    syscall

loop_move:
    # Poll the keyboard for a key press
    lw   $t0, ADDR_KBRD       # Load keyboard base address into $t0
    lw   $t8, 0($t0)          # Read the status word from the keyboard
    beq  $t8, 1, keyboard_input  # If a key is pressed, handle it
    j    loop_move                # Otherwise, keep polling

keyboard_input:
    lw   $a0, 4($t0)          # Read the key code (second word)
    beq  $a0, 0x71, quit       # If key is 'q' (0x71), exit program
    beq  $a0, 0x73, move_down  # If key is 's' (0x73), move the pixel down
    beq  $a0, 0x61, move_left  
    beq  $a0, 0x64, move_right
    j    loop_move               # Ignore other keys and return to loop

move_down:
    addi $t9, $s0, -128   # $tX now holds virus1's collision threshold
    beq  $s3, $t9, Capsules
    beq  $s4, $t9, Capsules

    addi $t8, $s1, -128   # $tX now holds virus1's collision threshold
    beq  $s3, $t8, Capsules
    beq  $s4, $t8, Capsules

    addi $t5, $s0, -128   # $tX now holds virus1's collision threshold
    beq  $s3, $t5, Capsules
    beq  $s4, $t5, Capsules

    beq  $s3, $s0,  Capsules
    beq  $s4, $s0, Capsules
    beq  $s3, $s1,  Capsules
    beq  $s4, $s1, Capsules
    beq  $s3, $s2, Capsules
    beq  $s3, $s2, Capsules
    li   $t9, 3720         # bottom limit offset (adjust if needed)
    bge  $s3, $t9, Capsules  # if current vertical offset >= 3720, do nothing
    bge  $s4, $t9, Capsules
    
    # Erase the current pixel by painting it black (0x000000)
    lw   $t0, ADDR_DSPL       # Load display base address into $t0
    add  $t1, $t0, $s3        # Compute the address of the current pixel
    add  $t2, $t0, $s4
    jal collision
    li   $t5, 0x000000        # $t5 = black color
    sw   $t5, 0($t1)          # Overwrite the current pixel with black
    sw   $t5, 0($t2)

    # Move the pixel down by increasing the offset by 128 bytes
    addi $s3, $s3, 128        # Update offset for new position
    addi $s4, $s4, 128
    add  $t1, $t0, $s3        # Compute new pixel address (base + new offset)
    add  $t2, $t0, $s4
    sw   $t6, 0($t1)          
    sw   $t7, 0($t2)
    j    loop_move                # Return to polling loop

move_right:
    addi $t9, $s0, -4   # $tX now holds virus1's collision threshold
    beq  $s3, $t9, loop_move

    addi $t8, $s1, -4   # $tX now holds virus1's collision threshold
    beq  $s3, $t8, loop_move
    
    addi $t5, $s0, -4   # $tX now holds virus1's collision threshold
    beq  $s3, $t5, loop_move
    beq  $s3, $s0,  loop_move
    beq  $s3, $s1,  loop_move
    beq  $s3, $s2, loop_move
    beq $s3,    424,    loop_move
    beq $s3,    552,    loop_move
    beq	$s3,	712,	loop_move
    beq	$s3,	840,	loop_move
    beq	$s3,	968,	loop_move
    beq	$s3,	1096,	loop_move
    beq	$s3,	1224,	loop_move
    beq	$s3,	1352,	loop_move
    beq	$s3,	1480,	loop_move
    beq	$s3,	1608,	loop_move
    beq	$s3,	1736,	loop_move
    beq	$s3,	1864,	loop_move
    beq	$s3,	1992,	loop_move
    beq	$s3,	2120,	loop_move
    beq	$s3,	2248,	loop_move
    beq	$s3,	2376,	loop_move
    beq	$s3,	2504,	loop_move
    beq	$s3,	2632,	loop_move
    beq	$s3,	2760,	loop_move
    beq	$s3,	2888,	loop_move
    beq	$s3,	3016,	loop_move
    beq	$s3,	3144,	loop_move
    beq	$s3,	3272,	loop_move
    beq	$s3,	3400,	loop_move
    beq	$s3,	3528,	loop_move
    beq	$s3,	3656,	loop_move
    beq $s3,    3784,   loop_move
    beq	$s3,	3984,	loop_move
    beq	$s3,	3912,	loop_move

      # Erase the current pixel by painting it black (0x000000)
    lw   $t0, ADDR_DSPL       # Load display base address into $t0
    add  $t1, $t0, $s3        # Compute the address of the current pixel
    add  $t2, $t0, $s4
    
    jal collision
    li   $t5, 0x000000        # $t5 = black color
    sw   $t5, 0($t1)          # Overwrite the current pixel with black
    sw   $t5, 0($t2)

    # Move the pixel down by increasing the offset by 128 bytes
    addi $s3, $s3, 4        # Update offset for new position
    addi $s4, $s4, 4
    add  $t1, $t0, $s3        # Compute new pixel address (base + new offset)
    add  $t2, $t0, $s4
    sw   $t6, 0($t1)         
    sw   $t7, 0($t2)
    j    loop_move                # Return to polling loop

move_left:
    addi $t9, $s0, 4   # $tX now holds virus1's collision threshold
    beq  $s3, $t9, loop_move

    addi $t8, $s1, 4   # $tX now holds virus1's collision threshold
    beq  $s3, $t8, loop_move
    
    addi $t5, $s0, 4   # $tX now holds virus1's collision threshold
    beq  $s3, $t5, loop_move
    beq  $s3, $s0,  loop_move
    beq  $s3, $s1,  loop_move
    beq  $s3, $s2, loop_move
    # Check if the horizontal offset in $s3 is at any left boundary.
    beq  $s3, $s0,  loop_move
    beq  $s3, $s1,  loop_move
    beq  $s3, $s2, loop_move
    beq  $s3, 424,  loop_move
    beq  $s3, 552,  loop_move
    beq  $s3, 648, loop_move
    beq  $s3, 776, loop_move
    beq  $s3, 904, loop_move
    beq  $s3, 1032, loop_move
    beq  $s3, 1160, loop_move
    beq  $s3, 1288, loop_move
    beq  $s3, 1416, loop_move
    beq  $s3, 1544, loop_move
    beq  $s3, 1672, loop_move
    beq  $s3, 1800, loop_move
    beq  $s3, 1928, loop_move
    beq  $s3, 2056, loop_move
    beq  $s3, 2184, loop_move
    beq  $s3, 2312, loop_move
    beq  $s3, 2440, loop_move
    beq  $s3, 2568, loop_move
    beq  $s3, 2696, loop_move
    beq  $s3, 2824, loop_move
    beq  $s3, 2952, loop_move
    beq  $s3, 3080, loop_move
    beq  $s3, 3208, loop_move
    beq  $s3, 3336, loop_move
    beq  $s3, 3464, loop_move
    beq  $s3, 3592, loop_move
    beq  $s3, 3720, loop_move
    beq  $s3, 3848, loop_move

    # If none of the boundary checks trigger, then do the move.
    lw   $t0, ADDR_DSPL       # Load display base address
    add  $t1, $t0, $s3        # Compute the address of the current pixel
    add  $t2, $t0, $s4        # Compute the address of the companion pixel
    jal  collision             # Check for collisions
    li   $t5, 0x000000        # Black color for erasing
    sw   $t5, 0($t1)          # Erase the current pixel
    sw   $t5, 0($t2)
    
    # Update the offsets to move left (subtract 4)
    addi $s3, $s3, -4
    addi $s4, $s4, -4
    add  $t1, $t0, $s3        # Compute new pixel address
    add  $t2, $t0, $s4        # Compute new companion pixel address
    sw   $t6, 0($t1)          # Draw pixel with its color (from $t6)
    sw   $t7, 0($t2)          # Draw companion pixel (from $t7)
    j    loop_move            # Return to the polling loop

move_up:
   lw    $t0, ADDR_DSPL
   

quit:
    li   $v0, 10             # Exit syscall
    syscall

collision:
    # Check value at memory address (s0 - 128)
    addi   $t3, $s0, -128     # Compute address: s0 - 128
    lw     $t4, 0x10008000($t3) # Load the word from that address into t4
    beq    $t4, $t1, collision_detected  # If t4 equals t1, collision!
    beq    $t4, $t2, collision_detected  # If t4 equals t2, collision!

    # Check value at memory address (s1 - 128)
    addi   $t3, $s1, -128     # Compute address: s1 - 128
    lw     $t4, 0x10008000($t3) # Load the word from that address into t4
    beq    $t4, $t1, collision_detected
    beq    $t4, $t2, collision_detected

    # Check value at memory address (s2 - 128)
    addi   $t3, $s2, -128     # Compute address: s2 - 128
    lw     $t4, 0x10008000($t3) # Load the word from that address into t4
    beq    $t4, $t1, collision_detected
    beq    $t4, $t2, collision_detected

    # No collision detected; return to the caller
    jr     $ra

collision_detected:
    # Collision detected; branch to move (or handle it as needed)
    j      Capsules

redraw:
   j Capsules

exit:
    li $v0, 10              # terminate the program gracefully
    syscall
