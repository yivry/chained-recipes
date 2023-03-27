require("data-util")

-- ----------- --
-- Shell Chain --
-- ----------- --
-- cannon shell -> explosive cannon shell -> artillery shell

-- {
--     name = "cannon-shell",
--     normal = {
--         ingredients = {
--             {"steel-plate", 2},
--             {"plastic-bar", 2},
--             {"explosives", 1},
--         },
--     },
--     expensive = {
--         ingredients = {
--             {"steel-plate", 4},
--             {"plastic-bar", 4},
--             {"explosives", 1},
--         },
--     },
-- }
modify_ingredients({
    name = "explosive-cannon-shell",
    normal = {
        ingredients = {
            {"cannon-shell", 1},
            {"explosives", 1}, -- Down from 2
            -- {"steel-plate", 2},
            -- {"plastic-bar", 2},
        },
    },
    expensive = {
        ingredients = {
            {"cannon-shell", 1},
            {"explosives", 1}, -- Down from 2
            -- {"steel-plate", 4},
            -- {"plastic-bar", 4},
        },
    },
})
