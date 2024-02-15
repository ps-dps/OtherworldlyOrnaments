# Otherworldly Ornaments
Find **ornaments** stemming from **other worlds** that provide you with **unique buffs** and allow you to **travel to their dimension**

_This data pack was made for [Data Pack Jam 11](https://www.planetminecraft.com/jam/datapackjam11/) within a week_

> Warning:
> ⚠ This pack only works in snapshot 24w06a or newer (1.20.5) ⚠

---

[![modrinth Download](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/modrinth_download.png)](https://modrinth.com/project/otherworldly-ornaments/versions)
[![GitHub Source Code](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/github_source_code.png)](https://github.com/ps-dps/OtherworldlyOrnaments)

## Obtaining an Ornament
Each ornament can be found in a **structure** in **it's respective dimension**.
All ornaments of dimensions you **can't** travel to by regular means, can also be found in the **overworld**.

## Ornaments
Ornaments activate their effect when **held in the offhand**.

If you **right click** with an active ornament, you **switch between it's dimension** and the **overworld**.

[![droughtstride](https://raw.githubusercontent.com/ps-dps/OtherworldlyOrnaments/main/images/speedfood.png)](#droughtstride)
[![alpgrow](https://raw.githubusercontent.com/ps-dps/OtherworldlyOrnaments/main/images/size.png)](#alpgrow)
[![quickscorch](https://raw.githubusercontent.com/ps-dps/OtherworldlyOrnaments/main/images/mining.png)](#quickscorch)
[![voidfall](https://raw.githubusercontent.com/ps-dps/OtherworldlyOrnaments/main/images/voidfall.png)](#voidfall)

### Droughtstride
As you lose saturation, your speed increases but your jump height decreases.

### Alpgrow
As you scale mountains, you grow to their size. As you dive into the depths, you shrink.

### Quickscorch
Increase mining speed as you mine but your tool will start to burn your hands.

### Voidfall
Falling into the void shatters all your gear but you reappear high up in the sky unharmed.

## New Dimensions
Every ornament allows you to travel to it's dimension, for some ornaments, new dimensions are added.

### Amplified
In this dimension the terrain is **amplified**, like the world generation type you can select when generating the world.
All biomes and structures are in the **same location** as they are in the overworld.

### Superflat
In this dimension, all surface blocks are at y=63 creating an almost perfectly **flat dimension**.
This causes **oceans** to be **dry land** and **mountains** to be a **stoney surface** with **floating aquifers**.
All biomes and structures are in the **same location** as they are in the overworld.

## Technical Info
Read this section if you want to **test the pack** or **modify things** about it.

### Locate a newly added Structure
To **locate a structure** near you, you can run the following **command in chat**:
```mcfunction
locate structure psdpj11:<...>
```

### Give yourself the Ornaments
To **get one of the Ornaments**, you can run the following **command in chat**:
```mcfunction
loot give @s loot psdpj11:artifact/<...>
```

### Modify what Biomes/Dimension the Structures Spawn in
You can simply **add or remove biomes** from the **tags** located at:
```
/data/psdpj11/tags/worldgen/biome/<...>.json
```

### Modify how often the Structures Spawn
To make the structures **more or less common**, you can change the `"spacing"` and `"separation"` in the files located at:
```
/data/psdpj11/worldgen/structure_set/<...>.json
```
Higher values make the structure spawn **less** frequently.

---
[![PuckiSilver on GitHub](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/GitHub.png)](https://github.com/PuckiSilver)[![PuckiSilver on modrinth](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/modrinth.png)](https://modrinth.com/user/PuckiSilver)[![PuckiSilver on PlanetMinecraft](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/PlanetMinecraft.png)](https://planetminecraft.com/m/PuckiSilver)[![PuckiSilver on PayPal](https://raw.githubusercontent.com/PuckiSilver/static-files/main/link_logos/PayPal.png)](https://paypal.me/puckisilver)
