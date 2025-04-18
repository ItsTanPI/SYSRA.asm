# SYSRA Level Editor and Sprite Converter

This toolset provides a way to convert PNG-based sprite and level data into optimized assembly format suitable for use in the SYSRA engine.

The editor includes:
- A **sprite converter** to encode 16×16 1-bit PNGs into `DW` tile data
- A **level converter** to parse 16-pixel-tall tilemaps and produce collision + logic arrays
- A system to encode gameplay triggers using pixel colors

---

## Supported Asset Types

### Sprite PNGs
- Format: 1-bit PNG
- Dimensions: 16×16 pixels per sprite
- Encoding: White = visible pixel (bit = 1), Black = empty (bit = 0)
- Output: `DW` arrays representing 16-bit tile scanlines

### Level PNGs
- Height: Must be exactly 16 pixels
- Width: Any number of columns (each column = 1 tile)
- Color: Fully transparent pixels are ignored
- Colored pixels are mapped to logic values via a color-lookup table
- Output:
  - `LEVEL`: Collision data
  - `TILES`: Label references for tile behavior
  - `TILEOFFSETINDEX`: Byte offset for logic tiles

---

## Color Label System

The converter reads pixel color values from the level image and maps them to named logic labels. These labels are used in `TILES` to reference behavior handlers.

**Default color-to-label mappings:**

| Hex RGBA        | Label          |
|-----------------|----------------|
| #008000FF       | BRC            |
| #00FF00FF       | RIGHT          |
| #FFFF00FF       | TRC            |
| #FF0000FF       | TOP            |
| #FF00FFFF       | TLC            |
| #0000FFFF       | LEFT           |
| #000080FF       | BLC            |
| #808080FF       | BOTTOM         |
| #800080FF       | TOPLEFT        |
| #808000FF       | TOPRIGHT       |
| #000032FF       | BOTTOMLEFT     |
| #003200FF       | BOTTOMRIGHT    |
| #FFFFFFFF       | ALLCOVER       |
| #00FFFFFF       | CLOSEM         |
| #80FF00FF       | CLOSELEFT      |
| #00FF80FF       | CLOSERIGHT     |
| #FF8F00FF       | CLOSEMID       |
| #FF8F8FFF       | CLOSETOP       |
| #8F008FFF       | CLOSEBOTTOM    |

These can be changed in the script by editing the `Sprites` dictionary.

---

## How to Use

1. Place all your level and tile PNGs in the `Sprites/` folder.
2. Open `level_converter.py` and adjust the filenames and paths as needed.
3. Run the script with:

```bash
python level_converter.py
