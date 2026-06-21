# Parameterized N-Bit ALU using Verilog

A flexible, parameterized $N$-bit Arithmetic Logic Unit (ALU) implemented in Verilog. This design supports arithmetic, logical, comparison, and shifting operations controlled by a 4-bit opcode selector (`mode`).

## Features
- **Parameterized Width:** Easily changes data width (default is 4-bit) via a top-level parameter (`bit_width`).
- **Status Flags:** Computes and outputs standard hardware flags: `zero_flag`, `carry_flag`, and `neg_flag` (2's complement compliant).
- **Pure Combinational Logic:** Designed using default initialization to ensure glitch-free, latch-free synthesis.

## Supported Modes

**#1111** >> Reset
**#0000** >> Addition
**#0001** >> Subtraction
**#0010** >> Bitwise AND
**#0100** >> Bitwise OR
**#1000** >> Bitwise XOR
**#0011** >> Less than
**#0110** >> Equal
**#1100** >> Greater than
**#1110** >> in1 Right shift
**#1101** >> in1 Left shift
**#1011** >> in2 Right shift
**#0111** >> in2 Left shift


## Simulation Results

Here is the waveform simulation showing the 2's complement signed decimal representation:

![ALU Waveform Simulation](waveform.png)

Note:
This project uses **Icarus Verilog (iverilog)** for compilation and **GTKWave** for waveform viewing.

