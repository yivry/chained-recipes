require("data-util")

-- ----------- --
-- Armor Chain --
-- ----------- --
-- light armor -> heavy armor -> modular armor -> power armor -> power armor mk 2

-- {
--     name = "light-armor",
--     ingredients = {
--         {"iron-plate", 40},
--     },
-- }
modify_ingredients({
    name = "heavy-armor",
    ingredients = {
        {"light-armor", 1},
        {"copper-plate", 60}, -- Down from 100
        {"steel-plate", 50},
    },
})
modify_ingredients({
    name = "modular-armor",
    ingredients = {
        {"heavy-armor", 1},
        {"advanced-circuit", 25}, -- Down from 30
        -- {"steel-plate", 50},
    },
})
modify_ingredients({
    name = "power-armor",
    ingredients = {
        {"modular-armor", 1},
        {"processing-unit", 38}, -- Down from 40
        {"electric-engine-unit", 20},
        -- {"steel-plate", 40},
    },
})
modify_ingredients({
    name = "power-armor-mk2",
    ingredients = {
        {"power-armor", 1},
        {"effectivity-module-2", 25},
        {"speed-module-2", 25},
        {"processing-unit", 22}, -- Down from 60
        {"electric-engine-unit", 20}, -- Down from 40
        {"low-density-structure", 26}, -- Down from 30
    },
})
