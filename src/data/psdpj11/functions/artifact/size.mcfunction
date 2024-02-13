
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
    store result score #posy psdpj11.size store result score @s psdpj11.size data get entity @s Pos[1] 2
    scoreboard players add @s psdpj11.size 318 # from 0 to 896 + 190 | from 190 to 1086
    if score @s psdpj11.size matches ..189 scoreboard players set @s psdpj11.size 190
    if score @s psdpj11.size matches 1087.. scoreboard players set @s psdpj11.size 1086
    scoreboard players operation #x psdpj11.size = @s psdpj11.size
    scoreboard players operation @s psdpj11.size *= #x psdpj11.size
    scoreboard players operation @s psdpj11.size *= #x psdpj11.size # ^ 3
    if score #size psdpj11 = @s psdpj11.size return 0

    scoreboard players remove @s psdpj11.size ((288+190) ** 3) # to scale centered on 0 (pos & neg)
    store result storage psdpj11:temp size.scale float ( 1 / ((288+190) ** 3 )) scoreboard players get @s psdpj11.size
    scoreboard players add @s psdpj11.size ((288+190) ** 3) # back to scale centered on 1 (pos only)
    store result storage psdpj11:temp size.check float (0.3001 / ((288+190) ** 3)) scoreboard players get @s psdpj11.size
    store result storage psdpj11:temp size.dist float (0.055 / ((288+190) ** 3 )) scoreboard players get @s psdpj11.size
    store result storage psdpj11:temp size.off1 float (0.3 / ((288+190) ** 3 )) scoreboard players get @s psdpj11.size
    store result storage psdpj11:temp size.off2 float (0.2 / ((288+190) ** 3 )) scoreboard players get @s psdpj11.size
    store result storage psdpj11:temp size.off3 float (0.1 / ((288+190) ** 3 )) scoreboard players get @s psdpj11.size

    scoreboard players add #posy psdpj11.size (128 + 400)
    if score #posy psdpj11.size matches ..399 scoreboard players set #posy psdpj11.size 400
    if score #posy psdpj11.size matches 1297.. scoreboard players set #posy psdpj11.size 1296
    scoreboard players set #x2 psdpj11.size (1296 + 400)
    store result score #x3 psdpj11.size scoreboard players operation #x2 psdpj11.size -= #posy psdpj11.size
    scoreboard players operation #x2 psdpj11.size *= #x3 psdpj11.size
    scoreboard players operation #x2 psdpj11.size *= #x3 psdpj11.size
    scoreboard players remove #x2 psdpj11.size ((1008) ** 3)
    store result storage psdpj11:temp size.fall float ( 1 / ((1008) ** 3 )) scoreboard players get #x2 psdpj11.size

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
    attribute @s minecraft:generic.gravity modifier remove e8fe79f5-d1f9-4a77-8ab5-255769423


function ~/apply_attributes:
    function ~/../remove_attributes
    $attribute @s minecraft:generic.scale modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:player.block_interaction_range modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:player.entity_interaction_range modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.step_height modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.fall_damage_multiplier modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(fall) multiply_base
    $attribute @s minecraft:generic.safe_fall_distance modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.jump_strength modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.movement_speed modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base
    $attribute @s minecraft:generic.gravity modifier add e8fe79f5-d1f9-4a77-8ab5-255769423 psdpj11.size $(scale) multiply_base

    $execute at @s unless block ~$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~-$(dist) ~ ~
    $execute at @s unless block ~-$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~$(dist) ~ ~
    $execute at @s unless block ~ ~ ~$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~-$(dist)
    $execute at @s unless block ~ ~ ~-$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~$(dist)
    $execute at @s positioned ~ ~ ~$(off3) unless block ~$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~-$(dist) ~ ~
    $execute at @s positioned ~ ~ ~-$(off3) unless block ~$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~-$(dist) ~ ~
    $execute at @s positioned ~ ~ ~$(off3) unless block ~-$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~$(dist) ~ ~
    $execute at @s positioned ~ ~ ~-$(off3) unless block ~-$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~$(dist) ~ ~
    $execute at @s positioned ~$(off3) ~ ~ unless block ~ ~ ~$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~-$(dist)
    $execute at @s positioned ~-$(off3) ~ ~ unless block ~ ~ ~$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~-$(dist)
    $execute at @s positioned ~$(off3) ~ ~ unless block ~ ~ ~-$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~$(dist)
    $execute at @s positioned ~-$(off3) ~ ~ unless block ~ ~ ~-$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~$(dist)
    $execute at @s positioned ~ ~ ~$(off1) unless block ~$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~-$(dist) ~ ~
    $execute at @s positioned ~ ~ ~$(off2) unless block ~$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~-$(dist) ~ ~
    $execute at @s positioned ~ ~ ~-$(off2) unless block ~$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~-$(dist) ~ ~
    $execute at @s positioned ~ ~ ~-$(off1) unless block ~$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~-$(dist) ~ ~
    $execute at @s positioned ~ ~ ~$(off1) unless block ~-$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~$(dist) ~ ~
    $execute at @s positioned ~ ~ ~$(off2) unless block ~-$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~$(dist) ~ ~
    $execute at @s positioned ~ ~ ~-$(off2) unless block ~-$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~$(dist) ~ ~
    $execute at @s positioned ~ ~ ~-$(off1) unless block ~-$(check) ~ ~ #psdpj11:artifact/size/walk_through run tp ~$(dist) ~ ~
    $execute at @s positioned ~$(off1) ~ ~ unless block ~ ~ ~$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~-$(dist)
    $execute at @s positioned ~$(off2) ~ ~ unless block ~ ~ ~$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~-$(dist)
    $execute at @s positioned ~-$(off2) ~ ~ unless block ~ ~ ~$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~-$(dist)
    $execute at @s positioned ~-$(off1) ~ ~ unless block ~ ~ ~$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~-$(dist)
    $execute at @s positioned ~$(off1) ~ ~ unless block ~ ~ ~-$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~$(dist)
    $execute at @s positioned ~$(off2) ~ ~ unless block ~ ~ ~-$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~$(dist)
    $execute at @s positioned ~-$(off2) ~ ~ unless block ~ ~ ~-$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~$(dist)
    $execute at @s positioned ~-$(off1) ~ ~ unless block ~ ~ ~-$(check) #psdpj11:artifact/size/walk_through run tp ~ ~ ~$(dist)

    # $particle flame ~$(off1) ~ ~$(check) 0 0 0 0 0
    # $particle flame ~$(off2) ~ ~$(check) 0 0 0 0 0
    # $particle flame ~$(off3) ~ ~$(check) 0 0 0 0 0
    # $particle flame ~ ~ ~$(check) 0 0 0 0 0
    # $particle flame ~-$(off3) ~ ~$(check) 0 0 0 0 0
    # $particle flame ~-$(off2) ~ ~$(check) 0 0 0 0 0
    # $particle flame ~-$(off1) ~ ~$(check) 0 0 0 0 0
    # $particle flame ~$(off1) ~ ~-$(check) 0 0 0 0 0
    # $particle flame ~$(off2) ~ ~-$(check) 0 0 0 0 0
    # $particle flame ~$(off3) ~ ~-$(check) 0 0 0 0 0
    # $particle flame ~ ~ ~-$(check) 0 0 0 0 0
    # $particle flame ~-$(off3) ~ ~-$(check) 0 0 0 0 0
    # $particle flame ~-$(off2) ~ ~-$(check) 0 0 0 0 0
    # $particle flame ~-$(off1) ~ ~-$(check) 0 0 0 0 0
    # $particle flame ~$(check) ~ ~$(off1) 0 0 0 0 0
    # $particle flame ~$(check) ~ ~$(off2) 0 0 0 0 0
    # $particle flame ~$(check) ~ ~$(off3) 0 0 0 0 0
    # $particle flame ~$(check) ~ ~ 0 0 0 0 0
    # $particle flame ~$(check) ~ ~-$(off3) 0 0 0 0 0
    # $particle flame ~$(check) ~ ~-$(off2) 0 0 0 0 0
    # $particle flame ~$(check) ~ ~-$(off1) 0 0 0 0 0
    # $particle flame ~-$(check) ~ ~$(off1) 0 0 0 0 0
    # $particle flame ~-$(check) ~ ~$(off2) 0 0 0 0 0
    # $particle flame ~-$(check) ~ ~$(off3) 0 0 0 0 0
    # $particle flame ~-$(check) ~ ~ 0 0 0 0 0
    # $particle flame ~-$(check) ~ ~-$(off3) 0 0 0 0 0
    # $particle flame ~-$(check) ~ ~-$(off2) 0 0 0 0 0
    # $particle flame ~-$(check) ~ ~-$(off1) 0 0 0 0 0


block_tag ~/walk_through { # credit to github.com/HeDeAntheonlyone/TagLib
    "replace": false,
    "values": [
        { "required": false, "id": "minecraft:light" },
        { "required": false, "id": "minecraft:structure_void" },
        { "required": false, "id": "minecraft:cobweb" },
        { "required": false, "id": "minecraft:dead_bush" },
        { "required": false, "id": "minecraft:big_dripleaf_stem" },
        { "required": false, "id": "minecraft:small_dripleaf" },
        { "required": false, "id": "minecraft:hanging_roots" },
        { "required": false, "id": "minecraft:kelp_plant" },
        { "required": false, "id": "minecraft:powder_snow" },
        { "required": false, "id": "minecraft:glow_lichen" },
        { "required": false, "id": "minecraft:redstone_wire" },
        { "required": false, "id": "minecraft:repeater" },
        { "required": false, "id": "minecraft:comparator" },
        { "required": false, "id": "minecraft:lever" },
        { "required": false, "id": "minecraft:tripwire_hook" },
        { "required": false, "id": "minecraft:tripwire" },
        { "required": false, "id": "minecraft:sculk_vein" },
        { "required": false, "id": "minecraft:frogspawn" },
        { "required": false, "id": "#minecraft:wool_carpets" },
        { "required": false, "id": "#minecraft:signs" },
        { "required": false, "id": "#minecraft:rails" },
        { "required": false, "id": "#minecraft:buttons" },
        { "required": false, "id": "#minecraft:pressure_plates" },
        { "required": false, "id": "#minecraft:banners" },
        { "required": false, "id": "#minecraft:saplings" },
        { "required": false, "id": "#minecraft:crops" },
        { "required": false, "id": "#minecraft:small_flowers" },
        { "required": false, "id": "#minecraft:tall_flowers" },
        { "required": false, "id": "#minecraft:fire" },
        { "required": false, "id": "minecraft:air" },
        { "required": false, "id": "minecraft:cave_air" },
        { "required": false, "id": "minecraft:void_air" },
        { "required": false, "id": "minecraft:grass" },
        { "required": false, "id": "minecraft:tall_grass" },
        { "required": false, "id": "minecraft:seagrass" },
        { "required": false, "id": "minecraft:tall_seagrass" },
        { "required": false, "id": "minecraft:fern" },
        { "required": false, "id": "minecraft:large_fern" },
        { "required": false, "id": "minecraft:nether_sprouts" },
        { "required": false, "id": "minecraft:crimson_roots" },
        { "required": false, "id": "minecraft:warped_roots" },
        { "required": false, "id": "#minecraft:corals" },
        { "required": false, "id": "minecraft:brain_coral_fan" },
        { "required": false, "id": "minecraft:bubble_coral_fan" },
        { "required": false, "id": "minecraft:fire_coral_fan" },
        { "required": false, "id": "minecraft:horn_coral_fan" },
        { "required": false, "id": "minecraft:tube_coral_fan" },
        { "required": false, "id": "minecraft:dead_brain_coral" },
        { "required": false, "id": "minecraft:dead_bubble_coral" },
        { "required": false, "id": "minecraft:dead_fire_coral" },
        { "required": false, "id": "minecraft:dead_horn_coral" },
        { "required": false, "id": "minecraft:dead_tube_coral" },
        { "required": false, "id": "minecraft:dead_brain_coral_fan" },
        { "required": false, "id": "minecraft:dead_bubble_coral_fan" },
        { "required": false, "id": "minecraft:dead_fire_coral_fan" },
        { "required": false, "id": "minecraft:dead_horn_coral_fan" },
        { "required": false, "id": "minecraft:dead_tube_coral_fan" },
        { "required": false, "id": "minecraft:dead_brain_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_bubble_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_fire_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_horn_coral_wall_fan" },
        { "required": false, "id": "minecraft:dead_tube_coral_wall_fan" },
        { "required": false, "id": "minecraft:torch" },
        { "required": false, "id": "minecraft:wall_torch" },
        { "required": false, "id": "minecraft:soul_torch" },
        { "required": false, "id": "minecraft:soul_wall_torch" },
        { "required": false, "id": "minecraft:redstone_torch" },
        { "required": false, "id": "minecraft:redstone_wall_torch" },
        { "required": false, "id": "minecraft:vine" },
        { "required": false, "id": "#minecraft:cave_vines" },
        { "required": false, "id": "minecraft:weeping_vines" },
        { "required": false, "id": "minecraft:weeping_vines_plant" },
        { "required": false, "id": "minecraft:twisting_vines" },
        { "required": false, "id": "minecraft:twisting_vines_plant" },
        { "required": false, "id": "minecraft:water" },
        { "required": false, "id": "minecraft:lava" }
    ]
}
