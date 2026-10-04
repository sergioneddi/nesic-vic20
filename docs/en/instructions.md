# NESIC V2.4

## COMMANDS

Nesic commands are essentially the same as those in the original VIC-20 BASIC v2.0—to which I refer you for further details—with the exception of `GOTO` and `GOSUB`, which do not exist in Nesic. However, there are additional commands and functions, and some standard BASIC commands take on different roles here. Here is the list:

**\[procedure\]**

**' (comment)**

**AGAIN**

**AUTO**

**AUX**

**BEEP**

**BGN\[procedure\]**

**BORDER**

**COLOR**

**COLOR$**

**CSR**

**DELETE**

**EFFECT**

**ELSE**

**END**

**EVAL**

**FIRE**

**GO\<label\>**

**GRAPHIC**

**HPEN**

**IF**

**INK**

**INSTR**

**JOY**

**LBL\<label\>**

**LIST**

**MERGE**

**MERGE SHAPE**

**OLD**

**ON**

**PADDLE**

**PAPER**

**PEEK**

**PEEK+**

**POKE**

**POKE+**

**RENUMBER**

**REPEAT**

**REPEAT$**

**RUN**

**SHAPE**

**SOUND**

**SYS**

**SYS INPUT**

**SYS LOAD**

**SYS SAVE**

**TRIM$**

**TRIM LEFT$**

**TRIM RIGHT$**

**VIDEO**

**VIDEO$**

**VOLUME**

**VPEN**

In more detail:

### \[procedure\] – \[name\] – \[name\], par1, par2, par3 … , parn

Procedure call, including with parameters. Example:

```
10 BGN[MAIN]

20 [PERSON],"PIPPO",6

30 END

40 BGN[PERSON],N$,A

50 PRINT "HELLO ";N$; " AGE ";A

60 END
```

will print:

```
HELLO PIPPO AGE 6
```

### ' (instruction comment)

It is similar to REM—that is, a comment—but unlike REM, which comments out everything to its right until the end of the line, this comment applies only to the current instruction:

```
A=5:'A=3:PRINT A
```

What will it print? It will print 5 because the second instruction is a comment and will be skipped; therefore, that assignment will not take place.

### AGAIN – AGAIN – AGAIN\[procedure\]

Repeats the current procedure from the beginning. If a procedure name is specified—for example, AGAIN\[PIPPO\]—it executes that procedure from the beginning.

WARNING: it executes it only if the procedure PIPPO has already been instantiated; otherwise, a PROC NOT FOUND ERROR will occur.

Example:

```
10 BGN[TEST AGAIN]

20 PRINT ",";

30 [PROCEDURE2]

40 END

50 BGN[PROCEDURE2]

60 PRINT ".";

70 AGAIN[TEST AGAIN]
```

This is a continuous repetition from the beginning and will therefore produce an alternating printout of commas and dots.

Now, let's modify line 70 and add another procedure, like this:

```
10 BGN[TEST AGAIN]

20 PRINT ",";

30 [PROCEDURE2]

40 END

50 BGN[PROCEDURE2]

60 PRINT ".";

70 AGAIN[TEST2]

80 BGN[TEST2]

90 PRINT "!";

100 [PROCEDURE2]

110 END
```

Will it work? No, because while the procedure TEST2 is present in the program, it is not called; therefore, AGAIN will not find it in memory. Running the program will thus result in:

```
RUN

,.

?PROC NOT FOUND

ERROR IN 70

READY.
```

In other words, after printing a comma and a period—as expected—we encounter an error when the AGAIN instruction is executed.

If, however, we modify line 30 to `30 [TEST2]`, the output will consist of a comma followed by alternating exclamation marks and periods; this is because the TEST2 procedure has been instantiated and is therefore found in memory by AGAIN.

**To summarize:** AGAIN allows you to re-execute, from the beginning, a procedure that has already been instantiated in memory.

### AUTO – AUTO 100\[,10\]

It is a utility command: it allows the automatic numbering of the lines while inserting a listing. For example:

AUTO (without parameters)

proposes line number 100 and we can type a Nesic line below. When sending, the next line will be proposed. By default the pitch is 10, so we will be offered the number 110.

Sending to the proposed number, without entering anything, will be equivalent to exiting AUTO mode.

So AUTO without parameters is equivalent to AUTO 100.10. We can therefore type AUTO without parameters, AUTO line\_initial and AUTO line\_initial,line\_final.

### AUX – AUX=number (0-15) – AUX function (A=AUX)

System variable: AUX=number (from 0 to 15) sets the VIC register relating to the auxiliary color, PRINT AUX instead prints this setting. It is also possible to express the value in hexadecimal, for example: AUX=$0F.

### BEEP – BEEP 0 – BEEP 1

Utility command: BEEP or BEEP1 activates a short BEEP when the keys are pressed, BEEP 0 deactivates it.

### BGN\[procedure\] and any parameters: BGN\[procedure\] , var1, var2...

Procedure statement, must be at the beginning of a line. It is possible to declare variables into which the parameters specified in the call will be inserted. For each variable declared here, a variable of compatible type must be specified in the call.

### BORDER – BORDER=n (0-15) – A=BORDER

Change or read the color of the screen border. System variable: BORDER=n (0 to 15) or PRINT BORDER.

It is also possible to express the value in hexadecimal, for example: BORDER=$03.

### COLOR – COLOR=n (0-15) – A=COLOR

Changes or reads the color of the character where the cursor is positioned. System variable: COLOR=n (0 to 15) or PRINT COLOR.

It is also possible to express the value in hexadecimal, for example: COLOR=$F0.

### COLOR$ - command: COLOR$(n)=A$ - function: A$=COLOR$(n)

Similarly to its twin VIDEO$, this instruction acts on the color memory and allows you to read in a string or set all the colors of a line of characters.

For example:

```
COLOR$(10)=COLOR$(0)
```

Copy the font color from line 0 to line 10.

**Warning:** if you provide a string longer than 22 characters it will be truncated. However, if you provide a shorter string, only that string will be printed and not the entire 22-character line.

### CSR – CSR x,y – A= CSR X – A=CSRY

Positions the cursor at coordinates x,y (e.g., CSR 10,12).

CSR without parameters clears the screen and positions the cursor at the top-left corner.

It is also possible to retrieve the cursor coordinates: A=CSR X and B=CSR Y allow you to store the coordinates in variables A and B.

### DELETE – DELETE n1-n2 – DELETE\[procedure\]

Deletes a specified range of lines or an entire procedure.

Example: DELETE 10-100 or DELETE\[MAIN\]

### EFFECT – EFFECT ch\_num, repetitions, freq1, freq2 – EFFECT ch\_num, duration, freq – EFFECT ch\_num, 0

EFFECT generates a non-blocking audio effect; that is, its execution does not halt the program's execution. Sound effects can be generated by setting up to 4 parameters.

Examples:

EFFECT 0,5,100,20 plays a sound effect on channel 0, repeated 5 times, with a descending frequency ranging from 100 to 20.

EFFECT 3,3,50,127 plays a sound effect on channel 3 (noise), repeated 3 times, with an ascending frequency ranging from 50 to 127.

EFFECT 2,20,80 generates a fixed frequency on channel 2 with a duration of 20 and a frequency of 80.

EFFECT 1,0 silences channel 1.

EFFECT without parameters silences all sounds, including those generated by the SOUND instruction.

### ELSE

Part of the IF instruction; it must be placed on the same line, following the THEN clause (which is optional). ELSE must always be preceded by a colon ":".

### END - END – END\[procedure\]

END without parameters terminates the current procedure (or the entire program if in the main procedure). END\[procedure\] terminates a procedure in which the current code is nested.

Example:

```
10 BGN[MAIN]

20 [PROC1]

30 PRINT "MAIN"

40 END

50 BGN[PROC1]

60 PRINT "PROC1"

70 END
```

If we run the program, we get the following output:

```
PROC1

MAIN
```

But if we modify line 70 as follows:

```
70 END[MAIN]
```

we get this:

```
PROC1
```

because the MAIN procedure (i.e., in this case, the entire program) is terminated before execution can continue and print "MAIN".

### EVAL – A=EVAL(A$)

Evaluates a formula contained within a string. This allows for the processing of formulas entered by the user via the INPUT statement. Such formulas may use Basic functions—NOTE: not Nesic functions. This limitation is imposed for stability reasons. Example: PRINT EVAL("6\*5") will print 30. In the event of a formula error, the program will halt and report an error; however, this situation can be intercepted and handled using Nesic's error handling features.

### FIRE

A function that returns the state of the joystick's FIRE button: 0 if the button is not pressed, and -1 if it is pressed.

### GO\<label\>

GO\<label\> is similar to the BASIC GOTO command, but it redirects execution to a label specified by LBL\<label\> rather than to a line number.

### GRAPHIC - GRAPHIC – GRAPHIC n – GRAPHIC n,n

GRAPHIC is a command related to graphics mode, but—note carefully—it does not refer to bitmap graphics as one might expect. Instead, it deals with redefinable character graphics, which are useful for games.

GRAPHIC used without parameters behaves in a specific way: it reverts character display to the default system ROM set, resets screen colors to their default values, and silences the sound.

The first parameter can range from 0 to 2: GRAPHIC 0, GRAPHIC 1, and GRAPHIC 2. These correspond, respectively, to: using the default ROM character set; using the ROM character set copied to RAM starting at address $1000 (making them editable); and—in the third case—doing the same but with the second character set (the one containing lowercase letters) copied to RAM and ready for modification.

The second parameter (e.g., GRAPHIC 1,0) can be either 0 or 1. If set to 0, the system switches to graphics mode *without* copying the characters from ROM. This is useful if you want to modify characters while in GRAPHIC 0 mode and then switch to GRAPHIC 1 without re-copying from ROM—thereby avoiding overwriting your modified characters.

### HPEN

This command is used in conjunction with VPEN and allows the system to read the light pen's vertical coordinate.

### IF

This is similar to the BASIC IF statement, but the THEN keyword is optional, and the command also supports an ELSE clause. Note: the `ELSE` must always be preceded by a colon (`:`), and it is sometimes better to use `THEN` to avoid ambiguity, even though I encountered no issues during my tests. Omitting it saves characters (and memory), allowing more instructions to fit on a single line, but including it can sometimes make the code more readable.

### INK – INK=n (0-15) - A=INK

`INK` is a system variable used to set or read the color for the `PRINT` command. Example: `INK=7:PRINT "YELLOW"`. The colors associated with `INK` are:

0 = BLACK

1 = WHITE

2 = RED

3 = CYAN

4 = MAGENTA

5 = GREEN

6 = BLUE

7 = YELLOW

Colors 8 through 15 relate to multicolor mode; the resulting color also incorporates the auxiliary color defined by the `AUX` system variable.

The value can also be specified in hexadecimal format—for example: `INK=$06`.

### INSTR – function

`INSTR` is a function used to search for a substring (consisting of one or more characters) within a string.

Example:

```
PRINT INSTR("ABC","BC")
```

This will print `2` because "BC" is found starting at the second position. If a substring is not found, it prints 0. If the first string is null, the result is always 0; if the second string is null and the first is a valid string, the result is 1.

Example:

```
PRINT INSTR("ABC","D")
```

You can specify an offset from which to start the search:

```
PRINT INSTR(3, "1234212","2")
```

In this case, the search starts at position 3 and finds the '2' at position 5, so it prints 5.

If the second string is null, the result is the same number used as the offset, or 0 if that number exceeds the string's length. If no offset is specified, it defaults to 1.

### JOY - A=JOY

JOY is a function that returns the joystick position according to the following table:

0 = center position

1 = left

2 = right

3 = up

4 = down

5 = up-left

6 = up-right

7 = down-right

8 = down-left

### LBL\<label\>

LBL\<label\> must appear at the beginning of a line; its function is to mark a "landing point" for a GO\<label\> command.

### LIST – LIST line – LIST start-line-end-line - LIST\[procedure\]

LIST is similar to the BASIC LIST command but also accepts LIST\[procedure\], which allows you to view all the lines making up the procedure.

### MERGE – MERGE "program" – MERGE "program",8

MERGE allows you to merge two Nesic programs into one. It functions more like an APPEND than a true MERGE; the new program is appended to the first, and the lines are then renumbered.

This can result in duplicate procedures. I chose to leave them as-is, even though I initially considered discarding the first occurrence of a procedure in favor of the new one. The issue is that there is no way to know which version the user intends to keep; therefore, it is best to review everything after performing a MERGE and decide manually how to proceed.

### MERGE SHAPE - MERGE SHAPE(chr1, chr2) TO chr3

MERGE SHAPE allows you to merge the definitions of two character codes—specified as either decimal or hexadecimal values ​​(chr1 and chr2)—into a third code, chr3. The merge is performed using the XOR operation, which is the most common method in such cases, though AND, OR, and NOT operations are also supported. Examples:

```
MERGE SHAPE($01, 02) TO 03
```

merges the definitions of hex characters 01 and 02 (A and B) into character 03 (C) using XOR

```
MERGE SHAPE($01, 02) TO 03, AND
```

merges the definitions of hex characters 01 and 02 (A and B) into character 03 (C) using AND

```
MERGE SHAPE($01, 02) TO 03, OR
```

merges the definitions of hex characters 01 and 02 (A and B) into character 03 (C) using OR

```
MERGE SHAPE($01) TO 03, NOT
```

merges the definition of hex character 01 (A) into character 03 (C) using NOT. This reverses the character.

```
MERGE SHAPE($01) TO 03, LOAD
```

copies the definition of hex character 01 (A) into character 03 (C) without modification; consequently, the letter C will take on the appearance of A.

Note that we can also write:

```
MERGE SHAPE($01) TO 03, OR
```

this will merge character $01 with $03, and the result will be stored in $03.

MERGE SHAPE($01) TO 01, NOT, on the other hand, will reverse character $01 onto itself; thus, each time the instruction is executed, the character will switch from positive to negative and vice versa, inverting the display.

### OLD

This is the opposite of NEW; it is used to recover a program that was accidentally deleted with NEW but has not yet been overwritten. It must therefore be used immediately after NEW; otherwise, recovery will become impossible.

### ON

This is analogous to the BASIC `ON...GOTO` or `ON...GOSUB` statements, with the difference that in Nesic, these involve procedures or jumps to labels.

Example:

```
ON JOY [SX],[DX],GO<SU>,GO<GIU>

PADDLE(n)
```

PADDLE is a function that returns the value of the specified paddle. The accepted parameter is either 0 or 1. Example:

```
PRINT PADDLE(0)
```

PAPER – PAPER=n – A=PAPER

PAPER acts as both a command and a function—essentially a system variable. It refers to the background color.

Examples:

```
PAPER=1

PRINT PAPER
```

Colors 0 through 7 are the same as for INK:

0 = BLACK

1 = WHITE

2 = RED

3 = CYAN

4 = MAGENTA

5 = GREEN

6 = BLUE

7 = YELLOW

Colors 8 through 15:

8 = ORANGE

9 = LIGHT ORANGE

10 = PINK

11 = LIGHT CYAN

12 = LIGHT MAGENTA

13 = LIGHT GREEN

14 = LIGHT PURPLE

15 = LIGHT YELLOW

The value can also be expressed in hexadecimal; for example: `PAPER=$05`.

### PEEK

This function is analogous to the one found in BASIC, but it also accepts parameters in hexadecimal format. Examples:

```
PRINT PEEK(4096)

PRINT PEEK($1000)
```

PEEK+ (16-bit) – if values ​​are expressed in hexadecimal, 4 digits must always be used.

It is similar to PEEK but operates on 16 bits; that is, it returns the value of 2 bytes.

Example:

```
PRINT PEEK+($002B)
```

This reads the values ​​at zero-page locations $2B and $2C and prints 6657: this corresponds to the start address of Nesic (hexadecimal $1A01).

### POKE

This instruction is similar to the BASIC `POKE`, but it accepts hexadecimal parameters and allows multiple data values ​​to be entered in sequence, even across multiple lines. When using hexadecimal parameters, the `$` prefix is ​​used; subsequent parameters continue to be interpreted as hexadecimal until the `#` prefix is ​​used to switch back to decimal parameters.

Example:

```
POKE $1000, AF, #50
```

In this case, following the address `$1000` (specified in hexadecimal), the value `AF` is interpreted as hexadecimal, while the value `50` is interpreted as decimal because it is preceded by the `#` prefix.

Other examples:

```
POKE $1000,04

POKE $1000,32,41,77
```

**Multi-line POKE:** The `POKE` instruction can continue onto subsequent lines, provided they begin with a comma.

Example:

```
30 POKE $1000,44,55,A9,3C

40 ,BF,C9,43,2C,4A,F8

50 ,91,A2,54,DE
```

This syntax is very powerful, allowing many values ​​to be loaded with a single instruction. Furthermore, the hexadecimal syntax is much faster than the BASIC decimal syntax, making the execution of a multi-line `POKE` extremely rapid.

Using the multi-line `POKE` in conjunction with the `SHAPE` function (which returns the memory address of a character) is incredibly powerful. The following instruction redefines the 4-character shape:

```
1210 POKE SHAPE(85),$00,01,02,1F,7F,ED,7F,3F

1220 ,00,80,40,F8,FE,BB,FE,FC

1230 ,01,01,03,1F,37,3F,1F,15

1240 ,00,00,80,F0,D8,F8,F0,50
```

**POKE+ (16-bit)** – if values ​​are expressed in hexadecimal, 4 digits must always be used.

It is similar to the standard POKE—meaning no multi-byte or multi-line syntax—but it operates in 16-bit mode, just like PEEK+.

Example:

```
POKE+$1800, 0201:POKE+$9400,0202
```

This sends character codes 01 and 02 respectively (with the most significant byte being the high byte) to the first two screen locations; in Nesic, screen memory begins at $1800. These screen codes correspond to the letters A and B, so "AB" will appear in the top-left corner in red, because the second instruction places color code $02 into the initial locations of the color RAM (which begins at $9400 in Nesic). Naturally, values ​​can also be specified in decimal; the result is the same:

```
POKE+6144, 513:POKE+37888,0202,514
```

RENUMBER - RENUMBER 100,10

This is a utility command used to renumber program lines starting from the first parameter provided, using the second parameter as the step increment (if provided).

Example:

```
RENUMBER
```

renumbers the program lines starting at 100 with a step of 10.

```
RENUMBER 50
```

renumbers the program lines starting at 50 with a step of 10.

```
RENUMBER 10,5
```

renumbers the program lines starting at 10 with a step of 5.

### REPEAT

This is a parameterless command that repeats the current line.

Example:

```
30 IF NOT FIRE REPEAT
```

This line will repeat until the joystick's FIRE button is pressed; the program will effectively pause at this point, waiting for the button press.

### REPEAT$ function: A$=REPEAT$("A", n)

This function creates a string consisting of *n* characters.

Example:

```
A$=REPEAT$(" ",22)
```

creates a string of 22 spaces.

It is a useful function when combined with VIDEO$ and COLOR$ for manipulating the screen area.

For example:

```
VIDEO$(0)=REPEAT$(CHR$(0),22):COLOR$(0)=REPEAT$(CHR$(2),22)
```

prints a red line of '@' characters on the first line of the screen. For the table of screen codes and color codes, it is advisable to consult the VIC-20 documentation.

### RUN – RUN\[procedure\] – RUN "program" – RUN "program", device

RUN starts a program from the beginning—that is, from the procedure located on the first line of the program. If the program does not begin with a procedure declaration, an error will occur.

RUN\[procedure\], on the other hand, starts the program beginning at the specified procedure. If the procedure to be started includes parameters, these must be provided to the RUN command.

Example:

```
10 BGN[NAME],N$

20 PRINT "NAME ";N$

30 END

RUN[NAME],"PIPPO"

NAME PIPPO

READY.

RUN

NAME

READY.
```

As seen in the example, the parameter "PIPPO" is passed to the procedure. However, consider the exception: when using the RUN command without specifying a procedure, parameters can be omitted, in which case no parameters are passed. But if the procedure to be launched is specified, the parameters must also be specified:

```
RUN[NAME]

?SYNTAX

ERROR IN 10

READY.
```

The Syntax Error indicates that something is wrong on line 10. In reality, regarding procedure parameters, this does not necessarily mean there is an error in the cited line itself, but rather a discrepancy in values: what the procedure declaration expects in terms of parameters does not match the parameters actually passed. However, it is impossible to determine exactly where the discrepancy lies: it could be a missing parameter or a parameter of the wrong type in the call (as in this case, where it is missing), or the declaration line might be requesting an extra parameter. In any case, the error is reported for the line where this check is performed—in our case, line 10.

For the sake of completeness, let's see what happens when passing a numeric parameter to a procedure that expects a string:

```
RUN[NAME],1

?TYPE MISMATCH

ERROR IN 10

READY.
```

As expected, we get a Type Mismatch Error.

### RUN "program"

Loads and runs a program from cassette.

### RUN "program", device

Loads and runs a program from the specified device, which can be: 1 = cassette, 8 = disk.

### SHAPE - A=SHAPE(n)

A function that returns the memory address of character *n*; the value can also be specified in hexadecimal by prefixing it with a dollar sign ($). It is useful in conjunction with POKE for redefining characters.

### SOUND – SOUND(channel)=value – A=SOUND(channel)

SOUND acts as both a command and a function—essentially a system variable.

Examples:

```
SOUND(1)=100
```

Generates a sound on channel 1 at a frequency of 100.

```
PRINT SOUND(1)
```

Prints the frequency value of channel 1.

**To silence:**

```
SOUND(1)=0
```

Available channels range from 0 to 3 (where 3 is the noise channel), while frequency values ​​range from 0 to 127. Frequency values ​​can also be expressed in hexadecimal; for example:

```
SOUND(2)=$5A
```

### SYS – SYS number – SYS $hexnumber

SYS is a command similar to the standard BASIC command; it launches a machine-language routine but also accepts a hexadecimal number if prefixed with a dollar sign ($). It can also be used as a function; in that case, please refer to the specific documentation for this command.

Example:

```
SYS $1000
```

### SYS INPUT – SYS INPUT A$

SYS INPUT is an instruction for inputting a string exactly as it is typed. Unlike the BASIC `INPUT` command, it does not display a prompt and accepts only string variables; the entire input is assigned to the variable without stopping at commas or other characters. This is useful when you need to capture the typed string in its entirety.

### SYS LOAD – SYS LOAD "filename" – SYS LOAD "filename", device - SYS LOAD "filename", device, startaddress

SYS LOAD allows you to load a binary file previously saved using SYS SAVE.

Unlike the BASIC `LOAD` command, SYS LOAD is designed primarily for loading character sets and machine language (LM) routines. It allows you to specify a load address—including in hexadecimal format by prefixing the value with a dollar sign ($).

Examples:

```
SYS LOAD
```

loads the first file from tape to the address specified within the file.

```
SYS LOAD "filename",8
```

loads the file "filename" from disk to the address specified within the file.

```
SYS LOAD "filename",1,$1000
```

loads the file "filename" from tape to the hexadecimal address $1000.

### **SYS SAVE – SYS SAVE "filename" – SYS SAVE "filename", device** - SYS SAVE "filename", device, startaddress - SYS SAVE "filename", device, startaddress, endaddress

SYS SAVE allows you to save a memory area to cassette or disk. This can be useful for saving custom character sets or machine language (LM) routines.

If the start and end addresses are not specified, they default to $1000 and $1800, thereby covering the 2 KB of the entire character area. If only the start address is specified, the end address defaults to $1800. This makes it easy to save just the upper part of the character RAM, where custom characters or machine language routines are most frequently stored.

### TRIM$ - A$ = TRIM$(B$)

This function removes spaces from before or after the text content of a string.

For example:

```
PRINT TRIM$("  PIPPO E PL          ")"UTO"
```

will print:

```
PIPPO E PLUTO
```

### TRIM LEFT$(string) – A$ = TRIM LEFT$(B$)

This function removes spaces to the left of the text contained in the string.

For example:

```
PRINT TRIM LEFT$("  PIPPO E PL          ")"UTO"
```

will print:

```
PIPPO E PL           UTO
```

thus, only the spaces to the left of the string are removed, unlike TRIM$, which removes them from both sides.

### TRIM RIGHT$ (string) – A$ = TRIM RIGHT$(B$)

This function removes spaces to the right of the text contained in the string. For example:

```
PRINT TRIM RIGHT$("  PIPPO E PL          ")"UTO"
```

will print:

```
PIPPO E PLUTO
```

so only the spaces to the right of the string are removed, unlike TRIM$, which removes them from both sides.

### VIDEO – VIDEO=number – A=VIDEO

This BASIC instruction acts as both a command and a function—essentially a system variable.

I realize the name VIDEO isn't very clear: its function is to set or read the value of the video RAM location where the cursor is currently positioned (0–255).

Example:

```
PRINT VIDEO
```

will print 32 if the screen is empty; otherwise, it will print the video code of the character at the cursor's position.

Or:

```
VIDEO = 0
```

will print an @ symbol; the character color will be the current one.

For the screen code and color code tables, it is best to consult the VIC-20 documentation, as screen codes differ from those used in standard PRINT statements. **Note:** The VIDEO instruction does not merely place the code on the screen; it also sets the color for that specific location.

The cursor does not advance automatically, but you can make it do so:

```
VIDEO=10,+:VIDEO=11
```

will print:

```
JK
```

because the + parameter advances the cursor.

### Multibyte VIDEO

There is, however, another feature of the VIDEO instruction: it is multibyte. You can use hexadecimal values ​​(prefixed with $) for the first byte (using \# to switch back to decimal), so we can also write:

```
VIDEO=$B1,B2,B3
```

which will result in "123" in reverse mode.

### VIDEO (x,y,c) multibyte

Another feature of the VIDEO instruction is the ability to specify coordinates and color; this allows a single instruction to position the cursor and print to the screen, resulting in greater speed. Furthermore, **negative coordinates can be used**, allowing part or all of a character sequence to move off-screen! Additionally, **the ";" character can be used as a line separator to print characters across multiple lines!**

Example:

```
100 BGN[EYES]

110 INK=6

120 CSR

130 FOR I=-6 TO 28

140 [EYE],I-2,12

150 [EYE],I+2,12

160 FOR J=1 TO 100:NEXT:' DELAY

170 NEXT

180 END

190 BGN[EYE], X, Y

200 VIDEO(X-1,Y)=$20;20;20:' ERASE TO THE LEFT

210 VIDEO(X,Y,2)=$55,43,49;42,51,48;4A,46,4B

220 END
```

In this example, we see two red eyes—created using semi-graphic characters—moving from the left side of the screen to the right. A FOR-NEXT loop introduces a delay to ensure the movement isn't too fast.

The instruction does not alter the current cursor coordinates, nor does it change the current color. It is also possible to specify only individual parameters within the parentheses; for example, `VIDEO(x)=0`, `VIDEO(,y)=6`, or `VIDEO(,,c)=2` are all valid instructions that allow you to set just the x-coordinate, the y-coordinate, or the color. Naturally, combinations are also possible: `VIDEO(x,,c)=3` does not specify Y, so the Y-coordinate remains whatever is defined by the cursor's current position.

### VIDEO$ - command and function: `VIDEO$(n)=A$` or `A$=VIDEO$(n)`

This instruction is quite unique: it allows you to read or write an entire screen row—22 bytes—as a string. It does not set the color; the complementary `COLOR$` instruction is used for that purpose.

Note: If you provide a string longer than 22 characters, it will be truncated. Conversely, if you provide a shorter string, only that string will be printed, rather than the full 22-character row. You should consult the VIC-20 documentation for the screen and color code tables, as the screen codes differ from those used with the standard `PRINT` command.

Example of copying one row to another:

```
A$=VIDEO$(0):VIDEO$(10)=A$
```

If you do not need to capture the string in a variable, you can simply write:

```
VIDEO$(10)=VIDEO$(0)
```

To ensure the color is also displayed correctly, you should follow up with:

```
COLOR$(10)=COLOR$(0)
```

Using the `REPEAT$` function:

```
VIDEO$(0)=REPEAT$(CHR$(160),22):COLOR$(0)=REPEAT$(CHR$(2),22)
```

In this case, a red bar (using the reverse-field space character) will be printed on the first row of the screen.

### VOLUME – VOLUME = number – A = VOLUME

It acts as both a command and a function—essentially a system variable.

Its usage is intuitive: it is used to set or read the current volume level (0–15).

The value can also be specified in hexadecimal; for example: VOLUME = $06.

Examples:

```
VOLUME = 15

PRINT VOLUME
```

### VPEN

A function used in conjunction with HPEN that allows reading the light pen's horizontal coordinate.

