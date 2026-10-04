# NESIC (NEsic Is Not baSIC)

> **[🇮🇹 Leggi la documentazione in Italiano**](README.it.md)

**NESIC** (*NEsic is not baSIC*) is a structured programming language designed for the **Commodore VIC-20**.

Originally conceived and developed in **1984**, the project was initially forced into premature retirement due to the severe physical memory limitations of the unexpanded VIC-20, which required splitting the source code into two separate parts to be assembled via *Mikro Assembler*.

After decades of being lost, the original source code has been meticulously recovered from period printouts. The incomplete fragments have been merged, fully restored, and enhanced with new modern features, moving the entire development workflow to **CBM prg Studio**.

## 🚀 Key Features

- 🧩 **Structured Programming:** Say goodbye to `GOTO` and `GOSUB` spaghetti code. NESIC introduces clean, readable structured control flows.

- 💾 **Commodore BASIC 2.0 Compatibility:** Built to make any VIC-20 programmer feel right at home, allowing you to reuse familiar syntax and core commands.

- 🔌 **Evolved `SYS` Extensions:** A powerful `SYS` call that doesn't just execute machine language routines, but handles parameter passing and returns values directly, acting as a native extension mechanism for the language.

## 📋 Memory Requirements & Hardware Context

NESIC was originally developed in 1984 on a **Commodore VIC-20 equipped with a 16 KB RAM expansion**. Due to the advanced custom graphics features, the environment has strict memory prerequisites:

- **Base Machine:** Commodore VIC-20 (PAL/NTSC).

- **RAM Expansion:** Requires **at least an 8 KB RAM expansion** (or higher, like 16 KB/24 KB).

- **Important Note on Memory:** The integrated graphics routines isolate and allocate **2 KB** of RAM exclusively for video memory. On an unexpanded VIC-20, this would leave only 1.5 KB of free RAM, making it unusable.

- **3 KB Expansions:** A 3 KB RAM expansion **will be ignored** as it is architecturally insufficient and incompatible with the memory layout required by the interpreter.

- **Emulation:** Fully compatible with **VICE** (xvic) or real hardware.

## 🛠️ How to Compile and Run

### Compiling from Source

1. Download and install [CBM prg Studio](http://ajordison.co.uk/).

2. Clone this repository or download the source files.

3. Open `source/nesic.asm` inside CBM prg Studio.

4. Set the target tool to **VIC-20** with the appropriate memory expansion.

5. Press **Build** (F2) to generate the executable `.prg` file.

### Running the Interpreter

Load the compiled binary file nesic-blk5-2.4.0.crt or nesic-blk5-2.4.0.prg into your favorite emulator as a cartridge in Block 5, or onto a real VIC-20.

## 📚 Language Syntax Overview

NESIC bridges the gap between old-school Commodore environments and structured programming.

### Control Structures

Instead of relying heavily on line numbers, NESIC utilizes procedures and modern flow controls like **`IF ... THEN ... ELSE`** blocks for clean branching. The use of the THEN statement is optional.

### The Advanced `SYS` Function

The crown jewel of NESIC's architecture is its extensible `SYS` command. It allows you to pass variables directly to 6502 assembly routines and retrieve a result back into the environment:

```
X = SYS($1600, A, B):PRINT "Result from assembly routine: "; X
```

*For an architectural breakdown and a step-by-step tutorial on how to map registers, please refer to the dedicated manual in the `docs/` folder.*

## 📜 Version History & Roadmap

NESIC follows a versioning system that respects its original 1984 development timeline and internal numbering, bridging the gap between historical code and modern enhancements.

### ⏳ Chronology

- **v1.x (1984):** Initial development. Focused strictly on implementing structured language features, delegating standard I/O and secondary operations to Commodore BASIC 2.0.

- **v2.0 – v2.3 (1984):** Expanded architecture. Began adding and replacing native BASIC commands. Version 2.3 (~3.5 KB) was the last known incomplete build preserved on paper printouts before the project went missing.

- **v2.4 (2026 - Current Release):** **The Restoration & Expansion Update.** Fragments from the v2.3 printouts have been fully recovered, merged, and completed. New modern features have been implemented using CBM prg Studio, bringing the interpreter size to ~5.5 KB.

### 🎯 Memory Allocation & Future Development

The interpreter resides in the VIC-20's **Block 5** expansion area (8 KB total capacity).

- Current footprint: **~5.5 KB** occupied.

- Remaining headroom: **~2.5 KB** available for future optimizations and new commands.

### 🗺️ 🤝 Contributing & License

This project is an open-source tribute to retrocomputing history. Feel free to open issues, submit pull requests, or share your own NESIC code examples!

Distributed under the **MIT License**. See `LICENSE` for more information.

*Created by Sergio Neddi — 1984, Restored in 2026.*

