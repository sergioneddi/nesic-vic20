# 🧠 Technical Manual: The Advanced SYS Instruction (Parametric and Bidirectional)

Nesic extends the classic BASIC `SYS` command by introducing native parameter passing and the ability to invoke Machine Language (ML) routines as functions, returning numeric values ​​or strings directly into the program flow.

## Syntax in Nesic

As a **Command** (Passing input parameters)

```
SYS $1000, par1, par2, par3$
```

Allows passing an arbitrary number of parameters (numeric or strings) directly to the routine located at the specified address.

As a **Function** (Returning a numeric value or string)

```
A = SYS($1000, par1)
B$ = SYS($1010, par1$)
```

In this mode, the machine language routine processes the input data and returns a value that Nesic assigns directly to the designated variable.

## Assembler-Side Architecture (6502)

To utilize this feature, the machine language routine developer must interface with Nesic's Kernel/Interpreter vectors and routines to retrieve parameters from the parser stack and store the return value.

### Reading Input Parameters

When Nesic encounters a comma after the `SYS` address, the parser pointer moves to the next parameter. From an assembly language perspective, you can leverage the interpreter's internal routines (mapped in the Nesic cartridge ROM) to validate and retrieve data:

• **Numeric Parameters (Byte / Word):** The machine code routine can call the Nesic parser routine (e.g., JSR GETNUM), which analyzes the expression, verifies that it is a number, and stores the value in the CPU registers (e.g., the A register for a byte, or a pair of Zero Page locations for a 16-bit word).

• **String Parameters:** By calling the appropriate routine (e.g., JSR GETSTR), the Nesic interpreter validates the string and returns a pointer (string descriptor: address and length) in Zero Page, pointing to the memory area where the text is temporarily allocated.

### Handling the Return Value (Function Mode)

If the SYS command was invoked within an assignment expression (e.g., A = SYS(...)), the interpreter expects the machine language routine to store the result before executing the RTS instruction.

• **Numeric Return:** Before exiting via RTS, the machine language routine must load the final value into the accumulator or the registers designated by Nesic (e.g., the VIC-20's floating-point accumulator or an internal Nesic register) so that the parser can retrieve it and assign it to the variable.

• **String Return:** The routine must construct the string in free RAM (or in the temporary buffer area), set up the correct string descriptor, and pass the address of this descriptor to the Nesic interpreter immediately before returning.

## 🔀 Asymmetric Flexibility and Tolerance of the SYS Command

The Nesic v2.4 SYS command operates dynamically and adaptively, granting the programmer maximum freedom—whether using it at a high level or writing machine-language routines.

### Ignoring the Return Value (Usage as a Command)

If a machine-language routine is designed to return a value (numeric or string), the user is still free to invoke it as a standard command if the processing result is not required:

```
SYS $1000, 5 :' Executes the routine but discards the result
```

In this scenario, the Nesic parser executes the routine and, upon returning from the RTS instruction, detects that no destination variable has been specified. The system then immediately clears temporary buffers and safely discards the data, preventing memory leaks or string stack accumulation.

### Default Return Value (Usage as a Function)

Similarly, if you attempt to invoke an old machine language (ML) routine within an assignment—one not designed for Nesic and which therefore does not set a return flag before the `RTS` instruction:

```
A = SYS($1000, 5) :' Force the call as a function
```

Nesic applies a hardware tolerance logic: it executes the routine safely, and if, upon return, it verifies that the routine neither deposited data nor compromised system stability, it automatically assigns the default value of 0 to the variable.

**⚠️ Note:** Although Nesic implements advanced algorithms to prevent stack collapse and protect memory, the effectiveness of this tolerance depends on the correctness of the machine language routine; it must not, under any circumstances, corrupt vital Zero Page locations or alter the stack pointer beyond the interpreter's realignment limits.

## 🔬 Example: Dynamic color change via hybrid SYS

To fully grasp the power of Nesic V2.4's parametric `SYS` command, let us analyze a Machine Language (ML) routine designed to reside at address `$1600`.

This routine demonstrates how the same code can simultaneously serve as a **read function** (to save hardware state) and a **write command** (to modify the 6561 video chip registers), all while interfacing with system vectors.

### Assembler Source Code (6502)

```
*=$1600

; --- VECTORS AND INTERNAL SUBROUTINES ---
VIRGOLABYTE = $D7F1     ; Checks for the presence of a comma in the parser
                        ; ...and extracts a limited integer (0–255) into the X register.
MAKFP       = $D391     ; Converts the 16-bit integer held in A (High)
                        ; and Y (Low) into Floating Point format.

; --- MAIN ENTRY POINT ---
; Can be called as: SYS $1600, color  OR  C = SYS($1600, color)

COLORS  JSR VIRGOLABYTE   ; Evaluates the next argument and places the color in X
        LDA $900F         ; Reads the OLD value of the VIC Screen/Border register
        STX $900F         ; Writes the NEW color (from X) to the VIC register
        TAY               ; Moves the old value (from A) to the Y register (Low Byte)
        LDA #$00          ; Clears register A (High Byte) to form a 16-bit word
        JMP MAKFP         ; Converts AY into a return value for BASIC and executes the RTS
```

#### Analysis of Command-Line Execution

At this point, the following multi-statement line can be typed and executed in direct mode (without a line number) or inserted into a program:

```
C=SYS($1600, 0):FOR I=1 TO 255:SYS $1600,I:NEXT:SYS $1600,C
```

Nesic processes the line by splitting the action into three distinct, high-speed phases:

**1. Read and Save Phase (C=SYS($1600,0)):**

The SYS routine is invoked as a function. The parameter 0 is passed to the routine, which momentarily sets the screen to black. Immediately beforehand, however, the routine reads register $900F, retrieves the system's original color, and returns it to Nesic via MAKFP. Nesic assigns this value to variable C.

**2. Arcade Loop Phase (FOR I=1 TO 255 ​​: SYS $1600,I : NEXT):**

A lightning-fast loop begins, in which SYS is used purely as a command. The return value generated by MAKFP is ignored and discarded by Nesic without cluttering memory. The machine-language routine updates the video register during every iteration. The machine code runs fast enough to anticipate and visually track the video raster's progress, creating the stunning colored-bar effect visible in the image.

**3. Restore Phase (SYS $1600,C):**

Upon completion of the loop, a final call is executed, passing variable C. The VIC register $900F is rewritten with the initial color saved during the first phase, restoring the screen to its original state.

### 🧵 Advanced Dynamic Memory Management: Returning Strings via SYS

While passing and returning numeric values ​​using the Floating Point Accumulator (MAKFP) is a straightforward operation, managing the **return of string values** from a Machine Language function represents the most complex technical challenge of 8-bit architecture.

When the interpreter performs an assignment or a complex concatenation—for example:

```
A$ = "LIVELLO " + SYS($1600, Q) + " SUPERATO!"
```

It must evaluate the literal strings while simultaneously jumping to the $1600 routine to retrieve the dynamic text generated in Machine Language.

## 🔬 Returning static strings via SYS

While returning a numeric value utilizes the system's math accumulator, returning text data requires setting up a **string descriptor** in Zero Page and activating the string type flag before the RTS instruction.

The following code demonstrates how to set up two distinct entry points ($1600 and $1613) to return fixed strings on the fly, which can then be concatenated or assigned directly within Nesic.

### The Assembler Source Code (6502)

```
*=$1600

; =========================================================================
; ENTRY POINT 1: Returns the string "ciao"
; Nesic syntax: A$ = SYS($1600)  [decimal equivalent: SYS 5632]
; =========================================================================

CIAO		LDA #TESTOEND-TESTO   ; Calculate length of string "ciao" (4 bytes)
            STA $61               ; Save length in descriptor (Byte 1)
            LDA #<TESTO           ; Get low byte of string address
            STA $62               ; Save in descriptor (Byte 2)
            LDA #>TESTO           ; Get high byte of string address
            STA $63               ; Save in descriptor (Byte 3)
            JMP RITSTR            ; Jump to string finalization routine
TESTO       BYTE "ciao"
TESTOEND

; =========================================================================
; ENTRY POINT 2: Returns the string " mondo!"
; Nesic syntax: B$ = SYS($1613)  [decimal equivalent: SYS 5651]
; =========================================================================

MONDO       LDA #TESTOEND1-TESTO1 ; Calculate the string length (7 bytes)
            STA $61               ; Save the length in the descriptor
            LDA #<TESTO1          ; Get the low byte of the address
            STA $62               ; Save in the descriptor
            LDA #>TESTO1          ; Get the high byte of the address
            STA $63               ; Save in the descriptor
            JMP RITSTR            ; Jump to the string termination routine

TESTO1      BYTE " mondo!"
TESTOEND1

; =========================================================================
; TERMINATION AND FLAG CONFIGURATION ROUTINE
; =========================================================================

RITSTR      LDA #$FF              ; Load value $FF (String Type Identifier)
            STA $0D               ; Set Zero Page location $0D (Nesic Type Flag)
            RTS                   ; Return safely to the interpreter
```

### Application in Nesic (Combined Example)

Thanks to the precision of this low-level interface, the two machine-code calls can be embedded directly within standard Nesic string expressions, benefiting from the system's 3-level stack protection.

At this point, you can type the following directly into the editor:

```
10 BGN[STRING TEST]
20 PRINT SYS($1600) + SYS($1613)
30 END
```

When the program is executed via RUN, Nesic will:

**1.** Jump to $1600, detect the $FF flag at $0D, read the descriptor at $61–$63, and temporarily store the string "ciao".

**2.** Immediately jump to $1613 and repeat the operation for " mondo!".

**3.** The string engine will perform a safe concatenation without crashing the environment or corrupting dynamic memory pointers, printing the following to the screen:

```
CIAO MONDO!
```

"CIAO MONDO!" corresponds to "HELLO WORLD!" in Italian.

Naturally, you can also issue the following direct command instead of writing the three program lines:

```
PRINT SYS($1600) + SYS($1613)
```

The result will be the same.

