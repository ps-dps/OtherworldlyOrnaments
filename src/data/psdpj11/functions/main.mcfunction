
append function_tag load:load {"values":["psdpj11:load"]}
function ./load:
    scoreboard objectives add psdpj11 dummy
    scoreboard objectives add psdpj11.artifact dummy

    function ./artifact/mining/load

    function ./tick


function ./tick:
    schedule function ~/ 1t replace
    as @a[scores={psdpj11.artifact=1},predicate=./artifact/mining/mined_block] at @s function ./artifact/mining/mined_block
