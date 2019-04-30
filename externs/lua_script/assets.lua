-- =========================================
-- =              ASSETS LOADER            =
-- =========================================


-- =======================
-- =      TEXTURES       =
-- =======================

assets["background"] = lsfml.texture.createFromFile("./assets/menu/main_menu_background.png", {0, 0, 1920, 1080})
assets["button_idle"] = lsfml.texture.createFromFile("./assets/menu/button_idle.png", {0, 0, 421, 171})
assets["button_pressed"] = lsfml.texture.createFromFile("./assets/menu/button_pressed.png", {0, 0, 421, 171})
assets["button_hover"] = lsfml.texture.createFromFile("./assets/menu/button_hover.png", {0, 0, 421, 171})
assets["player"] = lsfml.texture.createFromFile("./assets/player/allsprite.png", {0, 0, 3300, 6492})
assets["hud_health"] = lsfml.texture.createFromFile("./assets/hud/health.png", {0, 0, 980, 328})
assets["hud_stamina"] = lsfml.texture.createFromFile("./assets/hud/stamina.png", {0, 0, 980, 328})
assets["hud_empty_health_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_health_bar.png", {0, 0, 980, 328})
assets["hud_empty_stamina_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_stamina_bar.png", {0, 0, 980, 328})
assets["hud_empty_mana_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_mana_bar.png", {0, 0, 980, 328})
assets["sort_bar"] = lsfml.texture.createFromFile("./assets/hud/sort_bar.png", {0, 0, 1006, 171})
assets["hud_mana"] = lsfml.texture.createFromFile("./assets/hud/mana.png", {0, 0, 980, 328})
assets["inventory_hud"] = lsfml.texture.createFromFile("./assets/menu/inventory.png", {0, 0, 1337, 940})
assets["spell_hub"] = lsfml.texture.createFromFile("./assets/menu/spell_menu.png", {0, 0, 1337, 940})
assets["other_item"] = lsfml.texture.createFromFile("./assets/hud/other_item.png", {0, 0, 442, 208})

-- =======================
-- =    SPELL TEXTURE    =
-- =======================
assets["douleurSpell"] = lsfml.texture.createFromFile("./assets/spell/chaine_de_douleur.png", {0, 0, 142, 142})
assets["elecSpell"] = lsfml.texture.createFromFile("./assets/spell/elec.png", {0, 0, 142, 142})
assets["healSpell"] = lsfml.texture.createFromFile("./assets/spell/heal.png", {0, 0, 142, 142})
assets["picSpell"] = lsfml.texture.createFromFile("./assets/spell/pic.png", {0, 0, 142, 142})
assets["rayonSpell"] = lsfml.texture.createFromFile("./assets/spell/rayon.png", {0, 0, 142, 142})
assets["bouleelecSpell"] = lsfml.texture.createFromFile("./assets/spell/bouleelec.png", {0, 0, 142, 142})
assets["dashSpell"] = lsfml.texture.createFromFile("./assets/spell/dash.png", {0, 0, 142, 142})
assets["repulsionSpell"] = lsfml.texture.createFromFile("./assets/spell/repulsion.png", {0, 0, 142, 142})
assets["shieldSpell"] = lsfml.texture.createFromFile("./assets/spell/shield.png", {0, 0, 142, 142})
assets["tempSpell"] = lsfml.texture.createFromFile("./assets/spell/temp.png", {0, 0, 142, 142})

-- =======================
-- =   SPELL ANIMATION   =
-- =======================

assets["rayonAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/rayon.png", {0, 0, 285, 339})
assets["shieldAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/shield686x655.png", {0, 0, 5488, 655})
assets["healAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/heal192x192.png", {0, 0, 2304, 192})
assets["picAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/pic457x224.png", {0, 0, 3656, 224})
assets["elecAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/elec83x249.png", {0, 0, 415, 248})
assets["bouleelecAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/bouleelec71x71.png", {0, 0, 281, 71})
assets["tempAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/sablier573x573.png", {0, 0, 5157, 572})

-- =======================
-- =        ITEMS        =
-- =======================

assets["companion_cube"] = lsfml.texture.createFromFile("./assets/items/companion_cube.png", {0, 0, 64, 64})
assets["core"] = lsfml.texture.createFromFile("./assets/items/core.png", {0, 0, 64, 64})
assets["key"] = lsfml.texture.createFromFile("./assets/items/key.png", {0, 0, 64, 64})
assets["seringue"] = lsfml.texture.createFromFile("./assets/items/seringue.png", {0, 0, 64, 64})
assets["seringue_mana"] = lsfml.texture.createFromFile("./assets/items/seringue_mana.png", {0, 0, 64, 64})
assets["parchemin_1"] = lsfml.texture.createFromFile("./assets/items/parchemin_1.png", {0, 0, 64, 64})
assets["parchemin_2"] = lsfml.texture.createFromFile("./assets/items/parchemin_2.png", {0, 0, 64, 64})
assets["parchemin_3"] = lsfml.texture.createFromFile("./assets/items/parchemin_3.png", {0, 0, 64, 64})
assets["parchemin_4"] = lsfml.texture.createFromFile("./assets/items/parchemin_4.png", {0, 0, 64, 64})
assets["parchemin_5"] = lsfml.texture.createFromFile("./assets/items/parchemin_5.png", {0, 0, 64, 64})
assets["parchemin_6"] = lsfml.texture.createFromFile("./assets/items/parchemin_6.png", {0, 0, 64, 64})
assets["parchemin"] = lsfml.texture.createFromFile("./assets/items/parchemin.png", {0, 0, 64, 64})
assets["metal_scrap"] = lsfml.texture.createFromFile("./assets/items/metal_scrap.png", {0, 0, 64, 64})
assets["tablette"] = lsfml.texture.createFromFile("./assets/items/tablette.png", {0, 0, 64, 64})

assets["botte1"] = lsfml.texture.createFromFile("./assets/items/armure/botte1.png", {0, 0, 64, 64})
assets["casque1"] = lsfml.texture.createFromFile("./assets/items/armure/casque1.png", {0, 0, 64, 64})
assets["jambiere1"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere1.png", {0, 0, 64, 64})
assets["plastron1"] = lsfml.texture.createFromFile("./assets/items/armure/plastron1.png", {0, 0, 64, 64})
assets["botte2"] = lsfml.texture.createFromFile("./assets/items/armure/botte2.png", {0, 0, 64, 64})
assets["casque2"] = lsfml.texture.createFromFile("./assets/items/armure/casque2.png", {0, 0, 64, 64})
assets["jambiere2"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere2.png", {0, 0, 64, 64})
assets["plastron2"] = lsfml.texture.createFromFile("./assets/items/armure/plastron2.png", {0, 0, 64, 64})
assets["botte3"] = lsfml.texture.createFromFile("./assets/items/armure/botte3.png", {0, 0, 64, 64})
assets["casque3"] = lsfml.texture.createFromFile("./assets/items/armure/casque3.png", {0, 0, 64, 64})
assets["jambiere3"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere3.png", {0, 0, 64, 64})
assets["plastron3"] = lsfml.texture.createFromFile("./assets/items/armure/plastron3.png", {0, 0, 64, 64})

-- =======================
-- =     MAP TEXTURE     =
-- =======================

assets["labo_pop"] = lsfml.texture.createFromFile("./assets/map/labo/pop.png", {0, 0, 1920, 1080})

-- =======================
-- =        FONTS        =
-- =======================

assets["fsys"] = lsfml.font.createFromFile("./assets/fonts/fsys.ttf")

-- =======================
-- =       SOUNDS        =
-- =======================

assets["button_hover_sfx"] = lsfml.sound.createFromFile("./assets/sound/button_hover.wav")
assets["dash"] = lsfml.sound.createFromFile("./assets/sound/dash.wav")
assets["heal"] = lsfml.sound.createFromFile("./assets/sound/heal.ogg")
assets["shield"] = lsfml.sound.createFromFile("./assets/sound/shield.ogg")
assets["deny"] = lsfml.sound.createFromFile("./assets/sound/denied.wav")
assets["time"] = lsfml.sound.createFromFile("./assets/sound/time.ogg")
assets["elec"] = lsfml.sound.createFromFile("./assets/sound/elec.ogg")
assets["repulsion"] = lsfml.sound.createFromFile("./assets/sound/shockwave.ogg")

-- =======================
-- =        MUSICS       =
-- =======================

assets["menu_music"] = lsfml.music.createFromFile("./assets/music/main_menu.ogg")
assets["ambiance_music"] = lsfml.music.createFromFile("./assets/music/ambiance_game.ogg")
