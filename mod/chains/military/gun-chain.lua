require("data-util")

-- ------------------- --
-- Gun Chain: Physical --
-- ------------------- --
-- pistol -+-> submachine gun -> gun turret
--         +-> shotgun -> combat shotgun

add_prereq_to_tech("military", "gun-turret")

-- {
--     name = "pistol",
--     ingredients = {
--         {"copper-plate", 5},
--         {"iron-plate", 5},
--     },
-- }
modify_ingredients({
    name = "submachine-gun",
    normal = {
        ingredients = {
            {"pistol", 1},
            {"iron-gear-wheel", 10},
            {"iron-plate", 5},
            -- {"copper-plate", 5},
        },
    },
    expensive = {
        ingredients = {
            {"pistol", 2},
            {"iron-gear-wheel", 15},
            {"copper-plate", 10}, -- Down from 20
            {"iron-plate", 20}, -- Down from 30
        },
    },
})
modify_ingredients({
    name = "gun-turret",
    ingredients = {
        {"submachine-gun", 1},
        {"copper-plate", 5}, -- Down from 10
        {"iron-plate", 10}, -- Down from 20
        -- {"iron-gear-wheel", 10},
    },
})

modify_ingredients({
    name = "shotgun",
    ingredients = {
        {"pistol", 1},
        {"iron-plate", 10}, -- Down from 15
        {"iron-gear-wheel", 5},
        {"copper-plate", 5}, -- Down from 10
        {"wood", 5},
    },
})
modify_ingredients({
    name = "combat-shotgun",
    ingredients = {
        {"shotgun", 2},
        {"steel-plate", 6}, -- Down from 15
        -- {"copper-plate", 10},
        -- {"iron-gear-wheel", 5},
        -- {"wood", 10},
    },
})

-- --------------- --
-- Gun Chain: Fire --
-- --------------- --
-- flamethrower -> flamethrower turret

-- {
--     ingredients = {
--         name = "flamethrower",
--         {"steel-plate", 5},
--         {"iron-gear-wheel", 10},
--     },
-- }
modify_ingredients({
    name = "flamethrower-turret",
    ingredients = {
        {"flamethrower", 1},
        {"steel-plate", 25}, -- Down from 30
        {"iron-gear-wheel", 5}, -- Down from 15
        {"pipe", 10},
        {"engine-unit", 5},
    },
})
