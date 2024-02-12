
loot_table ~/ {
    "pools": [{ "rolls": 1, "entries": [{ "type": "minecraft:item",
        "name": "minecraft:warped_fungus_on_a_stick",
        "functions": [
            {
                "function": "minecraft:set_nbt",
                "tag": "{psdpj11:{artifact:4},CustomModelData:2557424,Unbreakable:1b,HideFlags:6,AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.offhand\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,11],Slot:\"offhand\"}]}"
            },
            {
                "function": "minecraft:set_name",
                "name": { "translate": "psdpj11.artifact.size.name", "italic": false, "color": "aqua" }
            },
            {
                "function": "minecraft:set_lore",
                "lore": [
                    { "translate": "item.modifiers.offhand", "color": "blue", "italic": false },
                    [{"text":" "},{ "translate": "psdpj11.artifact.size.desc1", "color": "gray", "italic": false }]
                ]
            }
        ]
    }]}]
}


function ~/load:
    scoreboard objectives add psdpj11.size dummy


function ~/tick:
    store result score #size psdpj11 scoreboard players get @s psdpj11.size
    store result score @s psdpj11.size data get entity @s Pos[1]
    scoreboard players remove @s psdpj11.size 80
    if score #size psdpj11 = @s psdpj11.size return 0

    if score @s psdpj11.size matches ..-1 function ~/../negative_storage:
        scoreboard players operation #calc psdpj11.size = @s psdpj11.size
        scoreboard players remove #calc psdpj11.size 1000
        scoreboard players set .scale psdpj11.size 1000000
        scoreboard players operation .scale psdpj11.size /= #calc psdpj11.size
        store result storage psdpj11:temp size.scale float -0.0073 scoreboard players add .scale psdpj11.size 1000

    if score @s psdpj11.size matches 0.. function ~/../positive_storage:
        store result storage psdpj11:temp size.scale float 0.03 scoreboard players get @s psdpj11.size

    store result score #ascale psdpj11.size data get storage psdpj11:temp size.scale 100
    if score @s psdpj11.size matches ..-1 store result storage psdpj11:temp size.falldmg float -0.1 scoreboard players get #ascale psdpj11.size
    if score @s psdpj11.size matches 0.. store result storage psdpj11:temp size.falldmg float 0.01 scoreboard players get #ascale psdpj11.size
    scoreboard players add #ascale psdpj11.size 100
    store result storage psdpj11:temp size.check float 0.003001 scoreboard players get #ascale psdpj11.size
    store result storage psdpj11:temp size.dist float 0.00055 scoreboard players get #ascale psdpj11.size

    function ~/../apply_attributes with storage psdpj11:temp size


function ~/remove_attributes:
    attribute @s minecraft:generic.scale modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423
    attribute @s minecraft:player.block_interaction_range modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423
    attribute @s minecraft:player.entity_interaction_range modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423
    attribute @s minecraft:generic.step_height modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423
    attribute @s minecraft:generic.fall_damage_multiplier modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423
    attribute @s minecraft:generic.safe_fall_distance modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423
    attribute @s minecraft:generic.jump_strength modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423
    attribute @s minecraft:generic.movement_speed modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423


function ~/apply_attributes:
    function ~/../remove_attributes
    $attribute @s minecraft:generic.scale modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:player.block_interaction_range modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:player.entity_interaction_range modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.step_height modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.fall_damage_multiplier modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(falldmg) multiply_base
    $attribute @s minecraft:generic.safe_fall_distance modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.jump_strength modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.movement_speed modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $execute unless block ~$(check) ~ ~ air run tp ~-$(dist) ~ ~
    $execute unless block ~-$(check) ~ ~ air run tp ~$(dist) ~ ~
    $execute unless block ~ ~ ~$(check) air run tp ~ ~ ~-$(dist)
    $execute unless block ~ ~ ~-$(check) air run tp ~ ~ ~$(dist)
    # $say $(check)
