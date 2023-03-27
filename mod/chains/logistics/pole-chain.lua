require("data-util")
require("prefix")

-- ---------- --
-- Pole Chain --
-- ---------- --
-- As Wood is not automatable, first step optional:
-- small electric pole -> medium electric pole -> big electric pole -> substation

-- {
--     name = "medium-electric-pole",
--     ingredients = {
--         {"iron-stick", 4},
--         {"steel-plate", 2},
--         {"copper-plate", 2},
--     },
-- }
modify_ingredients({
    name = "big-electric-pole",
    ingredients = {
        {"medium-electric-pole", 2},
        {"steel-plate", 1}, -- Down from 5
        {"copper-plate", 1}, -- Down from 5
        -- {"iron-stick", 8},
    },
})
modify_ingredients({
    name = "substation",
    ingredients = {
        {"big-electric-pole", 1},
        {"steel-plate", 4}, -- Down from 10
        {"advanced-circuit", 5},
        -- {"copper-plate", 5},
    },
})

-- {
--     name = "small-electric-pole",
--     ingredients = {
--         {"wood", 1},
--         {"copper-cable", 2},
--     },
-- }
local ingredients = {
    {"small-electric-pole", 2},
    {"iron-stick", 2}, -- Down from 4
    {"steel-plate", 2},
    -- {"copper-plate", 2},
}

if cfg_start("disable-original-medium-pole") then
    modify_ingredients({
        name = "medium-electric-pole",
        ingredients = ingredients,
    })
else
    duplicate_recipe("medium-electric-pole", {
        ingredients = ingredients,
    })

    add_effect_to_tech({
        recipe = pf("medium-electric-pole"),
        type = "unlock-recipe",
    }, "electric-energy-distribution-1")
end
