
loot_table ~/ {
    "pools": [{ "rolls": 1, "entries": [{ "type": "minecraft:item",
        "name": "minecraft:warped_fungus_on_a_stick",
        "functions": [
            {
                "function": "minecraft:set_nbt",
                "tag": "{psdpj11:{artifact:3},CustomModelData:2557423,Unbreakable:1b,HideFlags:6,AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.offhand\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,11],Slot:\"offhand\"}]}"
            },
            {
                "function": "minecraft:set_name",
                "name": { "translate": "psdpj11.artifact.voidfall.name", "italic": false, "color": "light_purple" }
            },
            {
                "function": "minecraft:set_lore",
                "lore": [
                    { "translate": "item.modifiers.offhand", "color": "blue", "italic": false },
                    [{"text":" "},{ "translate": "psdpj11.artifact.voidfall.desc1", "color": "gray", "italic": false }],
                    [{"text":" "},{ "translate": "psdpj11.artifact.voidfall.desc2", "color": "gray", "italic": false }],
                    [{"text":" "},{ "translate": "psdpj11.artifact.voidfall.desc3", "color": "gray", "italic": false }]
                ]
            }
        ]
    }]}]
}


item_modifier ~/out_of_this_world {
    "function": "minecraft:set_damage",
    "damage": 0,
    "add": false
}


function ~/tick:
    store result score #voidfall psdpj11 unless block ~ ~ ~ minecraft:note_block[instrument=zombie,powered=true,note=17]
    if score #voidfall psdpj11 matches 0 positioned ~ 0 ~ function ~/../find_top_of_world


function ~/find_top_of_world:
    store result score #voidfall psdpj11 unless block ~ ~ ~ minecraft:note_block[instrument=zombie,powered=true,note=17]
    if score #voidfall psdpj11 matches 0 function ~/../out_of_this_world
    if score #voidfall psdpj11 matches 1 positioned ~ ~1 ~ function ~/


function ~/out_of_this_world:
    tp @s ~ ~ ~
    for i in range(9):
        item modify entity @s f'hotbar.{i}' ~/
    for i in range(27):
        item modify entity @s f'inventory.{i}' ~/
    item modify entity @s armor.head ~/
    item modify entity @s armor.chest ~/
    item modify entity @s armor.feet ~/
    item modify entity @s armor.legs ~/
