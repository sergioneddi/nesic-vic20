# NESIC v2.4

## Usage philosophy

### What is Nesic?

Nesic is a structured variant of BASIC that I created (**NESIC** = **NE**ddi-ba**SIC**). But take note! Nesic isn't exactly BASIC—at least not by standard conventions. You can also interpret the acronym as **NE**sic is not ba**SIC**"). Nesic is procedure-based: it doesn't use the `GOTO` and `GOSUB` commands typical of BASIC, but rather procedures that are called by name.

It is a language I originally wrote for the VIC-20 back in 1984; I recently found a printout of a version that was, unfortunately, incomplete. I have since finished it by reconstructing the lost features and adding a few new ones. Since it is a BASIC variant, the instructions are generally those of VIC-20 BASIC v2.0, but with my own additions.

The fact that Nesic is procedure-based might be confusing for those accustomed to classic BASIC, where you might write:

```
10 PRINT "HELLO WORLD!"
```

In this case, Nesic would respond like this:

```
?PROC NOT FOUND

ERROR
```

This is because, to execute, the program requires the first line to begin with a procedure declaration using any name you like. I usually use the program's name; that way, it serves as a reminder when I come across the file later. This helped me identify some code listings I had printed back in 1984 and kept without any other notes. So, the fact that Nesic requires a procedure declaration at the start of the program is useful even though it consumes memory, a resource that is extremely limited on the VIC-20.

Here is the conversion of the example above into Nesic:

```
10 BGN[EXAMPLE 1]

20 PRINT "HELLO WORLD!"

30 END
```

Note line 30 (`END`); in Nesic, this marks the end of a procedure and allows execution to return to the calling procedure. You can think of Nesic procedures somewhat like `GOSUB` routines that jump to alphanumeric labels, with `END` acting like a `RETURN`. In this specific case, omitting the final `END` wouldn't cause an immediate problem—the program would still terminate—but if the `ESEMPIO 1` procedure were called from elsewhere in the program, it would end the entire program upon completion instead of returning to the caller.

### How do you call procedures?

Procedures are called by name. For example, let's create some procedures for a hypothetical washing machine:

```
100 BGN[WASHING MACHINE]

110 [WASH]

120 [RINSE]

130 [SPIN]

140 [STOP]

150 END

160 BGN[WASH]

170 PRINT "ADD DETERGENT"

180 PRINT "FILL WITH WATER"

190 PRINT "HEAT WATER"

200 PRINT "AGITATE"

210 PRINT "DRAIN WATER"

220 END

230 BGN[RINSE]

240 PRINT "FILL WITH WATER"

250 PRINT "AGITATE"

260 PRINT "DRAIN WATER"

270 END

280 BGN[SPIN]

290 PRINT "SPIN"

300 END

310 BGN[STOP]

320 PRINT "WASHING COMPLETE!"

330 END
```

Running this will yield:

```
ADD DETERGENT

FILL WITH WATER

HEAT WATER

AGITATE

DRAIN WATER

FILL WITH WATER

AGITATE

DRAIN WATER

SPIN

WASHING COMPLETE!
```

As you can see, the structure is very clear—partly because I placed one instruction per line, though multiple instructions can be included on a single line, just as in standard BASIC. For example, the STOP procedure can be written like this:

```
310 BGN[STOP]:PRINT "WASHING COMPLETE!":END
```

However, procedures can also be called directly—for instance, by typing:

```
[RINSE]
```

The result will be the following output:

```
FILL WATER

AGITATE

DRAIN WATER
```

Typing `RUN[RINSE]` yields a similar result; however, `RUN` executes a procedure while clearing variables, just like a standard BASIC `RUN` command.

### Can parameters be passed?

Nesic allows parameters to be passed to procedures. For example:

```
10 BGN[TEST PARAMETER]

20 [NAME],"PIPPO"

30 END

40 BGN[NAME],N$

50 PRINT "HELLO ";N$;"!"

60 END
```

Running this will produce:

```
HELLO PIPPO!
```

But we could also type:

```
[NAME],"SERGIO"
```

or:

```
RUN[NAME],"SERGIO"
```

and we would still get:

```
HELLO SERGIO!
```

In this case, as you may have noticed, the parameter allows a different name to be specified.

However, if you type `[NAME]` or `RUN[NAME]`—that is, calling the procedure without specifying parameters—you will get:

```
?SYNTAX

ERROR IN 40
```

because the parameter required by the procedure at line 40 was not provided.

Keep in mind that, although using parameters makes programming easier, the variables involved are standard BASIC variables; therefore, they are global variables.

### Nested procedures

As we saw in the washing machine example, it is possible to nest multiple procedures.

Let's look at this simplified example:

```
10 BGN[NESTED]

20 PRINT "BEFORE"

30 [NESTED PROC]

40 PRINT "AFTER"

50 END

60 BGN[NESTED PROC]

70 PRINT "NESTED"

80 END
```

Running this will produce:

```
BEFORE

NESTED

AFTER
```

But now let's try this variation:

at line 80, type:

```
80 END[NESTED]
```

Running this will produce:

```
BEFORE

NESTED
```

This is because we terminated the previous procedure — in our case, the main one, `NESTED `— rather than the `NESTED PROC` procedure; consequently, the code following the call to `NESTED PROC` is not executed.

### Repeating a procedure

You might need to repeat the execution of a procedure continuously — for example, for a game's main loop. In such cases, we can use `AGAIN` instead of `END`.

For instance, at line 80, write:

```
80 AGAIN
```

Running this will produce:

```
BEFORE

NESTED

NESTED

NESTED

NESTED

NESTED

NESTED

NESTED

NESTED
```

...and so on, until we stop the program using RUN/STOP.

This happens because, once the `NESTED PROC` procedure is entered, it repeats indefinitely.

### But what if we want to exit the procedure?

It's simple: we can do so based on a specific condition, using either `END` or `END[procedure]`. For example, let's add:

```
75 IF FIRE END
```

In this case, we will exit by pressing the joystick's FIRE button; pressing this button triggers the execution of the `END` instruction.

Upon running the program (`RUN`), we get:

```
BEFORE

NESTED

NESTED

NESTED

NESTED

NESTED
...

NESTED

NESTED

NESTED

AFTER
```

So, after an indefinite series of `NESTED` outputs, pressing the FIRE button exits the loop, and the word `AFTER` is printed.

### What if, instead of continuing, we want to start everything over from the beginning?

In that case, instead of `END`, we can write `AGAIN[NESTED]`. This will execute the main procedure `NESTED` again from the start.

Let's change line 75 to:

```
75 IF FIRE AGAIN[NESTED]
```

Upon running the program, we get:

```
PRIMA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA

ANNIDATA
```

When we press FIRE, we get:

```
PRIMA

ANNIDATA

PRIMA

ANNIDATA

PRIMA

ANNIDATA

PRIMA

ANNIDATA
```

...and so on, until we terminate the program.

### And what if we want to exit the program entirely?

As we saw in previous examples, we simply need to terminate the main procedure.

Let's change line 75 to:

```
75 IF FIRE END[NESTED]
```

In this case, pressing the FIRE button terminates the procedure named `NESTED`. Since it is the main procedure, this results in exiting the program.

As you can see, there is another unique feature distinguishing Nesic from standard BASIC: **the `THEN` keyword in an `IF` statement is optional**.

**Optional? Almost!** There are exceptions, though I have rarely encountered them.

For example:

```
IF A=B C=1
```

This will fail because in BASIC (and therefore in Nesic), spaces do not count as delimiters.

The line is interpreted like this:

```
IFA=BC=1
```

This involves a variable named `BC`, so you won't get the result you intended. There are two solutions in such cases: either include `THEN` or, more simply, use a colon (`:`):

```
IF A=B:C=1
```

This works perfectly and saves space on the line compared to using `THEN` (though not in terms of memory, since the `:` takes up one byte, just like the `THEN` token). So, if you are in doubt or notice strange behavior with an `IF` statement, just insert a `:` to resolve the issue.

