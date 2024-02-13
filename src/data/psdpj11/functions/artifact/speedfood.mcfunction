
loot_table ~/ {
    "pools": [{ "rolls": 1, "entries": [{ "type": "minecraft:item",
        "name": "minecraft:warped_fungus_on_a_stick",
        "functions": [
            {
                "function": "minecraft:set_nbt",
                "tag": "{psdpj11:{artifact:2},CustomModelData:2557422,Unbreakable:1b,HideFlags:6,AttributeModifiers:[{AttributeName:\"minecraft:generic.luck\",Name:\"tungsten.offhand\",Amount:-0.000000000001,Operation:0,UUID:[I;12,42069,-0,11],Slot:\"offhand\"}]}"
            },
            {
                "function": "minecraft:set_name",
                "name": { "translate": "psdpj11.artifact.speedfood.name", "italic": false, "color": "light_purple" }
            },
            {
                "function": "minecraft:set_lore",
                "lore": [
                    { "translate": "item.modifiers.offhand", "color": "blue", "italic": false },
                    [{"text":" "},{ "translate": "psdpj11.artifact.speedfood.desc1", "color": "gray", "italic": false }],
                    [{"text":" "},{ "translate": "psdpj11.artifact.speedfood.desc2", "color": "gray", "italic": false }],
                    [{"text":" "},{ "translate": "psdpj11.artifact.speedfood.desc3", "color": "gray", "italic": false }]
                ]
            }
        ]
    }]}]
}


function ~/load:
    scoreboard objectives add psdpj11.speedfood.food food
    scoreboard objectives add psdpj11.speedfood.food2 dummy


function ~/adjust:
    unless score @s psdpj11.speedfood.food = @s psdpj11.speedfood.food return 0
    scoreboard players operation @s psdpj11.speedfood.food2 = @s psdpj11.speedfood.food
    scoreboard players set #speedfood psdpj11 20
    store result storage psdpj11:temp speedfood.food float 0.13 store result storage psdpj11:temp speedfood.jump float -0.02 scoreboard players operation #speedfood psdpj11 -= @s psdpj11.speedfood.food
    function ~/../apply with storage psdpj11:temp speedfood


function ~/clear_attributes:
    attribute @s minecraft:generic.movement_speed modifier remove e8fe79f5-d1f9-4a77-8ab5-255769422
    attribute @s minecraft:generic.jump_strength modifier remove e8fe79f5-d1f9-4a77-8ab5-255769422


function ~/apply:
    function ~/../clear_attributes
    $attribute @s minecraft:generic.movement_speed modifier add e8fe79f5-d1f9-4a77-8ab5-255769422 psdpj11.speedfood $(food) multiply
    $attribute @s minecraft:generic.jump_strength modifier add e8fe79f5-d1f9-4a77-8ab5-255769422 psdpj11.speedfood $(jump) multiply
