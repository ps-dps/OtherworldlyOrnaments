
natural_blocks = [
    'stone','granite','diorite','andesite','tuff','deepslate','netherrack','basalt','blackstone','end_stone','sandstone','red_sandstone',
    'copper_ore','deepslate_copper_ore','iron_ore','deepslate_iron_ore','gold_ore','deepslate_gold_ore','redstone_ore','deepslate_redstone_ore','emerald_ore','deepslate_emerald_ore','lapis_ore','deepslate_lapis_ore','diamond_ore','deepslate_diamond_ore','coal_ore','deepslate_coal_ore',
    'nether_gold_ore','ancient_debris','nether_quartz_ore','obsidian','warped_nylium','crimson_nylium',
    'oak_log','spruce_log','birch_log','jungle_log','acacia_log','dark_oak_log','crimson_stem','warped_stem','cherry_log','mangrove_log',
    'oak_leaves','spruce_leaves','birch_leaves','jungle_leaves','acacia_leaves','dark_oak_leaves','cherry_leaves','mangrove_leaves','azalea_leaves','flowering_azalea_leaves','nether_wart_block','warped_wart_block',
    'dirt','coarse_dirt','podzol','grass_block','mycelium','dirt_path','farmland','soul_sand','soul_soil','gravel','sand','red_sand','clay','snow','ice','packed_ice','blue_ice','magma_block',
    'terracotta','white_terracotta','orange_terracotta','magenta_terracotta','light_blue_terracotta','yellow_terracotta','lime_terracotta','pink_terracotta','gray_terracotta','light_gray_terracotta','cyan_terracotta','purple_terracotta','blue_terracotta','brown_terracotta','green_terracotta','red_terracotta','black_terracotta',
]


loot_table ~/ {
    "pools": [{ "rolls": 1, "entries": [{ "type": "minecraft:item",
        "name": "minecraft:warped_fungus_on_a_stick",
        "functions": [
            {
                "function": "minecraft:set_nbt",
                "tag": "{HideFlags:2,psdpj11:{artifact:1},AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.offhand\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,11],Slot:\"offhand\"}]}"
            },
            {
                "function": "minecraft:set_name",
                "name": { "translate": "psdpj11.artifact.mining.name", "italic": false, "color": "aqua" }
            },
            {
                "function": "minecraft:set_lore",
                "lore": [
                    { "translate": "item.modifiers.offhand", "color": "blue", "italic": false },
                    [{"text":" "},{ "translate": "psdpj11.artifact.mining.desc1", "color": "gray", "italic": false }]
                ]
            }
        ]
    }]}]
}


predicate_scores = []
for block in natural_blocks:
    predicate_scores.append({
        "condition": "minecraft:entity_scores",
        "entity": "this",
        "scores": { f'psdpj11.mined.{block}': { "min": 1 }}
    })
predicate ~/mined_block {
    "condition": "minecraft:any_of",
    "terms": predicate_scores
}


function ~/load:
    for block in natural_blocks:
        scoreboard objectives add f'psdpj11.mined.{block}' f'minecraft.mined:minecraft.{block}'
    scoreboard objectives add psdpj11.mining.level dummy
    scoreboard objectives add psdpj11.mining.clear dummy


function ~/mined_block:
    for block in natural_blocks:
        scoreboard players reset @s f'psdpj11.mined.{block}'
    store result storage psdpj11:temp mining.hunger int .1 store result storage psdpj11:temp mining.level float .01 scoreboard players add @s psdpj11.mining.level 1
    if score @s psdpj11.mining.level matches 400.. data modify storage psdpj11:temp mining.hunger set value 30
    function ~/../apply with storage psdpj11:temp mining
    store result score @s psdpj11.mining.clear schedule function ~/../clear_mining_level 2s append


function ~/clear_mining_level:
    store result score .gametime psdpj11 time query gametime
    as @a[scores={psdpj11.mining.clear=1..}] if score @s psdpj11.mining.clear <= .gametime psdpj11 function ~/../clear_mining_level2:
        attribute @s minecraft:player.block_break_speed modifier remove e8fe79f5-d1f9-4a77-8ab5-255769420
        scoreboard players reset @s psdpj11.mining.level
        scoreboard players reset @s psdpj11.mining.clear


function ~/apply:
    attribute @s minecraft:player.block_break_speed modifier remove e8fe79f5-d1f9-4a77-8ab5-255769420
    $attribute @s minecraft:player.block_break_speed modifier add e8fe79f5-d1f9-4a77-8ab5-255769420 psdpj11.mining $(level) multiply
    $effect give @s hunger 2 $(hunger)