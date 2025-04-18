from PIL import Image
import os

def process_tile(image_path):
    img = Image.open(image_path).convert("1")
    result = []
    for y in range(16):
        row_bits = 0
        for x in range(16):
            pixel = img.getpixel((x, y))
            if pixel == 255:
                row_bits |= (1 << (15 - x))
        hex_row = f"0{row_bits:X}h"
        result.append(hex_row)
    return result

def tile_code(image_dict):
    all_levels = []
    total_words = 0
    
    for direction, image_path in image_dict.items():
        if not os.path.exists(image_path):
            print(f"Warning: {image_path} not found, skipping.")
            continue
        
        hex_values = process_tile(image_path)
        all_levels.append(f"{direction} DW " + ", ".join(hex_values))
        total_words += len(hex_values)
    
    print("\n".join(all_levels))
    return total_words * 2

def process_level_image(image_path):
    if not os.path.exists(image_path):
        raise FileNotFoundError(f"{image_path} not found")

    img = Image.open(image_path).convert("RGBA")
    width, height = img.size
    assert height == 16, "Image height must be exactly 16 pixels (12 usable)."
    
    color_mapping = {
        (0x00, 0x80, 0x00, 255): "BRC",
        (0x00, 0xFF, 0x00, 255): "RIGHT",
        (0xFF, 0xFF, 0x00, 255): "TRC",
        (0xFF, 0x00, 0x00, 255): "TOP",
        (0xFF, 0x00, 0xFF, 255): "TLC",
        (0x00, 0x00, 0xFF, 255): "LEFT",
        (0x00, 0x00, 0x80, 255): "BLC",
        (0x80, 0x80, 0x80, 255): "BOTTOM",
        (0x80, 0x00, 0x80, 255): "TOPLEFT",
        (0x80, 0x80, 0x00, 255): "TOPRIGHT",
        (0x00, 0x00, 0x32, 255): "BOTTOMLEFT",
        (0x00, 0x32, 0x00, 255): "BOTTOMRIGHT",
        (0xFF, 0xFF, 0xFF, 255): "ALLCOVER",
        (0x00, 0xFF, 0xFF, 255): "CLOSEM",
        (0x80, 0xFF, 0x00, 255): "CLOSELEFT",
        (0x00, 0xFF, 0x80, 255): "CLOSERIGHT",
        (0xFF, 0x8F, 0x00, 255): "CLOSEMID",
        (0xFF, 0x8F, 0x8F, 255): "CLOSETOP",
        (0x8F, 0x00, 0x8F, 255): "CLOSEBOTTOM",
    }
    
    level_data = []
    tile_data = []
    tile_offset_index = []
    cumulative_pixel_count = 0
    tile_offset_index.append(str(cumulative_pixel_count))
    
    for x in range(width):
        column_bits = 0
        column_labels = []
        pixel_count = 0
        
        for y in range(height):
            r, g, b, a = img.getpixel((x, y))
            if a > 0:
                column_bits |= (1 << (15 - y))
                pixel_count += 1
                color_key = (r, g, b, a)
                if color_key in color_mapping:
                    column_labels.append(f"OFFSET {color_mapping[color_key]}")
        
        cumulative_pixel_count += pixel_count * 2
        level_data.append(f"0{column_bits:04X}h")
        tile_data.extend(column_labels)
        tile_offset_index.append(str(cumulative_pixel_count))
    
    if level_data:
        for i in range(0, len(level_data), 10):
            if i == 0:
                print("LEVEL DW", ", ".join(level_data[i:i+10]))
            else:
                print("      DW", ", ".join(level_data[i:i+10]))
    
    if tile_data:
        for i in range(0, len(tile_data), 10):
            if i == 0:
                print("TILES DW", ", ".join(tile_data[i:i+10]))
            else:
                print("      DW", ", ".join(tile_data[i:i+10]))
    else:
        print("TILES DW ; No matching tiles found")
    
    if tile_offset_index:
        for i in range(0, len(tile_offset_index), 10):
            if i == 0:
                print("TILEOFFSETINDEX DW", ", ".join(tile_offset_index[i:i+10]))
            else:
                print("                DW", ", ".join(tile_offset_index[i:i+10]))

    total_bytes = (len(level_data) + len(tile_data) + len(tile_offset_index)) * 2
    return level_data, tile_data, tile_offset_index, total_bytes

def calc_total_bytes(Tiles, Sprites, level_data, tile_data, tile_offset_index):
    tiles_bytes = len(Tiles) * 16 * 2
    sprites_bytes = len(Sprites) * 16 * 2
    level_bytes = len(level_data) * 2
    tile_data_bytes = len(tile_data) * 2
    offset_bytes = len(tile_offset_index) * 2

    total = tiles_bytes + sprites_bytes + level_bytes + tile_data_bytes + offset_bytes

    print("\nByte Breakdown:")
    print(f"Tiles:             {len(Tiles)} x 16 DW = {tiles_bytes} bytes")
    print(f"Sprites:           {len(Sprites)} x 16 DW = {sprites_bytes} bytes")
    print(f"Level Data:        {len(level_data)} DW = {level_bytes} bytes")
    print(f"Tile Labels:       {len(tile_data)} DW = {tile_data_bytes} bytes")
    print(f"Tile Offset Index: {len(tile_offset_index)} DW = {offset_bytes} bytes")
    print("==========================================")
    print(f"Total:             {total} bytes")
    return total

# Load this data with the matching file paths
Tiles = {
    "LEFT": "Sprites/LEFT.png",
    "RIGHT": "Sprites/RIGHT.png",
    "BLC": "Sprites/BLC.png",
    "BRC": "Sprites/BRC.png",
    "TOP": "Sprites/TOP.png",
    "TLC": "Sprites/TLC.png",
    "TRC": "Sprites/TRC.png",
    "BOTTOM": "Sprites/BOTTOM.png",
    "TOPLEFT": "Sprites/TOPLEFT.png",
    "TOPRIGHT": "Sprites/TOPRIGHT.png",
    "BOTTOMLEFT": "Sprites/BOTTOMLEFT.png",
    "BOTTOMRIGHT": "Sprites/BOTTOMRIGHT.png",
    "ALLCOVER": "Sprites/ALLCOVER.png",
    "CLOSEM": "Sprites/CLOSEM.png",
    "CLOSELEFT": "Sprites/CLOSELEFT.png",
    "CLOSERIGHT": "Sprites/CLOSERIGHT.png",
    "CLOSEMID": "Sprites/CLOSEMID.png",
    "CLOSETOP": "Sprites/CLOSETOP.png",
    "CLOSEBOTTOM": "Sprites/CLOSEBOTTOM.png",
}

Sprites = {
    "IDLE": "Sprites/tile_0261.png",
    "RUN1": "Sprites/tile_0263.png",
    "RUN2": "Sprites/tile_0262.png",
    "RAISE": "Sprites/tile_0264.png",
    "FALL": "Sprites/tile_0265.png",
    "DEAD": "Sprites/tile_0266.png",
    "SPIKE": "Sprites/SPIKE.png",
    "ENEMYHORN1": "Sprites/tile_0321.png",
    "ENEMYHORN2": "Sprites/tile_0322.png",
    "FLYINGENEMY1": "Sprites/tile_0383.png",
    "FLYINGENEMY2": "Sprites/tile_0384.png",
    "CHECKPOINT1": "Sprites/CheckPoint1.png",
    "CHECKPOINT2": "Sprites/CheckPoint2.png",
}

# Run conversion and analysis
tile_code(Tiles)
print()
tile_code(Sprites)
print()
level_data, tile_data, tile_offset_index, _ = process_level_image("Sprites/Level1.png")
calc_total_bytes(Tiles, Sprites, level_data, tile_data, tile_offset_index)