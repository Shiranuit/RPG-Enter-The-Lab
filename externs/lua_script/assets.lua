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
assets["player"] = lsfml.texture.createFromFile("./assets/player/allsprite.png", {0, 0, 3300, 3993})
assets["hud_health"] = lsfml.texture.createFromFile("./assets/hud/health.png", {0, 0, 980, 328})
assets["hud_stamina"] = lsfml.texture.createFromFile("./assets/hud/stamina.png", {0, 0, 980, 328})
assets["hud_empty_health_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_health_bar.png", {0, 0, 980, 328})
assets["hud_empty_stamina_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_stamina_bar.png", {0, 0, 980, 328})
assets["sort_bar"] = lsfml.texture.createFromFile("./assets/hud/Sort_bar.png", {0, 0, 1006, 171})
assets["hud_empty_stamina_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_stamina_bar.png", {0, 0, 980, 328})
assets["inventory_hud"] = lsfml.texture.createFromFile("./assets/menu/inventory.png", {0, 0, 1337, 940})

spells["douleurSpell"] = lsfml.texture.createFromFile("./assets/hud/spell/chaine_de_douleur.png", {0, 0, 142, 142})
spells["elecSpell"] = lsfml.texture.createFromFile("./assets/hud/spell/elec.png", {0, 0, 142, 142})
spells["healSpell"] = lsfml.texture.createFromFile("./assets/hud/spell/heal.png", {0, 0, 142, 142})
spells["picSpell"] = lsfml.texture.createFromFile("./assets/hud/spell/pic.png", {0, 0, 142, 142})
spells["rayonSpell"] = lsfml.texture.createFromFile("./assets/hud/spell/rayon.png", {0, 0, 142, 142})

assets["item1"] = lsfml.texture.createFromFile("./assets/hud/spell/pic.png", {0, 0, 142, 142})
assets["item2"] = lsfml.texture.createFromFile("./assets/hud/spell/heal.png", {0, 0, 142, 142})
assets["item3"] = lsfml.texture.createFromFile("./assets/hud/spell/rayon.png", {0, 0, 142, 142})
assets["item4"] = lsfml.texture.createFromFile("./assets/hud/spell/elec.png", {0, 0, 142, 142})

-- =======================
-- =        FONTS        =
-- =======================

assets["fsys"] = lsfml.font.createFromFile("./assets/fonts/fsys.ttf")

-- =======================
-- =       SOUNDS        =
-- =======================

assets["button_hover_sfx"] = lsfml.sound.createFromFile("./assets/sound/button_hover.wav")

-- =======================
-- =        MUSICS       =
-- =======================

assets["menu_music"] = lsfml.music.createFromFile("./assets/music/main_menu.ogg")
assets["ambiance_music"] = lsfml.music.createFromFile("./assets/music/ambiance_game.ogg")