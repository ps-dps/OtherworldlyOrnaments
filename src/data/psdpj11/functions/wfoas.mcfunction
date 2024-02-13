
function ~/used:
    scoreboard players reset @s psdpj11.wfoas
    unless score @s psdpj11.artifact matches 1.. return 0
    if predicate ~/../ return 0

    store result score #has_tpd psdpj11 function ~/../tp
    if score #has_tpd psdpj11 matches 0 return run tellraw @s {"translate":"psdpj11.teleport.failure","color":"red"}
    at @s playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1

function ~/tp:
    if score @s psdpj11.artifact matches 1 unless dimension minecraft:the_nether in minecraft:the_nether return run spreadplayers ~ ~ 0 40 under 75 false @s
    if score @s psdpj11.artifact matches 1 if dimension minecraft:the_nether in minecraft:overworld return run spreadplayers ~ ~ 0 40 false @s
    if score @s psdpj11.artifact matches 2 unless dimension psdpj11:superflat in psdpj11:superflat return run spreadplayers ~ ~ 0 40 false @s
    if score @s psdpj11.artifact matches 2 if dimension psdpj11:superflat in minecraft:overworld return run spreadplayers ~ ~ 0 40 false @s
    if score @s psdpj11.artifact matches 3 unless dimension minecraft:the_end in minecraft:the_end return run spreadplayers ~ ~ 0 40 false @s
    if score @s psdpj11.artifact matches 3 if dimension minecraft:the_end in minecraft:overworld return run spreadplayers ~ ~ 0 40 false @s
    if score @s psdpj11.artifact matches 4 unless dimension psdpj11:amplified in psdpj11:amplified return run spreadplayers ~ ~ 0 40 false @s
    if score @s psdpj11.artifact matches 4 if dimension psdpj11:amplified in minecraft:overworld return run spreadplayers ~ ~ 0 40 false @s
    return 0


predicate ~/ {
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "equipment": {
            "mainhand": {
                "items": [
                    "minecraft:warped_fungus_on_a_stick"
                ]
            }
        }
    }
}
