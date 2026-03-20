# Binary Calculator Using Logic Gates

A fully interactive **4-bit Adder & Subtractor Circuit Simulator** implemented in two ways:
- **HTML/CSS/JS** — interactive visual web simulator
- **MATLAB** — command-line implementation of the same algorithm

Both demonstrate binary arithmetic using logic gate principles, with results shown in both **unsigned** and **signed 2's complement** interpretations.

---

## Table of Contents

- [Overview](#overview)
- [Project Files](#project-files)
- [Features](#features)
- [How to Run](#how-to-run)
  - [HTML Version](#html-version)
  - [MATLAB Version](#matlab-version)
- [MATLAB Implementation](#matlab-implementation)
  - [Sample Output](#sample-output)
  - [Improvements Over Original](#improvements-over-original)
- [Project Structure](#project-structure)
- [How It Works](#how-it-works)
  - [XOR Gates for Conditional Inversion](#1-xor-gates-for-conditional-inversion)
  - [Full Adder Logic](#2-full-adder-logic)
  - [2's Complement Subtraction](#3-2s-complement-subtraction)
  - [Unsigned vs Signed Interpretation](#4-unsigned-vs-signed-interpretation)
  - [Overflow Detection](#5-overflow-detection)
- [Test Cases](#test-cases)
- [Key Concepts](#key-concepts)
- [Sections of the App](#sections-of-the-app)
- [Technologies Used](#technologies-used)
- [Learning Outcomes](#learning-outcomes)

---

## Overview

This project simulates a **4-bit binary adder-subtractor** using logic gate principles, mirroring the behavior of real digital circuits found in CPUs and ALUs (Arithmetic Logic Units). The same hardware circuit is used for both addition and subtraction — the mode signal (0 or 1) controls the operation.

Results are always displayed in two ways:
-  **Unsigned** — treats all 4 bits as a positive number (range: 0 to 15)
-  **Signed (2's Complement)** — treats MSB as a sign bit (range: −8 to +7)

---

## Project Files

```
Binary Calculator Project
├── binary_calculator.html   ← Interactive web simulator (open in browser)
├── calculator.m             ← MATLAB command-line implementation
├── README.md                ← This file
└── screenshots/             ← (Add your screenshots here)
    ├── calculator.png
    ├── circuit.png
    ├── home.png
    ├── overflow.png
```

---

---

## Features

| Feature | Description |
|---|---|
| 4-bit Input Toggles | Click individual bits to set inputs A and B |
| Addition / Subtraction | Toggle between modes using the mode switch |
| Dual Decimal Display | Results shown in both unsigned and signed interpretations |
| Step-by-Step Calculation | Tabbed view showing full working for unsigned and signed separately |
| Overflow Detection | Detects and explains signed overflow with true vs wrapped result |
| Circuit Diagram | SVG diagram of the 4-bit adder-subtractor circuit |
| 6 Preloaded Test Cases | Click-to-load examples covering key scenarios |
| Responsive Design | Works on desktop and mobile |
| Educational Explanations | In-depth sections on binary arithmetic fundamentals |

---

## How to Run

### HTML Version

No installation or dependencies required. It is a single self-contained HTML file.

1. Download `binary_calculator.html`
2. Open it in any modern web browser (Chrome, Firefox, Edge, Safari)

```
double-click binary_calculator.html
```

### MATLAB Version

Requires **MATLAB R2016b or later** (uses `bi2de`, `xor`, `input`, `fprintf`).

1. Open MATLAB
2. Navigate to the folder containing `calculator.m`
3. Run the script:

```matlab
calculator
```

4. Follow the input example:
```
Enter first 4-bit binary number A (e.g. [0 1 0 1]): [0 1 1 1]
Enter second 4-bit binary number B (e.g. [0 0 1 1]): [0 0 1 0]
Enter Mode (0 = Addition, 1 = Subtraction): 0
```

---

## MATLAB Implementation

The MATLAB script (`calculator.m`) implements the exact same logic gate algorithm as the HTML version — XOR gates, ripple carry full adders, and overflow detection — but in a command-line environment.

### Sample Output

```
╔══════════════════════════════════════════════════════╗
║   4-BIT BINARY CALCULATOR USING LOGIC GATES          ║
║   Ripple Carry Adder-Subtractor (2's Complement)     ║
╚══════════════════════════════════════════════════════╝

Enter first 4-bit binary number A (e.g. [0 1 0 1]): [1 0 0 0]
Enter second 4-bit binary number B (e.g. [0 0 1 1]): [0 0 0 1]
Enter Mode (0 = Addition, 1 = Subtraction): 0

══════════════════════════════════════════════════════
  CIRCUIT SIMULATION
══════════════════════════════════════════════════════
  Step 1: Conditional Inversion (XOR with Mode=0)
    B        = [0 0 0 1]
    B'       = [0 0 0 1]  (B unchanged)
    Initial Carry = 0

  Step 2: Ripple Carry Addition (bit by bit)
    Bit 0 (FA0): A[0]=0  B'[0]=1  Cin=0  →  Sum=1  Cout=0
    Bit 1 (FA1): A[1]=0  B'[1]=0  Cin=0  →  Sum=0  Cout=0
    Bit 2 (FA2): A[2]=0  B'[2]=0  Cin=0  →  Sum=0  Cout=0
    Bit 3 (FA3): A[3]=1  B'[3]=0  Cin=0  →  Sum=1  Cout=0

══════════════════════════════════════════════════════
  RESULTS
══════════════════════════════════════════════════════
  Result bits  : [1 0 0 1]
  Carry Out    : 0
  Overflow     : 0

  ── Unsigned Interpretation (range: 0 to 15) ──────
    A      = [1 0 0 0]  →  8
    B      = [0 0 0 1]  →  1
    Result = [1 0 0 1]  →  9
    8 + 1 = 9

  ── Signed Interpretation, 2's Complement (range: -8 to +7) ──
    A      = [1 0 0 0]  →  8 - 16 = -8
    B      = [0 0 0 1]  →  1
    Result = [1 0 0 1]  →  9 - 16 = -7
    -8 + 1 = -7  ✓
    ✓ Result fits within signed range [-8, +7]

  ── Overflow Detection ─────────────────────────────
    Carry into MSB  (C3) = 0
    Carry out of MSB (C4) = 0
    Overflow = C3 XOR C4 = 0 XOR 0 = 0
    ✓ No overflow
```

### Improvements Over Original

| Feature | Original `calculator.m` | Updated `calculator.m` |
|---|---|---|
| Input validation | ✗ None | ✓ Loops until valid 4-bit binary entered |
| Unsigned decimal display | ✗ Not shown | ✓ Shows A, B, Result in unsigned |
| Signed decimal display | ✗ Not shown | ✓ Shows conversion (e.g. `8 − 16 = −8`) |
| Step-by-step output | ✗ Not shown | ✓ Shows each full adder bit computation |
| Overflow explanation | ✗ Just prints 0 or 1 | ✓ Shows true answer vs wrapped result |
| Borrow detection note | ✗ Not shown | ✓ Explains carry=0 means borrow in subtraction |
| Formatted output | ✗ Basic `disp` | ✓ Structured sections with separators |

---

## Project Structure

```
binary_calculator.html
│
├── <style>         — All CSS (dark neon theme, layout, animations)
│
├── <body>
│   ├── nav         — Fixed navigation bar
│   ├── #home       — Hero section with project overview
│   ├── #calculator — Interactive 4-bit calculator
│   ├── #circuit    — SVG circuit diagram + educational content
│   ├── #test-cases — 6 preloaded test cases
│   └── #conclusion — Summary and learning outcomes
│
└── <script>        — All JavaScript logic
    ├── toggleBit()         — Handles bit switch clicks
    ├── toggleMode()        — Switches between add/subtract
    ├── fullAdder()         — Single-bit full adder gate logic
    ├── calculate()         — Main calculation + display update
    ├── buildUnsignedSteps()— Generates unsigned step-by-step working
    ├── buildSignedSteps()  — Generates signed step-by-step working
    ├── renderSteps()       — Renders steps into the DOM
    ├── switchTab()         — Switches between unsigned/signed step tabs
    ├── binaryToDecimal()   — Converts bit array to unsigned decimal
    ├── binaryToSignedDecimal() — Converts bit array to signed decimal
    ├── signedLabel()       — Returns conversion string (e.g. "9 − 16 = −7")
    ├── updateOutput()      — Updates result bits, carry, overflow display
    ├── loadTestCase()      — Loads a preset test case into the calculator
    ├── resetCalculator()   — Resets all inputs to 0
    └── drawCircuit()       — Draws SVG circuit diagram
```

---

## How It Works

### 1. XOR Gates for Conditional Inversion

Each bit of input B is passed through an XOR gate with the Mode signal before entering the adder:

```
B'[i] = B[i] XOR Mode

Mode = 0 (Addition):    B'[i] = B[i]        → B is unchanged
Mode = 1 (Subtraction): B'[i] = NOT B[i]    → B is inverted (1's complement)
```

### 2. Full Adder Logic

Each of the 4 bits is processed by a Full Adder:

```
Sum[i]       = A[i] XOR B'[i] XOR Carry_in[i]
Carry_out[i] = (A[i] AND B'[i]) OR (Carry_in[i] AND (A[i] XOR B'[i]))
```

Carries ripple from bit 0 (LSB) to bit 3 (MSB) — this is called a **Ripple Carry Adder**.

### 3. 2's Complement Subtraction

When Mode = 1, the circuit computes `A − B` as `A + (−B)`:

```
Step 1: Invert all bits of B  →  1's complement  (via XOR gates)
Step 2: Add 1 via initial Carry_in = Mode = 1
Result: 1's complement + 1   =  2's complement  = −B
Final:  A + (−B)             =  A − B
```

### 4. Unsigned vs Signed Interpretation

The circuit hardware is **identical** for both. Only the decimal interpretation of the output bits differs:

```
Unsigned:  all 4 bits represent a positive value → range 0 to 15
           1001 = 9

Signed:    MSB has weight −8 instead of +8 → range −8 to +7
           1001 = 1×(−8) + 0×4 + 0×2 + 1×1 = −7

Conversion formula (when MSB = 1):
           signed value = unsigned value − 16
           e.g. 1001 → 9 − 16 = −7
```

### 5. Overflow Detection

Overflow is only relevant for **signed** interpretation. It occurs when the true mathematical result falls outside [−8, +7]:

```
Overflow = Carry_into_MSB XOR Carry_out_of_MSB

Example: 7 + 2 = 9  (overflow, 9 > 7)
  Unsigned: 1001 = 9   ✓ correct
  Signed:   1001 = −7  ✗ wrong — overflow wraps result
```

When overflow is detected, the calculator shows:
- The **true mathematical answer** (e.g. −9)
- The **wrapped circuit output** (e.g. 7)
- An explanation of why the result is incorrect for signed arithmetic

---

## Test Cases

| # | A | B | Mode | Result | Unsigned | Signed | Overflow |
|---|---|---|------|--------|----------|--------|----------|
| 1 | 0011 | 0010 | Add | 0101 | 3+2=5 | 3+2=5 | No |
| 2 | 1001 | 0110 | Add | 1111 | 9+6=15 | −7+6=−1 | No |
| 3 | 0111 | 0011 | Sub | 0100 | 7−3=4 | 7−3=4 | No |
| 4 | 0011 | 0101 | Sub | 1110 | 3−5=14* | 3−5=−2 | No |
| 5 | 0111 | 0010 | Add | 1001 | 7+2=9 | 7+2=−7 ✗ | **Yes** |
| 6 | 0101 | 0101 | Sub | 0000 | 5−5=0 | 5−5=0 | No |

\* Unsigned subtraction wraps mod 16 when A < B (borrow occurs, carry out = 0)

---

## Key Concepts

**Binary Addition Rules**
```
0+0=0 (carry 0)    0+1=1 (carry 0)
1+0=1 (carry 0)    1+1=0 (carry 1)
1+1+1=1 (carry 1)
```

**Carry vs Borrow (in subtraction)**
```
Carry out = 1 → no borrow (A ≥ B)
Carry out = 0 → borrow occurred (A < B), result wraps mod 16
```

**Signed Overflow Conditions**
```
Positive + Positive = Negative  → overflow
Negative + Negative = Positive  → overflow
Positive − Negative = Negative  → overflow  (e.g. 7−(−1) = 8, out of range)
Negative − Positive = Positive  → overflow  (e.g. −8−1 = −9, out of range)
```

---

## Sections of the App

| Section | Description |
|---|---|
| **Home** | Project overview and feature highlights |
| **Calculator** | Interactive 4-bit adder-subtractor with live results and step-by-step view |
| **Circuit** | SVG circuit diagram and in-depth explanation of logic gate operation |
| **Test Cases** | 6 preloaded examples with unsigned and signed values labelled |
| **Conclusion** | Learning outcomes, real-world applications, and further exploration ideas |

---

## Technologies Used

**HTML Version**
- **HTML5** — Structure and layout
- **CSS3** — Dark neon theme, CSS variables, animations, responsive grid
- **Vanilla JavaScript** — All logic gate simulation, calculation, DOM manipulation
- **SVG** — Circuit diagram drawn programmatically via JavaScript

No external libraries, frameworks, or dependencies.

**MATLAB Version**
- **MATLAB R2016b+** — Script-based implementation
- Built-in functions used: `xor()`, `bi2de()`, `input()`, `fprintf()`, `disp()`, `zeros()`

---

## Learning Outcomes

After exploring this simulator you will understand:

- How binary numbers are represented and converted to decimal (signed and unsigned)
- How a Full Adder gate works at the bit level
- How XOR gates enable a single circuit to perform both addition and subtraction
- How 2's complement allows subtraction using only adder hardware
- The difference between unsigned (carry) and signed (overflow) error conditions
- Why the same 4 result bits can mean different decimal values depending on interpretation
- How real-world CPUs use identical hardware for signed and unsigned arithmetic — leaving interpretation to the programmer or compiler

---

Binary Calculator Using Logic Gates | Project Based Learning| Computer Organization and Architecture