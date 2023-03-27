require("data-util")

-- ---------------- --
-- Combinator Chain --
-- ---------------- --
-- red + green wire -> constant combinator -+-> arithmatic combinator
--                                          +-> decider combinator -> programmable speaker
--                                          +-> power switch

-- {
--     name = "green-wire",
--     ingredients = {
--         {"electronic-circuit", 1},
--         {"copper-cable", 1},
--     },
-- }
-- {
--     name = "red-wire",
--     ingredients = {
--         {"electronic-circuit", 1},
--         {"copper-cable", 1},
--     },
-- }
modify_ingredients({
    name = "constant-combinator",
    ingredients = {
        {"green-wire", 1},
        {"red-wire", 1},
        {"copper-cable", 3}, -- Down from 5
        -- {"electronic-circuit", 2},
    },
})
modify_ingredients({
    name = "arithmetic-combinator",
    ingredients = {
        {"constant-combinator", 1},
        {"electronic-circuit", 3}, -- Down from 5
        -- {"copper-cable", 5},
      },
})
modify_ingredients({
    name = "decider-combinator",
    ingredients = {
        {"constant-combinator", 1},
        {"electronic-circuit", 3}, -- Down from 5
        -- {"copper-cable", 5},
    },
})
modify_ingredients({
    name = "power-switch",
    ingredients = {
        {"constant-combinator", 1},
        {"iron-plate", 5},
        -- {"copper-cable", 5},
        -- {"electronic-circuit", 2},
    },
})
modify_ingredients({
    name = "programmable-speaker",
    ingredients = {
        {"decider-combinator", 1},
        {"iron-plate", 2}, -- Down from 3
        {"iron-stick", 2}, -- Down from 4
        -- {"copper-cable", 5},
        -- {"electronic-circuit", 4},
    },
})
