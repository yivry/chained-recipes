require("data-util")

-- --------------- --
-- Artillery Chain --
-- --------------- --
-- artillery cannon -+-> artillery turret
--                   +-> artillery train

local cannon = {
    name = pf("artillery-cannon"),
    item = {
        icon = "__base__/graphics/technology/artillery-range.png",
        icon_mipmaps = 4,
        icon_size = 256,
        name = pf("artillery-cannon"),
        order = "b[" .. pf("artillery-cannon") .. "]",
        stack_size = 10,
        subgroup = pf("intermediates"),
        type = "item"
    },
    recipe = {
        name = pf("artillery-cannon"),
        result = pf("artillery-cannon"),
        ingredients = {
            {"advanced-circuit", 20},
            {"iron-gear-wheel", 10},
            {"steel-plate", 25},
        },
    },
    tech = "artillery",
}

data:extend({cannon.item})
create_simple_recipe(cannon.recipe)
unlock_recipe_with_tech(cannon.name, cannon.tech)

modify_ingredients({
    name = "artillery-turret",
    ingredients = {
        {cannon.name, 1},
        {"steel-plate", 35}, -- Down from 60
        {"concrete", 60},
        {"iron-gear-wheel", 30}, -- Down from 40
        -- {"advanced-circuit", 20},
    },
})
-- See "Train Chain"
modify_ingredients({
    name = "artillery-wagon",
    ingredients = {
        {cannon.name, 1},
        {pf("train-chassis"), 1},
        {"engine-unit", 64},
        {"steel-plate", 3}, -- Down from 40
        {"pipe", 16},
        -- {"advanced-circuit", 20},
        -- {"iron-gear-wheel", 10},
    },
})
