#> craft_music_discs:image/process/generate
#
# This function generates the image data.

data modify storage craft_music_discs:image data.current.image_data set from storage craft_music_discs:image data.image_data
data modify storage craft_music_discs:image data.current.description set from storage craft_music_discs:image data.description
data modify storage craft_music_discs:image data.current.pixel_character set from storage craft_music_discs:image data.pixel_character.pixel

# Reset index score
scoreboard players set $index.image_data craft_music_discs.image 0
# Set width
execute store result score $width craft_music_discs.image run data get storage craft_music_discs:image data.width
# Set height
execute store result score $height craft_music_discs.image run data get storage craft_music_discs:image data.height
# Set length
scoreboard players operation $length craft_music_discs.image = $width craft_music_discs.image
scoreboard players operation $length craft_music_discs.image *= $height craft_music_discs.image
# Clear remaining entries in tellraw
data remove storage craft_music_discs:image data.tellraw

# Add spacing on top
function craft_music_discs:image/process/append/line_break
# Loop over image data
function craft_music_discs:image/process/loop_over_image_data
# Add spacing on bottom
function craft_music_discs:image/process/append/line_break