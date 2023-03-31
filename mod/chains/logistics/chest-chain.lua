require("data-util")

-- ----------- --
-- Chest Chain --
-- ----------- --
-- steel chest -+-> storage chest -> requester chest -> buffer chest
--              +-> passive provider -> active provider

modify_ingredients({
    name = "logistic-chest-storage",
    ingredients = {
        {"steel-chest", 1},
        {"electronic-circuit", 2}, -- Down from 3
        {"advanced-circuit", 1},
    },
})
modify_ingredients({
    name = "logistic-chest-requester",
    ingredients = {
        {"logistic-chest-storage", 1},
        {"electronic-circuit", 1}, -- Down from 3
        -- {"steel-chest", 1},
        -- {"advanced-circuit", 1},
    },
})
modify_ingredients({
    name = "logistic-chest-buffer",
    ingredients = {
        {"logistic-chest-requester", 1},
        {"electronic-circuit", 1}, -- Down from 3
        -- {"steel-chest", 1},
        -- {"advanced-circuit", 1},
    },
})
modify_ingredients({
    name = "logistic-chest-passive-provider",
    ingredients = {
        {"steel-chest", 1},
        {"electronic-circuit", 2}, -- Down from 3
        {"advanced-circuit", 1},
    },
})
modify_ingredients({
    name = "logistic-chest-active-provider",
    ingredients = {
        {"logistic-chest-passive-provider", 1},
        {"electronic-circuit", 1}, -- Down from 3
        -- {"steel-chest", 1},
        -- {"advanced-circuit", 1},
    },
})
