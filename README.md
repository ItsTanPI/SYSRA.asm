# SYSRA: 8086 Assembly Platformer

SYSRA is a modular platformer engine written entirely in 8086 assembly language. It is built for maximum control and low-level optimization, simulating modern gameplay systems under the extreme constraints of real-mode DOS programming.

SYSRA is more than just a game—it is a fully custom, extensible engine with robust subsystems and a complete pipeline for asset creation, rendering, and gameplay logic.

---

## Playable Demo

You can try out a playable demo of SYSRA here:  
[Playable Demo](https://itstanpi.github.io/SYSRA.asm/)

---

## Engine Architecture Overview

**Modular Architecture** – Each engine subsystem (input, physics, rendering, etc.) is designed independently and can be modified or reused without affecting the rest of the system.

**Player Movement System** – Handles directional input, jump logic, variable acceleration, and velocity clamping. Built to feel tight and responsive under low frame rates.

**Player Physics** – Implements gravity, fall speed, and inertia using simplified physics appropriate for tile-based collision.

**Player Collision System** – Pixel-precise collision detection with the level tilemap. Prevents overlapping tiles and triggers reaction logic.

**Entity Collision** – General-purpose collision system that supports interactions between multiple object types (player, enemies, spikes, etc.).

**Entity System** – Modular system for game objects. Supports custom logic, animation states, and condition-triggered behaviors.

**Scrolling Level System** – Supports side-scrolling of large tilemaps by updating only the visible region. Efficient memory paging and VRAM transfers.

**Rendering System** – Uses a software frame buffer with double-buffering support. Optimized draw calls for sprites and tiles.

**1-Bit Sprite Animation** – All sprite graphics are 1-bit encoded and animated using frame index logic. Each sprite is 16×16 pixels.

**Frame Buffer & Swapping** – Back-buffer rendering with manual page flipping to ensure smooth, tear-free display.

**Checkpoint System** – Allows the player to respawn at designated points. Each checkpoint stores position and game state flags.

**Custom Tilemap Support** – Tilemaps are generated from PNG files using an external Python tool. Levels support special logic tiles via a color-coding system.

**Optimized for Size and Speed** – All code is written with performance and minimal memory usage in mind. Built to run on real 8086 hardware or accurate emulators.

---

## Requirements

- Assembler: MASM or NASM
- Emulator: DOSBox, 86Box, or real hardware
- Python 3.6+ for asset conversion
- Image editor like Aseprite or GIMP for creating sprites and levels

---

## Getting Started

1. Write or update a level PNG or sprite PNG in `Sprites/`.
2. Run `level_converter.py` in the `LevelEditor` directory to convert assets to `.ASM` format.
3. Assemble the `.ASM` files using your preferred assembler.
4. Run in DOSBox or other 8086-compatible environment.

---


## Author

Created by **Shri Hari (TanPi)**  
A game developer with a passion for low-level systems, performance engineering, and full control over every pixel and bit.

---

## Special Thanks

A big thank you to **Leonardo Ono** for providing the `keyboard.asm` input handler, which was used for the input system in SYSRA.  
[GIT LINK](https://github.com/leonardo-ono/Assembly8086KeyboardInputHandlerINT9h)

Thanks to Kenney assets for provide the art
[Asset] (https://kenney.nl/assets/1-bit-platformer-pack)