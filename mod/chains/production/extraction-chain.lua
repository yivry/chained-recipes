require("data-util")

-- ------------------------ --
-- Extraction Chain: Miners --
-- ------------------------ --
-- burner miner -> electric miner

-- {
--     name = "burner-mining-drill",
--     normal = {
--         ingredients = {
--             {"iron-gear-wheel", 3},
--             {"stone-furnace", 1},
--             {"iron-plate", 3},
--         },
--     },
--     expensive = {
--         ingredients = {
--             {"iron-gear-wheel", 6},
--             {"stone-furnace", 2},
--             {"iron-plate", 6},
--         },
--     },
-- }
modify_ingredients({
    name = "electric-mining-drill",
    normal = {
        ingredients = {
            {"burner-mining-drill", 1},
            {"electronic-circuit", 3},
            {"iron-gear-wheel", 2}, -- Down from 5
            {"iron-plate", 5}, -- Down from 8
        },
    },
    expensive = {
        ingredients = {
            {"burner-mining-drill", 1},
            {"electronic-circuit", 5},
            {"iron-gear-wheel", 4}, -- Down from 10
            {"iron-plate", 14}, -- Down from 20
        },
    },
})

-- ----------------------- --
-- Extraction Chain: Pumps --
-- ----------------------- --
-- offshore pump -> pumpjack

-- {
--     name = "offshore-pump",
--     ingredients = {
--         {"electronic-circuit", 2},
--         {"pipe", 1},
--         {"iron-gear-wheel", 1},
--     },
-- }
modify_ingredients({
    name = "pumpjack",
    ingredients = {
        {"offshore-pump", 2},
        {"steel-plate", 5},
        {"iron-gear-wheel", 9}, -- Down from 10
        {"pipe", 9}, -- Down from 10
        -- {"electronic-circuit", 5},
    },
})
