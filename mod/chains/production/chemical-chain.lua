require("data-util")

-- -------------- --
-- Chemical Chain --
-- -------------- --
-- assembler 2 -> chemical plant -> oil refinery

modify_ingredients({
    name = "assembling-machine-2",
    normal = {
        ingredients = {
            {"steel-plate", 2},
            {"electronic-circuit", 3},
            {"iron-gear-wheel", 4}, -- Down from 5
            {"assembling-machine-1", 1},
            {"pipe", 2},
        },
    },
    expensive = {
        ingredients = {
            {"steel-plate", 5},
            {"electronic-circuit", 5},
            {"iron-gear-wheel", 8}, -- Down from 10
            {"assembling-machine-1", 1},
            {"pipe", 4},
        },
    },
})
modify_ingredients({
    name = "chemical-plant",
    ingredients = {
        {"assembling-machine-2", 1},
        {"steel-plate", 3}, -- Down from 5
        {"electronic-circuit", 2}, -- Down from 5
        {"pipe", 5}, -- Down from 5
        -- {"iron-gear-wheel", 5},
    },
})
modify_ingredients({
    name = "oil-refinery",
    ingredients = {
        {"chemical-plant", 1},
        {"steel-plate", 10}, -- Down from 15
        {"iron-gear-wheel", 5}, -- Down from 10
        {"stone-brick", 10},
        {"electronic-circuit", 5}, -- Down from 10
        {"pipe", 5}, -- Down from 10
    },
})
