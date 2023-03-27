require("data-util")

-- -------------- --
-- Inserter Chain --
-- -------------- --
-- burner inserter -> inserter -> as usual

-- {
--     name = "burner-inserter",
--     ingredients = {
--         {"iron-plate", 1},
--         {"iron-gear-wheel", 1},
--     },
-- }
modify_ingredients({
    name = "inserter",
    ingredients = {
        {"burner-inserter", 1},
        {"electronic-circuit", 1},
        -- {"iron-plate", 1},
        -- {"iron-gear-wheel", 1},
    },
})
