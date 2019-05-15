-- =========================================
-- =              ASSETS LOADER            =
-- =========================================


-- =======================
-- =      TEXTURES       =
-- =======================


assets["black"] = lsfml.texture.createFromFile("./assets/menu/black.png", {0, 0, 1920, 1080})
updateProgress()
assets["background"] = lsfml.texture.createFromFile("./assets/menu/main_menu_background.png", {0, 0, 1920, 1080})
updateProgress()
assets["button_idle"] = lsfml.texture.createFromFile("./assets/menu/button_idle.png", {0, 0, 421, 171})
updateProgress()
assets["button_pressed"] = lsfml.texture.createFromFile("./assets/menu/button_pressed.png", {0, 0, 421, 171})
updateProgress()
assets["button_hover"] = lsfml.texture.createFromFile("./assets/menu/button_hover.png", {0, 0, 421, 171})
updateProgress()
assets["player"] = lsfml.texture.createFromFile("./assets/player/allsprite.png", {0, 0, 3300, 6492})
updateProgress()
assets["hud_health"] = lsfml.texture.createFromFile("./assets/hud/health.png", {0, 0, 980, 328})
updateProgress()
assets["hud_stamina"] = lsfml.texture.createFromFile("./assets/hud/stamina.png", {0, 0, 980, 328})
updateProgress()
assets["hud_empty_health_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_health_bar.png", {0, 0, 980, 328})
updateProgress()
assets["hud_empty_stamina_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_stamina_bar.png", {0, 0, 980, 328})
updateProgress()
assets["hud_empty_mana_bar"] = lsfml.texture.createFromFile("./assets/hud/empty_mana_bar.png", {0, 0, 980, 328})
updateProgress()
assets["hud_touche"] = lsfml.texture.createFromFile("./assets/hud/touche.png", {0, 0, 52, 54})
updateProgress()
assets["sort_bar"] = lsfml.texture.createFromFile("./assets/hud/sort_bar.png", {0, 0, 1006, 233})
updateProgress()
assets["hud_mana"] = lsfml.texture.createFromFile("./assets/hud/mana.png", {0, 0, 980, 328})
updateProgress()
assets["inventory_hud"] = lsfml.texture.createFromFile("./assets/menu/inventory.png", {0, 0, 1337, 940})
updateProgress()
assets["spell_hub"] = lsfml.texture.createFromFile("./assets/menu/spell_menu.png", {0, 0, 1337, 940})
updateProgress()
assets["other_item"] = lsfml.texture.createFromFile("./assets/hud/other_item.png", {0, 0, 442, 208})
updateProgress()
assets["case_dial"] = lsfml.texture.createFromFile("./assets/hud/case_dial.png", {0, 0, 384, 164})
updateProgress()
assets["info"] = lsfml.texture.createFromFile("./assets/hud/info_window.png", {0, 0, 940, 1450})
updateProgress()

assets["empty_boss_health"] = lsfml.texture.createFromFile("./assets/hud/bosshealth_empty.png", {0, 0, 426, 33})
updateProgress()
assets["boss_health1"] = lsfml.texture.createFromFile("./assets/hud/bosshealth1.png", {0, 0, 426, 33})
updateProgress()
assets["boss_health2"] = lsfml.texture.createFromFile("./assets/hud/bosshealth2.png", {0, 0, 426, 33})
updateProgress()
assets["boss_health3"] = lsfml.texture.createFromFile("./assets/hud/bosshealth3.png", {0, 0, 426, 33})
updateProgress()
assets["boss_health4"] = lsfml.texture.createFromFile("./assets/hud/bosshealth4.png", {0, 0, 426, 33})
updateProgress()
assets["boss_health5"] = lsfml.texture.createFromFile("./assets/hud/bosshealth5.png", {0, 0, 426, 33})
updateProgress()
assets["boss_health6"] = lsfml.texture.createFromFile("./assets/hud/bosshealth6.png", {0, 0, 426, 33})
updateProgress()
assets["boss_health7"] = lsfml.texture.createFromFile("./assets/hud/bosshealth7.png", {0, 0, 426, 33})
updateProgress()
assets["stats"] = lsfml.texture.createFromFile("./assets/hud/stats.png", {0, 0, 950, 1400})
updateProgress()

assets["mob_health_empty"] = lsfml.texture.createFromFile("./assets/hud/mob_health_empty.png", {0, 0, 1040, 30})
updateProgress()
assets["mob_health"] = lsfml.texture.createFromFile("./assets/hud/mob_health.png", {0, 0, 1040, 30})
updateProgress()

assets["xp_bar"] = lsfml.texture.createFromFile("./assets/hud/xp_bar.png", {0, 0, 1080, 80})
updateProgress()
assets["xp_bar_empty"] = lsfml.texture.createFromFile("./assets/hud/xp_bar_empty.png", {0, 0, 1080, 80})
updateProgress()
assets["circle"] = lsfml.texture.createFromFile("./assets/hud/circle.png", {0, 0, 71, 71})
updateProgress()

assets["scythe_right"] = lsfml.texture.createFromFile("./assets/hud/boomrang_dot.png", {0, 0, 71, 71})
updateProgress()
assets["scythe_left"] = lsfml.texture.createFromFile("./assets/hud/slash_dot.png", {0, 0, 71, 71})
updateProgress()
-- =======================
-- =    ENTITY MOB       =
-- =======================


assets["robot1"] = lsfml.texture.createFromFile("./assets/ennemy/robo/robot1.png", {0, 0, 4095, 2972})
updateProgress()
assets["robot2"] = lsfml.texture.createFromFile("./assets/ennemy/robo/robot2.png", {0, 0, 7216, 4200})
updateProgress()
assets["turret"] = lsfml.texture.createFromFile("./assets/ennemy/tourelle.png", {0, 0, 156, 312})
updateProgress()
assets["soucoupe"] = lsfml.texture.createFromFile("./assets/ennemy/boss/soucoupe/soucoupe250x86.png", {0, 0, 1993, 258})
updateProgress()
assets["scythe"] = lsfml.texture.createFromFile("./assets/ennemy/boss/scythe/scythe.png", {0, 0, 673, 610})
updateProgress()
assets["mage"] = lsfml.texture.createFromFile("./assets/ennemy/boss/mage/mage.png", {0, 0, 480, 846})
updateProgress()
assets["robot3"] = lsfml.texture.createFromFile("./assets/ennemy/robo/robot3.png", {0, 0, 292, 256})
updateProgress()
-- =======================
-- =    ENTITY PNJ       =
-- =======================


assets["pnj_homme"] = lsfml.texture.createFromFile("./assets/pnj/pnj_homme.png", {0, 0, 1100, 560})
updateProgress()
assets["pnj_robo"] = lsfml.texture.createFromFile("./assets/pnj/robo_casser_240x540.png", {0, 0, 960, 540})
updateProgress()
-- =======================
-- =    ENTITY TEXTURE   =
-- =======================


assets["rayon"] = lsfml.texture.createFromFile("./assets/entity/rayon.png", {0, 0, 199, 44})
updateProgress()
assets["slash"] = lsfml.texture.createFromFile("./assets/entity/slash.png", {0, 0, 67, 147})
updateProgress()
assets["vortex"] = lsfml.texture.createFromFile("./assets/entity/vortex.png", {0, 0, 386, 393})
updateProgress()
assets["laser_beam"] = lsfml.texture.createFromFile("./assets/entity/laser_beam.png", {0, 0, 580, 32})
updateProgress()
assets["vortex2"] = lsfml.texture.createFromFile("./assets/entity/vortex2.png", {0, 0, 386, 393})
updateProgress()
assets["vortex3"] = lsfml.texture.createFromFile("./assets/entity/vortex3.png", {0, 0, 386, 393})
updateProgress()
assets["laser"] = lsfml.texture.createFromFile("./assets/ennemy/robo/attack.png", {0, 0, 365, 33})
updateProgress()
assets["laser_projectile"] = lsfml.texture.createFromFile("./assets/entity/laser.png", {0, 0, 40, 10})
updateProgress()
-- =======================
-- =    SPELL TEXTURE    =
-- =======================


assets["douleurSpell"] = lsfml.texture.createFromFile("./assets/spell/chaine_de_douleur.png", {0, 0, 142, 142})
updateProgress()
assets["elecSpell"] = lsfml.texture.createFromFile("./assets/spell/elec.png", {0, 0, 142, 142})
updateProgress()
assets["healSpell"] = lsfml.texture.createFromFile("./assets/spell/heal.png", {0, 0, 142, 142})
updateProgress()
assets["picSpell"] = lsfml.texture.createFromFile("./assets/spell/pic.png", {0, 0, 142, 142})
updateProgress()
assets["rayonSpell"] = lsfml.texture.createFromFile("./assets/spell/rayon.png", {0, 0, 142, 142})
updateProgress()
assets["bouleelecSpell"] = lsfml.texture.createFromFile("./assets/spell/bouleelec.png", {0, 0, 142, 142})
updateProgress()
assets["dashSpell"] = lsfml.texture.createFromFile("./assets/spell/dash.png", {0, 0, 142, 142})
updateProgress()
assets["repulsionSpell"] = lsfml.texture.createFromFile("./assets/spell/repulsion.png", {0, 0, 142, 142})
updateProgress()
assets["shieldSpell"] = lsfml.texture.createFromFile("./assets/spell/shield.png", {0, 0, 142, 142})
updateProgress()
assets["tempSpell"] = lsfml.texture.createFromFile("./assets/spell/temp.png", {0, 0, 142, 142})
updateProgress()
-- =======================
-- =   SPELL ANIMATION   =
-- =======================


assets["rayonAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/rayon19x114.png", {0, 0, 342, 342})
updateProgress()
assets["rayonIdleAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/rayon19x114.png", {0, 0, 76, 342})
updateProgress()
assets["rayonEndAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/rayon19x114.png", {0, 0, 209, 342})
updateProgress()

assets["shieldAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/shield686x655.png", {0, 0, 5488, 655})
updateProgress()
assets["healAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/heal192x192.png", {0, 0, 2304, 192})
updateProgress()
assets["picAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/pic457x224.png", {0, 0, 3656, 224})
updateProgress()
assets["elecAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/elec83x249.png", {0, 0, 415, 248})
updateProgress()
assets["bouleelecAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/bouleelec71x71.png", {0, 0, 281, 71})
updateProgress()
assets["tempAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/sablier573x573.png", {0, 0, 5157, 572})
updateProgress()
assets["repulsionAnimation"] = lsfml.texture.createFromFile("./assets/spell/animation/repulsion900x900.png", {0, 0, 3600, 900})
updateProgress()
-- =======================
-- =        ITEMS        =
-- =======================


assets["companion_cube"] = lsfml.texture.createFromFile("./assets/items/companion_cube.png", {0, 0, 64, 64})
updateProgress()
assets["core"] = lsfml.texture.createFromFile("./assets/items/core.png", {0, 0, 64, 64})
updateProgress()
assets["key"] = lsfml.texture.createFromFile("./assets/items/key.png", {0, 0, 64, 64})
updateProgress()
assets["seringue"] = lsfml.texture.createFromFile("./assets/items/seringue.png", {0, 0, 64, 64})
updateProgress()
assets["seringue_mana"] = lsfml.texture.createFromFile("./assets/items/seringue_mana.png", {0, 0, 64, 64})
updateProgress()
assets["parchemin__1"] = lsfml.texture.createFromFile("./assets/items/parchemin_1.png", {0, 0, 64, 64})
updateProgress()
assets["parchemin__2"] = lsfml.texture.createFromFile("./assets/items/parchemin_2.png", {0, 0, 64, 64})
updateProgress()
assets["parchemin__3"] = lsfml.texture.createFromFile("./assets/items/parchemin_3.png", {0, 0, 64, 64})
updateProgress()
assets["parchemin__4"] = lsfml.texture.createFromFile("./assets/items/parchemin_4.png", {0, 0, 64, 64})
updateProgress()
assets["parchemin__5"] = lsfml.texture.createFromFile("./assets/items/parchemin_5.png", {0, 0, 64, 64})
updateProgress()
assets["parchemin__6"] = lsfml.texture.createFromFile("./assets/items/parchemin_6.png", {0, 0, 64, 64})
updateProgress()
assets["parchemin"] = lsfml.texture.createFromFile("./assets/items/parchemin.png", {0, 0, 64, 64})
updateProgress()
assets["metal_scrap"] = lsfml.texture.createFromFile("./assets/items/metal_scrap.png", {0, 0, 64, 64})
updateProgress()
assets["tablette"] = lsfml.texture.createFromFile("./assets/items/tablette.png", {0, 0, 64, 64})
updateProgress()
assets["scythe_item"] = lsfml.texture.createFromFile("./assets/items/scythe.png", {0, 0, 64, 64})
updateProgress()

assets["botte1"] = lsfml.texture.createFromFile("./assets/items/armure/botte1.png", {0, 0, 64, 64})
updateProgress()
assets["casque1"] = lsfml.texture.createFromFile("./assets/items/armure/casque1.png", {0, 0, 64, 64})
updateProgress()
assets["jambiere1"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere1.png", {0, 0, 64, 64})
updateProgress()
assets["plastron1"] = lsfml.texture.createFromFile("./assets/items/armure/plastron1.png", {0, 0, 64, 64})
updateProgress()
assets["botte2"] = lsfml.texture.createFromFile("./assets/items/armure/botte2.png", {0, 0, 64, 64})
updateProgress()
assets["casque2"] = lsfml.texture.createFromFile("./assets/items/armure/casque2.png", {0, 0, 64, 64})
updateProgress()
assets["jambiere2"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere2.png", {0, 0, 64, 64})
updateProgress()
assets["plastron2"] = lsfml.texture.createFromFile("./assets/items/armure/plastron2.png", {0, 0, 64, 64})
updateProgress()
assets["botte3"] = lsfml.texture.createFromFile("./assets/items/armure/botte3.png", {0, 0, 64, 64})
updateProgress()
assets["casque3"] = lsfml.texture.createFromFile("./assets/items/armure/casque3.png", {0, 0, 64, 64})
updateProgress()
assets["jambiere3"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere3.png", {0, 0, 64, 64})
updateProgress()
assets["plastron3"] = lsfml.texture.createFromFile("./assets/items/armure/plastron3.png", {0, 0, 64, 64})
updateProgress()
assets["botte4"] = lsfml.texture.createFromFile("./assets/items/armure/botte4.png", {0, 0, 64, 64})
updateProgress()
assets["casque4"] = lsfml.texture.createFromFile("./assets/items/armure/casque4.png", {0, 0, 64, 64})
updateProgress()
assets["jambiere4"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere4.png", {0, 0, 64, 64})
updateProgress()
assets["plastron4"] = lsfml.texture.createFromFile("./assets/items/armure/plastron4.png", {0, 0, 64, 64})
updateProgress()
assets["botte5"] = lsfml.texture.createFromFile("./assets/items/armure/botte5.png", {0, 0, 64, 64})
updateProgress()
assets["casque5"] = lsfml.texture.createFromFile("./assets/items/armure/casque5.png", {0, 0, 64, 64})
updateProgress()
assets["jambiere5"] = lsfml.texture.createFromFile("./assets/items/armure/jambiere5.png", {0, 0, 64, 64})
updateProgress()
assets["plastron5"] = lsfml.texture.createFromFile("./assets/items/armure/plastron5.png", {0, 0, 64, 64})
updateProgress()
-- ==========================
-- =     MAP BACKGROUND     =
-- ==========================


assets["labo_pop"] = lsfml.texture.createFromFile("./assets/map/labo/pop.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_angle_gauche"] = lsfml.texture.createFromFile("./assets/map/labo/angle_gauche.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_intersection_bas"] = lsfml.texture.createFromFile("./assets/map/labo/intersection_bas.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_angle_haut_gauche"] = lsfml.texture.createFromFile("./assets/map/labo/angle_haut_gauche.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_angle_droit"] = lsfml.texture.createFromFile("./assets/map/labo/angle_droit.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_vertical"] = lsfml.texture.createFromFile("./assets/map/labo/vertical.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_angle_haut_droit"] = lsfml.texture.createFromFile("./assets/map/labo/angle_haut_droit.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_escalier"] = lsfml.texture.createFromFile("./assets/map/labo/escalier.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_horizontal"] = lsfml.texture.createFromFile("./assets/map/labo/horizontal.png", {0, 0, 1920, 1080})
updateProgress()
assets["labo_intersection_haut"] = lsfml.texture.createFromFile("./assets/map/labo/intersection_haut.png", {0, 0, 1920, 1080})
updateProgress()

assets["start_cave"] = lsfml.texture.createFromFile("./assets/map/cave/arriver.png", {0, 0, 1920, 1080})
updateProgress()
assets["left_start"] = lsfml.texture.createFromFile("./assets/map/cave/grotte_gauche.png", {0, 0, 1920, 1080})
updateProgress()
assets["right_start"] = lsfml.texture.createFromFile("./assets/map/cave/avant_boss.png", {0, 0, 1920, 1080})
updateProgress()
assets["boss"] = lsfml.texture.createFromFile("./assets/map/cave/boss.png", {0, 0, 1920, 1080})
updateProgress()
assets["blank"] = lsfml.texture.createFromFile("./assets/menu/blank.png", {0, 0, 1337, 940})
updateProgress()
assets["arrow"] = lsfml.texture.createFromFile("./assets/menu/arrow_right.png", {0, 0, 210, 210})
updateProgress()
assets["arrowr"] = lsfml.texture.createFromFile("./assets/menu/arrow_left.png", {0, 0, 210, 210})
updateProgress()
assets["arrow_active"] = lsfml.texture.createFromFile("./assets/menu/arrow_right_active.png", {0, 0, 210, 210})
updateProgress()
assets["arrowr_active"] = lsfml.texture.createFromFile("./assets/menu/arrow_left_active.png", {0, 0, 210, 210})
updateProgress()

assets["loading"] = lsfml.texture.createFromFile("./assets/menu/loading_screen.png", {0, 0, 7840, 196})
updateProgress()
-- =======================
-- =     MAP TEXTURE     =
-- =======================


assets["geant_tapis_gauche"] = lsfml.texture.createFromFile("./assets/map/to_give/geant_tapis_gauche.png", {0, 0, 483, 369})
updateProgress()
assets["grand_tapis_droite"] = lsfml.texture.createFromFile("./assets/map/to_give/grand_tapis_droite.png", {0, 0, 411, 272})
updateProgress()
assets["moyen_tapis_haut_droite"] = lsfml.texture.createFromFile("./assets/map/to_give/moyen_tapis_haut_droite.png", {0, 0, 324, 248})
updateProgress()
assets["petit_tapis_bas_gauche"] = lsfml.texture.createFromFile("./assets/map/to_give/petit_tapis_bas_gauche.png", {0, 0, 292, 248})
updateProgress()
assets["hologram"] = lsfml.texture.createFromFile("./assets/map/to_give/hologram.png", {0, 0, 155, 155})
updateProgress()
assets["hologram_break"] = lsfml.texture.createFromFile("./assets/map/to_give/hologram_break.png", {0, 0, 155, 39})
updateProgress()
assets["mini_holo"] = lsfml.texture.createFromFile("./assets/map/to_give/mini_holo.png", {0, 0, 56, 56})
updateProgress()
assets["mini_tp"] = lsfml.texture.createFromFile("./assets/map/to_give/mini_tp.png", {0, 0, 31, 60})
updateProgress()
assets["mini_tube"] = lsfml.texture.createFromFile("./assets/map/to_give/mini_tube.png", {0, 0, 56, 87})
updateProgress()
assets["parchemin_1"] = lsfml.texture.createFromFile("./assets/map/to_give/parchemin_1.png", {0, 0, 215, 65})
updateProgress()
assets["parchemin_2"] = lsfml.texture.createFromFile("./assets/map/to_give/parchemin_2.png", {0, 0, 187, 62})
updateProgress()
assets["parchemin_3"] = lsfml.texture.createFromFile("./assets/map/to_give/parchemin_3.png", {0, 0, 216, 57})
updateProgress()
assets["parchemin_4"] = lsfml.texture.createFromFile("./assets/map/to_give/parchemin_4.png", {0, 0, 216, 90})
updateProgress()
assets["parchemin_5"] = lsfml.texture.createFromFile("./assets/map/to_give/parchemin_5.png", {0, 0, 182, 70})
updateProgress()
assets["parchemin_6"] = lsfml.texture.createFromFile("./assets/map/to_give/parchemin_6.png", {0, 0, 215, 64})
updateProgress()
assets["pot1"] = lsfml.texture.createFromFile("./assets/map/to_give/pot1.png", {0, 0, 76, 84})
updateProgress()
assets["pot2"] = lsfml.texture.createFromFile("./assets/map/to_give/pot2.png", {0, 0, 28, 56})
updateProgress()
assets["pot3"] = lsfml.texture.createFromFile("./assets/map/to_give/pot3.png", {0, 0, 35, 56})
updateProgress()
assets["pot4"] = lsfml.texture.createFromFile("./assets/map/to_give/pot4.png", {0, 0, 76, 80})
updateProgress()
assets["pot5"] = lsfml.texture.createFromFile("./assets/map/to_give/pot5.png", {0, 0, 34, 84})
updateProgress()
assets["pot6"] = lsfml.texture.createFromFile("./assets/map/to_give/pot6.png", {0, 0, 28, 32})
updateProgress()
assets["status"] = lsfml.texture.createFromFile("./assets/map/to_give/status.png", {0, 0, 100, 174})
updateProgress()
assets["table"] = lsfml.texture.createFromFile("./assets/map/to_give/table.png", {0, 0, 200, 127})
updateProgress()
assets["tablette"] = lsfml.texture.createFromFile("./assets/map/to_give/tablette.png", {0, 0, 176, 116})
updateProgress()
assets["teleporter"] = lsfml.texture.createFromFile("./assets/map/to_give/teleporter.png", {0, 0, 130, 248})
updateProgress()
assets["torch"] = lsfml.texture.createFromFile("./assets/map/to_give/torch.png", {0, 0, 55, 111})
updateProgress()
assets["torch_empty"] = lsfml.texture.createFromFile("./assets/map/to_give/torch_empty.png", {0, 0, 55, 84})
updateProgress()
assets["tube_bleu_casser"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_bleu_casser.png", {0, 0, 252, 248})
updateProgress()
assets["tube_bleu_femme"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_bleu_femme.png", {0, 0, 159, 247})
updateProgress()
assets["tube_bleu_homme"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_bleu_homme.png", {0, 0, 157, 244})
updateProgress()
assets["tube_bleu_transform"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_bleu_transform.png", {0, 0, 131, 204})
updateProgress()
assets["tube_vert_casser"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_vert_casser.png", {0, 0, 252, 248})
updateProgress()
assets["tube_vert_empty"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_vert_empty.png", {0, 0, 159, 248})
updateProgress()
assets["tube_vert_femme"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_vert_femme.png", {0, 0, 159, 248})
updateProgress()
assets["tube_vert_homme"] = lsfml.texture.createFromFile("./assets/map/to_give/tube_vert_homme.png", {0, 0, 160, 248})
updateProgress()
assets["door"] = lsfml.texture.createFromFile("./assets/map/hodooor400x351.png", {0, 0, 5200, 351})
updateProgress()
-- =======================
-- =        FONTS        =
-- =======================


assets["fsys"] = lsfml.font.createFromFile("./assets/fonts/fsys.ttf")
updateProgress()
-- =======================
-- =       SOUNDS        =
-- =======================


assets["button_hover_sfx"] = lsfml.sound.createFromFile("./assets/sound/button_hover.wav")
updateProgress()
assets["dash"] = lsfml.sound.createFromFile("./assets/sound/dash.wav")
updateProgress()
assets["heal"] = lsfml.sound.createFromFile("./assets/sound/heal.ogg")
updateProgress()
assets["shield"] = lsfml.sound.createFromFile("./assets/sound/shield.ogg")
updateProgress()
assets["deny"] = lsfml.sound.createFromFile("./assets/sound/denied.wav")
updateProgress()
assets["time"] = lsfml.sound.createFromFile("./assets/sound/time.ogg")
updateProgress()
assets["elec"] = lsfml.sound.createFromFile("./assets/sound/elec.ogg")
updateProgress()
assets["repulsion"] = lsfml.sound.createFromFile("./assets/sound/shockwave.ogg")
updateProgress()
assets["bouleelec"] = lsfml.sound.createFromFile("./assets/sound/bouleelec.ogg")
updateProgress()
assets["rayon_start"] = lsfml.sound.createFromFile("./assets/sound/rayon_start.ogg")
updateProgress()
assets["rayon_idle"] = lsfml.sound.createFromFile("./assets/sound/rayon_idle.ogg")
updateProgress()
assets["rayon_end"] = lsfml.sound.createFromFile("./assets/sound/rayon_end.ogg")
updateProgress()
assets["pic"] = lsfml.sound.createFromFile("./assets/sound/pic.ogg")
updateProgress()
assets["robot2_sound"] = lsfml.sound.createFromFile("./assets/sound/robot2.ogg")
updateProgress()
assets["robot1_sound"] = lsfml.sound.createFromFile("./assets/sound/robot1.ogg")
updateProgress()
assets["laser_sound"] = lsfml.sound.createFromFile("./assets/sound/laser.ogg")
updateProgress()
assets["door_sound"] = lsfml.sound.createFromFile("./assets/sound/door.ogg")
updateProgress()
assets["soucoupe_turret"] = lsfml.sound.createFromFile("./assets/sound/soucoupe_patter_turret.ogg")
updateProgress()
assets["mage_teleport"] = lsfml.sound.createFromFile("./assets/sound/mage_teleport.ogg")
updateProgress()
assets["scythe_ulti"] = lsfml.sound.createFromFile("./assets/sound/scythe_ulti.ogg")
updateProgress()
assets["slash_sound"] = lsfml.sound.createFromFile("./assets/sound/slash.ogg")
updateProgress()
assets["spell_charging"] = lsfml.sound.createFromFile("./assets/sound/spell_charging.ogg")
updateProgress()
assets["alarm"] = lsfml.sound.createFromFile("./assets/sound/alarm.ogg")
updateProgress()
assets["bubble"] = lsfml.sound.createFromFile("./assets/sound/bubble.ogg")
updateProgress()
-- ==============================
-- =       SOUNDS TURRETS       =
-- ==============================


assets["activated"] = lsfml.sound.createFromFile("./assets/sound/turret/activated.wav")
updateProgress()
assets["are_you_still_here"] = lsfml.sound.createFromFile("./assets/sound/turret/are you still there.wav")
updateProgress()
assets["can_i_help_you"] = lsfml.sound.createFromFile("./assets/sound/turret/can i help you.wav")
updateProgress()
assets["deploying"] = lsfml.sound.createFromFile("./assets/sound/turret/deploying.wav")
updateProgress()
assets["error"] = lsfml.sound.createFromFile("./assets/sound/turret/error.wav")
updateProgress()
assets["excuse_me"] = lsfml.sound.createFromFile("./assets/sound/turret/excuse me.wav")
updateProgress()
assets["goodbye"] = lsfml.sound.createFromFile("./assets/sound/turret/goodbye.wav")
updateProgress()
assets["hello_friend"] = lsfml.sound.createFromFile("./assets/sound/turret/hello friend.wav")
updateProgress()
assets["i_dont_hate_you"] = lsfml.sound.createFromFile("./assets/sound/turret/i dont hate you.wav")
updateProgress()
assets["is_anyone_there"] = lsfml.sound.createFromFile("./assets/sound/turret/is anyone there.wav")
updateProgress()
assets["please_put_me_down"] = lsfml.sound.createFromFile("./assets/sound/turret/please put me down.wav")
updateProgress()
assets["sentry_mode_activated"] = lsfml.sound.createFromFile("./assets/sound/turret/sentry mode activated.wav")
updateProgress()
assets["sorry"] = lsfml.sound.createFromFile("./assets/sound/turret/sorry.wav")
updateProgress()
assets["stop_shooting"] = lsfml.sound.createFromFile("./assets/sound/turret/stop shooting.wav")
updateProgress()
assets["target_acquired"] = lsfml.sound.createFromFile("./assets/sound/turret/target acquired.wav")
updateProgress()
assets["target_lost"] = lsfml.sound.createFromFile("./assets/sound/turret/target lost.wav")
updateProgress()
assets["there_you_are"] = lsfml.sound.createFromFile("./assets/sound/turret/there you are.wav")
updateProgress()
assets["who_are_you"] = lsfml.sound.createFromFile("./assets/sound/turret/who are you.wav")
updateProgress()
assets["whooooah"] = lsfml.sound.createFromFile("./assets/sound/turret/whooooah.wav")
updateProgress()
assets["why"] = lsfml.sound.createFromFile("./assets/sound/turret/why.wav")
updateProgress()
-- =======================
-- =        MUSICS       =
-- =======================


assets["menu_music"] = lsfml.music.createFromFile("./assets/music/main_menu.ogg")
updateProgress()
assets["ambiance_music"] = lsfml.music.createFromFile("./assets/music/ambiance_game.ogg")
updateProgress()