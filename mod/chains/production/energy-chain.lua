require("data-util")

-- ------------------ --
-- Energy Chain: Heat --
-- ------------------ --
-- boiler + heat pipe -> heat exchanger
-- heat pipe -> nuclear reactor

-- {
--     name = "boiler",
--     ingredients = {
--         {"stone-furnace", 1},
--         {"pipe", 4},
--     },
-- }
-- {
--     name = "heat-pipe",
--     ingredients = {
--         {"steel-plate", 10},
--         {"copper-plate", 20},
--     },
-- }
modify_ingredients({
    name = "heat-exchanger",
    ingredients = {
        {"boiler", 1},
        {"heat-pipe", 1},
        {"copper-plate", 80}, -- Down from 100
        {"pipe", 6}, -- Down from 10
        -- {"steel-plate", 10},
    },
})
modify_ingredients({
    name = "nuclear-reactor",
    ingredients = {
        {"heat-pipe", 15},
        {"concrete", 500},
        {"steel-plate", 350}, -- Down from 500
        {"advanced-circuit", 500},
        {"copper-plate", 200}, -- Down from 500
    },
})

-- ------------------- --
-- Energy Chain: Steam --
-- ------------------- --
-- steam engine -> steam turbine

-- {
--     name = "steam-engine",
--     normal = {
--         ingredients = {
--             {"iron-gear-wheel", 8},
--             {"pipe", 5},
--             {"iron-plate", 10},
--         },
--     },
--     expensive = {
--         ingredients = {
--             {"iron-gear-wheel", 10},
--             {"pipe", 5},
--             {"iron-plate", 50},
--         },
--     },
-- }
modify_ingredients({
    name = "steam-turbine",
    ingredients = {
        {"steam-engine", 1},
        {"iron-gear-wheel", 42}, -- Down from 50
        {"copper-plate", 40}, -- Down from 50
        {"pipe", 15}, -- Down from 20
    },
})
