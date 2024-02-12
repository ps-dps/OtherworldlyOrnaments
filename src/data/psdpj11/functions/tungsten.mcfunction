
append function_tag tungsten:swap/offhand {"values":["psdpj11:tungsten/offhand"]}

function ~/offhand:
    if score @s psdpj11.artifact matches 2 function ./artifact/speedfood/clear_attributes
    if score @s psdpj11.artifact matches 4 function ./artifact/size/remove_attributes
    store result score @s psdpj11.artifact data get storage tungsten:player Item.tag.psdpj11.artifact
    if score @s psdpj11.artifact matches 1 function ./artifact/mining/clear_scores
    if score @s psdpj11.artifact matches 2 scoreboard players set @s psdpj11.speedfood.food2 -1
    if score @s psdpj11.artifact matches 4 scoreboard players set @s psdpj11.size -999999999
