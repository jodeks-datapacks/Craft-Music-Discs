scoreboard objectives add jodek.config dummy
execute unless score &craft_music_discs_load_message jodek.config = &craft_music_discs_load_message jodek.config run scoreboard players set &craft_music_discs_load_message jodek.config 1
execute unless score &craft_music_discs_advancements jodek.config = &craft_music_discs_advancements jodek.config run scoreboard players set &craft_music_discs_advancements jodek.config 1

scoreboard objectives add craft_music_discs.image dummy

# Print the image
function craft_music_discs:config/image