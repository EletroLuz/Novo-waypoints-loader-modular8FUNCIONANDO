-- graphics/menu_renderer.lua

local menu = require("menu")

local function render_menu(plugin_enabled, doorsEnabled, loopEnabled, revive_enabled, profane_mindcage_enabled, profane_mindcage_count, moveThreshold)
    if menu.main_tree:push("HellChest Farmer (EletroLuz)-V1.4") then
        -- Renderiza o checkbox para habilitar o plugin de movimento
        menu.plugin_enabled:render("Enable Movement Plugin", "Enable or disable the movement plugin")

        -- Renderiza o checkbox para habilitar o plugin de abertura de baus
        menu.main_openDoors_enabled:render("Open Chests", "Enable or disable the chest plugin")

        -- Renderiza o checkbox para habilitar o loop dos waypoints
        menu.loop_enabled:render("Enable Loop", "Enable or disable looping waypoints")

        -- Renderiza o checkbox para habilitar/desabilitar o módulo de revive
        menu.revive_enabled:render("Enable Revive Module", "Enable or disable the revive module")

        -- Cria um submenu para as configurações do Profane Mindcage
        if menu.profane_mindcage_tree:push("Profane Mindcage Settings") then
            menu.profane_mindcage_toggle:render("Enable Profane Mindcage Auto Use", "Enable or disable automatic use of Profane Mindcage")
            menu.profane_mindcage_slider:render("Profane Mindcage Count", "Number of Profane Mindcages to use")
            menu.profane_mindcage_tree:pop()
        end

        -- Cria um submenu para as configurações do Move Threshold
        if menu.move_threshold_tree:push("Chest Move Range Settings") then
            if menu.move_threshold_slider then
                menu.move_threshold_slider:render("Move Range", "maximum distance the player can detect and move towards a chest in the game")
            else
                console.print("Error: move_threshold_slider is not initialized")
            end
            menu.move_threshold_tree:pop()
        end

        menu.main_tree:pop()
    end
end

return {
    render_menu = render_menu
}