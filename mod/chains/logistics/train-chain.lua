require("data-util")
require("prefix")

-- ----------- --
-- Train Chain --
-- ----------- --
-- train chassis -+-> locomotive
--                +-> cargo wagon -> fluid wagon
--                +-> artillery wagon, see the "military/artillery" chain

local chassis = {
    name = pf("train-chassis"),
    item = {
        icon = "__base__/graphics/icons/compilatron.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = pf("train-chassis"),
        order = "a[" .. pf("train-chassis") .. "]",
        stack_size = 5,
        subgroup = pf("intermediates"),
        type = "item"
    },
    recipe = {
        name = pf("train-chassis"),
        result = pf("train-chassis"),
        ingredients = {
            {"iron-gear-wheel", 5},
            {"steel-plate", 10},
        },
    },
    tech = "railway",
}

data:extend({chassis.item})
create_simple_recipe(chassis.recipe)
unlock_recipe_with_tech(chassis.name, chassis.tech)

modify_ingredients({
    name = "cargo-wagon",
    ingredients = {
        {chassis.name, 1},
        {"iron-gear-wheel", 5}, -- Down from 10
        {"iron-plate", 20},
        {"steel-plate", 10}, -- Down from 20
    },
})
modify_ingredients({
    name = "fluid-wagon",
    ingredients = {
        {"cargo-wagon", 1},
        {"pipe", 3}, -- Down from 8
        {"steel-plate", 2}, -- Down from 16
        -- {"iron-gear-wheel", 10},
        -- {"storage-tank", 1},
    },
})
modify_ingredients({
    name = "locomotive",
    ingredients = {
        {chassis.name, 1},
        {"engine-unit", 20},
        {"electronic-circuit", 10},
        {"steel-plate", 18}, -- Down from 30
    },
})
