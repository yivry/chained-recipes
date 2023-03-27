require("data-util")

-- ------------- --
-- Furnace Chain --
-- ------------- --
-- stone furnace -> steel furnace -> electric furnace

-- {
--     name = "stone-furnace",
--     ingredients = {
--         {"stone", 5},
--     },
-- }
modify_ingredients({
    name = "steel-furnace",
    ingredients = {
        {"stone-furnace", 1},
        {"steel-plate", 6},
        {"stone-brick", 8}, -- Down from 10
    },
})
modify_ingredients({
    name = "electric-furnace",
    ingredients = {
        {"steel-furnace", 1},
        {"steel-plate", 4}, -- Down from 10
        {"advanced-circuit", 5},
        -- {"stone-brick", 10},
    },
})
