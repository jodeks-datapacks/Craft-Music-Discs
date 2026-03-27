# Append blank
function craft_music_discs:image/process/append/blank

data modify storage craft_music_discs:image data.tellraw append \
  from storage craft_music_discs:image data.current.description_text

# Append blank
function craft_music_discs:image/process/append/blank

# Append line_break
execute unless score $index.image_data craft_music_discs.image = $length craft_music_discs.image \
  run function craft_music_discs:image/process/append/line_break

# Remove first element from the description
data remove storage craft_music_discs:image data.current.description[0]
 