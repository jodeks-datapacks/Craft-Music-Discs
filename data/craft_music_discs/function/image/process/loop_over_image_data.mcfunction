# Copy current pixel
data modify storage craft_music_discs:image data.current.pixel_color set \
  from storage craft_music_discs:image data.current.image_data[0]
data modify storage craft_music_discs:image data.current.description_text set \
  from storage craft_music_discs:image data.current.description[0]

scoreboard players add $index.image_data craft_music_discs.image 1

# Calculate column
scoreboard players operation $index.column craft_music_discs.image = $index.image_data craft_music_discs.image
scoreboard players operation $index.column craft_music_discs.image %= $width craft_music_discs.image

# Calculate row
scoreboard players operation $index.row craft_music_discs.image = $index.image_data craft_music_discs.image
scoreboard players operation $index.row craft_music_discs.image /= $width craft_music_discs.image

# Append start spacing
execute if score $index.column craft_music_discs.image matches 1 run \
  function craft_music_discs:image/process/append/blank

# Append colored pixel
execute unless data storage craft_music_discs:image data.current{pixel_color: ''} run \
  function craft_music_discs:image/process/append/pixel
# Append background pixel
execute if data storage craft_music_discs:image data.current{pixel_color: ''} run \
  function craft_music_discs:image/process/append/background

# Append description
execute if score $index.column craft_music_discs.image matches 0 run \
    function craft_music_discs:image/process/image_end/description

# Remove first element from the image_data array
data remove storage craft_music_discs:image data.current.image_data[0]
# Loop over rows
execute if score $index.row craft_music_discs.image < $height craft_music_discs.image run \
  function craft_music_discs:image/process/loop_over_image_data
 