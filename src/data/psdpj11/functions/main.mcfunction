
append function_tag load:load {"values":["psdpj11:load"]}
function ./load:
    scoreboard objectives add psdpj11 dummy
    scoreboard objectives add psdpj11.artifact dummy

    function ./artifact/mining/load
    function ./artifact/speedfood/load
    function ./artifact/size/load

    function ./tick


function ./tick:
    schedule function ~/ 1t replace
    as @a[scores={psdpj11.artifact=1},predicate=./artifact/mining/mined_block] at @s function ./artifact/mining/mined_block
    as @a[scores={psdpj11.artifact=2}] unless score @s psdpj11.speedfood.food = @s psdpj11.speedfood.food2 function ./artifact/speedfood/adjust
    as @a[scores={psdpj11.artifact=3}] at @s if entity @s[y=0,dy=-100000000] function ./artifact/voidfall/tick
    as @a[scores={psdpj11.artifact=4}] at @s function ./artifact/size/tick


# advancement ./player_join {
#     "criteria": {
#         "requirement": {
#             "trigger": "minecraft:tick"
#         }
#     },
#     "rewards": {
#         "function": "psdpj11:player_join"
#     }
# }
# function ~/player_join:
#     scoreboard players set @s psdpj11.speedfood.food2 -2
