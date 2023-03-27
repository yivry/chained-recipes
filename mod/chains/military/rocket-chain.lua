require("data-util")

-- ------------ --
-- Rocket Chain --
-- ------------ --
-- rocket -> explosive rocket -> atomic bomb

remove_prereq_from_tech("rocketry", "atomic-bomb")
add_prereq_to_tech("explosive-rocketry", "atomic-bomb")

-- {
--     name = "rocket",
--     ingredients = {
--         {"electronic-circuit", 1},
--         {"explosives", 1},
--         {"iron-plate", 2},
--     },
-- }
-- {
--     name = "explosive-rocket",
--     ingredients = {
--         {"rocket", 1},
--         {"explosives", 2},
--     },
-- }
modify_ingredients({
    name = "atomic-bomb",
    ingredients = {
        {"explosive-rocket", 1},
        {"rocket-control-unit", 10},
        {"explosives", 7}, -- Down from 10
        {"uranium-235", 30},
    },
})
