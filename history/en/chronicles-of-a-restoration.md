# 📜 Chronicles of a Restoration Recovering Nesic

The release of Nesic v2.4 is not merely the launch of a programming language; it is the culmination of a software archaeology adventure spanning over forty years. It is the story of code that risked vanishing into oblivion but was saved, piece by piece.

### 📼 The Lost Tape, Moves, and Version 1.4

In the 1980s, the standard storage medium for the Commodore VIC-20 was the audio cassette. The entire original Nesic development suite, completed in 1984, resided on a magnetic tape that was irretrievably lost over the years.

From its development days in Vicenza to its current home in the province of Padua, the project survived no fewer than three moves. As the old saying goes, three moves are as bad as a fire it is a miracle that the paper records survived decades of packing boxes and reorganizations.

The first tentative attempt at digital recovery was made possible by a backup copy kept by my brother (who lives over 200 km away). Unfortunately, that cassette contained only an old version 1.4 an embryonic prototype featuring only basic structural commands and lacking any of the advanced optimizations.

### ✉️ Rejection by the Publishers of the Era

In 1984, proud of the work I had completed, I wrote to the renowned magazine MC-microcomputer, describing the language's potential. I was ready to send the editorial team a custom-built hardware board containing an EPROM so they could test it firsthand. Unfortunately, the magazine showed no interest in the project at the time. Disappointed by the lack of response, I decided to shelve the Nesic project. It was understandable, after all by 1984, the VIC-20 was in decline, overshadowed by Commodore’s new star, the C64. Furthermore, in addition to the language cartridge, the Nesic required at least 8KB of RAM expansion—and thus a bus capable of accommodating both. Few users back then would have actually been able to try it out.

### 📄 The stacks of paper and the re-typing process

The recent breakthrough came with the discovery of a massive stack of old paper printouts from 1984. Among those sheets were the two original source code files written in Mikro Assembler (split into two separate sections at the time because the VIC-20’s 16KB RAM expansion couldn't handle overly long listings). Initial inspection revealed the printouts were incomplete, but the missing pages turned up months later, hidden away in completely different boxes.

Thus began the monumental task of manually re-typing the code line by line within the VICE emulator, using the original Mikro Assembler environment. This phase was an obstacle course fraught with hundreds of typos, nearly illegible pencil corrections from the era, and a fading memory of the code's logic and flow.

### 🧠 The missing piece Reconstructing from memory

Once the paper source code had been successfully compiled, a final realization emerged the listing did not represent the final 1984 release, but rather an earlier version. Entirely missing were the parameter passing to procedures and the complete error-handling infrastructure, as well as the option for an optional `THEN` clause.

Fortunately, I still had printouts of the final test programs from back then. Based on those tests, I knew exactly how the language was supposed to behave. Memory helped me reconstruct the parameter-passing mechanism I recalled that, in 1984, I had solved the problem by implementing a low-level routine that executed a series of repeated `LET` instructions, sequentially mapping the values ​​passed to the procedure. This insight from the past allowed me to rewrite the missing features from scratch in CBM prg Studio, merging the two code segments into a single, modern source file and finally bringing Nesic v2.4 to light after 40 years.
