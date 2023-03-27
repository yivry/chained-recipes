require("data-util")

-- ------------- --
-- Vehicle Chain --
-- ------------- --
-- car -> tank

-- {
--     name = "car",
--     ingredients = {
--         {"engine-unit", 8},
--         {"iron-plate", 20},
--         {"steel-plate", 5},
--     },
-- }
modify_ingredients({
    name = "tank",
    normal = {
        ingredients = {
            {"car", 1},
            {"engine-unit", 24}, -- Down from 32
            {"steel-plate", 46}, -- Down from 50
            {"iron-gear-wheel", 5}, -- Down from 15
            {"advanced-circuit", 10},
        },
    },
    expensive = {
        ingredients = {
            {"car", 1},
            {"engine-unit", 56}, -- Down from 64
            {"steel-plate", 96}, -- Down from 100
            {"iron-gear-wheel", 20}, -- Down from 30
            {"advanced-circuit", 20},
        },
    },
})
