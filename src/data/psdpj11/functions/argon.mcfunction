
append function_tag argon:player_hurt_entity {"values":["psdpj11:argon/player_hurt_entity"]}
function ~/player_hurt_entity:
    on attacker scoreboard players operation .artifact psdpj11 = @s psdpj11.artifact

    if score .artifact psdpj11 matches 1 say HIT WITH 1
