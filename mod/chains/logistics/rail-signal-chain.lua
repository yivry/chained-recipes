require("data-util")

-- ----------------- --
-- Rail Signal Chain --
-- ----------------- --
-- lamp -> rail signal -> rail chain signal

add_prereq_to_tech("optics", "rail-signals")

modify_ingredients({
    name = "small-lamp",
    ingredients = {
        {"electronic-circuit", 1},
        {"copper-cable", 2}, -- Down from 3
        {"iron-plate", 1},
    },
})
modify_ingredients({
    name = "rail-signal",
    ingredients = {
        {"small-lamp", 1},
        {"electronic-circuit", 1},
        -- {"iron-plate", 5},
    },
})
modify_ingredients({
    name = "rail-chain-signal",
    ingredients = {
        {"rail-signal", 1},
        {"copper-cable", 2},
        -- {"electronic-circuit", 1},
        -- {"iron-plate", 5},
    },
})
