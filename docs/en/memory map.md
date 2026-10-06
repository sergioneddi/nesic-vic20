# MEMORY MAP

Nesic does not use standard RAM settings that vary based on the amount of RAM installed in the computer; instead, it uses a fixed configuration. Specifically, the RAM range from $1000 to $17FF is used for the character map and, optionally, as a space for the user to allocate machine language (ML) routines. In my examples, ML routines are allocated starting at $1600.

Currently, there is no support for true bitmap graphics—only character-based graphics, as is typical for games.

The screen area spans from $1800 to $19FF, while the program area begins at $1A00 and extends across all available RAM.

Any optional 3K RAM expansion mapped to the $0400–$0FFF range **is not used**.

## Summary:

**$0400 - $0FFF:** Optional 3K RAM – if present, **NOT USED**

**$1000 - $17FF:** 2K Character map and optional ML routines (recommended starting at $1600)

**$1800 - $19FF:** 512 bytes (506 actually used) Screen area (22 x 23)

**$1A00 - $????:** Program area occupying all available RAM.

Since Nesic occupies the first 2K of base RAM, using it on a computer without at least an 8K expansion is not recommended; an unexpanded VIC has only 1.5K of available RAM, which is insufficient for any practical use.

In my case, back in 1984 when I developed the language, I had a 16K expansion available.